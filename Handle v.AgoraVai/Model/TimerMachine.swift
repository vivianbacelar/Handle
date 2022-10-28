//
//  TimerMachine.swift
//  Bubblin
//
//  Created by Felipe Gameleira on 10/10/22.
//

import Foundation

class TimerMachine: ObservableObject{

    static let instance = TimerMachine()

    @Published var totalTimeInseconds: TimeInterval = 0
    
    private var originalTotalTimeInseconds: TimeInterval = 0
    var seconds:Int { Int(totalTimeInseconds) % 60 }
    var minutes:Int { Int(totalTimeInseconds / 60) }
    private var timer: Timer? = nil
    var isStopped:Bool {timer == nil}
    
    var onEnd:()->Void = {}
    
    
    private init() {}
    
    func start(){
        guard isStopped else {return}
        totalTimeInseconds = originalTotalTimeInseconds
//        print(#function, "Começô")
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            if self.totalTimeInseconds == 0 {
                self.timer?.invalidate()
                self.timer = nil
                self.onEnd()
//                print(#function, "Cabô ")
                return
            } // else
            self.totalTimeInseconds -= 1
        })
    }
    func stop(){
        self.timer?.invalidate()
        self.timer = nil
    }

    func set(totalTime:TimeInterval) {
        originalTotalTimeInseconds = totalTime
        totalTimeInseconds = totalTime
    }

    func set(onEnd:@escaping ()->Void) {
        self.onEnd = onEnd
    }

    @discardableResult
    func setup(totalTime:TimeInterval, onEnd:@escaping ()->Void)->TimerMachine {
        self.set(onEnd: onEnd)
        set(totalTime: totalTime)
        timer?.invalidate()
        timer = nil
        return self
    }
    
}

