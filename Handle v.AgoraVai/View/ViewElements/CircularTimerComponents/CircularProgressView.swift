//
//  CircularProgressView2.swift
//  Circular Timer
//
//  Created by Ricardo Venieris on 02/11/22.
//

import UIKit

class CircularProgressView: UIView {

    private var label = UILabel()
    private let foregroundLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()

    public var lineWidth: CGFloat = 12.0 {
        didSet {
            foregroundLayer.lineWidth = lineWidth
            backgroundLayer.lineWidth = lineWidth
        }
    }
    
        /// Text to be displayed in the middle
    public var text: String? {
        get { label.text }
        set { label.text = newValue }
    }
    
        /// Attributed text to be displayed inside of progress bar
    public var attributedText: NSAttributedString? {
        get { label.attributedText }
        set { label.attributedText = newValue }
    }
    
        /// Color for backgorund/base bar
    public var backgroundBarColor = UIColor.systemGray
    
        /// Color for foreground/main bar
    public var foregroundBarColor = UIColor.systemBlue
    
        /// Color for maximum value (100%) of the bar
    public var maximumBarColor = UIColor.systemRed
    
        /// Duration of the "filling" animation
    public var animationDuration = TimeInterval(1.0)
    
        /// Color for text inside progress bar
    public var textColor = UIColor.darkGray
    
        /// Font size for text inside progress bar
    public var textSize = CGFloat(16.0)
    
        /// Animation Acceleration time function name
    var timingFunction: CAMediaTimingFunctionName = .linear
    
    var progressValue:Double = 0
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        backgroundColor = .clear
        setupBars()
        setupPercentageLabel()
    }
        /// Set the visual impression of progress on this UIView
        ///
        /// - Parameters:
        ///   - progress: normalized value from range [0,1] however upper bound will be clamped
        ///   - animated: Switch animations on/off
    public func setProgress(to progress: Double, animated: Bool) {
        foregroundLayer.strokeEnd = CGFloat(progress.clamped(to: 0...1))
        setColor(by: progress)
        
        if animated {
            progressAnimation(progress)
        } else {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            foregroundLayer.strokeEnd = CGFloat(progress.clamped(to: 0...1))
            CATransaction.commit()
        }
    }
}

    // MARK: - Animation
private extension CircularProgressView {
    func progressAnimation(_ progress: Double) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = progressValue
        animation.toValue = progress
        animation.duration = animationDuration
        animation.fillMode = .forwards
        animation.timingFunction = CAMediaTimingFunction(name: timingFunction)
        animation.isRemovedOnCompletion = false
        progressValue = progress
        foregroundLayer.add(animation, forKey: "foregroundAnimation")
    }
}

    // MARK: - Setup bars
private extension CircularProgressView {
    func setupBars(){
        setupBackgroundLayer()
        setupForegroundLayer()
    }
    
    func setupBackgroundLayer() {
        let path = CGMutablePath()
        path.addPath(circularPath.cgPath)
        
        backgroundLayer.path = path
        backgroundLayer.lineWidth = lineWidth
        backgroundLayer.strokeColor = backgroundBarColor.cgColor
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.position = pathCenter
        backgroundLayer.transform = CATransform3DMakeRotation(rotationAngle, 0, 0, 1)
        
        layer.addSublayer(backgroundLayer)
    }
    
    func setupForegroundLayer() {
        let path = CGMutablePath()
        path.addPath(circularPath.cgPath)
        
        foregroundLayer.path = path
        foregroundLayer.lineWidth = lineWidth
        foregroundLayer.fillColor = UIColor.clear.cgColor
        foregroundLayer.position = pathCenter
        foregroundLayer.transform = CATransform3DMakeRotation(rotationAngle, 0, 0, 1)
        foregroundLayer.strokeEnd = 0
        
        layer.addSublayer(foregroundLayer)
    }
    
    func setColor(by progress: Double) {
        foregroundLayer.strokeColor = (progress >= 1.0) ? maximumBarColor.cgColor : foregroundBarColor.cgColor
    }
}

    // MARK: - Setup label
private extension CircularProgressView {
    func setupPercentageLabel() {
        label.textAlignment = .center
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: textSize)
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        [label.centerXAnchor.constraint(equalTo: centerXAnchor),
         label.centerYAnchor.constraint(equalTo: centerYAnchor)].forEach { $0.isActive = true }
    }
}

    // MARK: - Calculations & helpers
private extension CircularProgressView {
    var circularPath: UIBezierPath {
        return UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
    }
    
    var radius: CGFloat {
        let availableSpace = min(frame.width, frame.height)
        return (availableSpace - lineWidth).half
    }
    
    var pathCenter: CGPoint {
        CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    var rotationAngle: CGFloat {
        -CGFloat.pi.half
    }
}


/*
 ## Available properties
 
 ##### lineWidth
 Size of the bar (stroke width) - default value is `CGFloat(12.0)`
 ```swift
 // Change stroke to 18
 bar.lineWidth = CGFloat(18.0)
 ```
 
 ##### text
 Text to be displayed in the middle - default value is `nil`
 ```swift
 // Set the text inside progress view
 bar.text = "Calories intake"
 ```
 
 ##### attributedText
 Attributed text to be displayed in the middle - default value is `nil`
 ```swift
 // Set the attributed text inside progress view
 bar.attributedText = "Calories intake"
 ```
 
 ##### textColor
 Color for text inside progress bar when no `attributedText` is used - default value is `UIColor.darkGray`
 ```swift
 // Set the color for text inside progress view
 bar.textColor = .systemRed
 ```
 
 ##### textSize
 Font size for text inside progress bar - default value is `CGFloat(16.0)`
 ```swift
 // Set the font size of text inside progress view
 bar.textSize = CGFloat(20)
 ```
 
 ##### backgroundBarColor
 Color for background (base) track - default value is `UIColor.systemGray`
 ```swift
 // Set the background color of track
 bar.backgroundBarColor = .white
 ```
 
 ##### foregroundBarColor
 Color for foreground (main) track - default value is `UIColor.systemBlue`
 ```swift
 // Set the foreground color of track
 bar.foregroundBarColor = .yellow
 ```
 
 ##### maximumBarColor
 Color for the foreground (main) track when it reaches the maximum value (full circle) - default value is `UIColor.systemRed`
 ```swift
 // Set the color of track when full circle is drawn
 bar.maximumBarColor = .orange
 ```
 
 ##### animationDuration
 Duration of the "filling" animation - default value is `TimeInterval(1.0)`
 ```swift
 // Make the animations slow like in the demo bellow
 bar.animationDuration = TimeInterval(3.0)
 ```
 
 ## Available functions
 
 ##### setProgress(to:animated:)
 ```swift
 /// Set the visual impression of progress on this UIView
 ///
 /// - Parameters:
 ///   - progress: normalized value from range [0,1] however upper bound will be clamped
 ///   - animated: Switch animations on/off
 public func setProgress(to progress: Double, animated: Bool)
 ```
 */
