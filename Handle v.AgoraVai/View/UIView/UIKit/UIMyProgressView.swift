//
//  UIMyProgressView.swift
//  Handle v.AgoraVai
//
//  Created by Alexandre César Brandão de Andrade on 01/11/22.
//

import UIKit

class UIMyProgressView:UIView {


    private let duration:Double
    private var progressBar:UIView

    init(frame: CGRect, duration: Double) {
        self.duration = duration
        self.progressBar = UIView(frame: frame)
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        self.backgroundColor?.withAlphaComponent(0.5)

        self.progressBar.backgroundColor = .blue
        self.progressBar.layer.zPosition = 1000
//        self.progressBar.frame.size.width = 10



    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.addSubview(progressBar)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func start() {
        UIView.animate(withDuration:duration) {
            self.progressBar.frame.size.width = self.frame.size.width
        }

    }
}


