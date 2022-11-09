//
//  CountDownView.swift
//  Circular Timer
//
//  Created by Ricardo Venieris on 02/11/22.
//

import Foundation
import UIKit

class CircularCountDownView: UIView {

    var time:TimeInterval { didSet { restartIfRunning() } }
    var step:Double
    var ring:CircularProgressView
    var onEnd:()->Void

    private var timer:Timer? = nil
    var remainingTime:TimeInterval
    var remainingPercentage:Double {1 - (remainingTime/time)}

    init(frame:CGRect, time: TimeInterval, step: Double, onEnd:@escaping ()->Void = {}) {
        self.time = time
        self.step = step
        self.ring = CircularProgressView(frame: frame)
        self.onEnd = onEnd
        self.remainingTime = time
        super.init(frame: frame)
        
        ring.text = time.precision(step)
        ring.animationDuration = step
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        addSubview(ring)
        ring.translatesAutoresizingMaskIntoConstraints = false
        ring.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        ring.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        ring.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        ring.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func start() {
        killTimer()
        timer = Timer.scheduledTimer(withTimeInterval: step, repeats: true,
                                     block: { [self] timer in
            remainingTime = max((remainingTime - step),0)
            onStep()
            print(remainingTime)
            guard remainingTime > 0 else {
                killTimer()
                return
            }
        })
    }
    
    func stop() {
        killTimer()
        remainingTime = time
    }
    
    func restart() {
        stop()
        start()
    }

    func restartIfRunning() {
        if let _ = timer {
            stop()
            start()
        }
    }

    private func onStep() {
        DispatchQueue.main.async { [self] in
            ring.setProgress(to: remainingPercentage, animated: true)
            ring.text = remainingTime.precision(step)
        }
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }

}

