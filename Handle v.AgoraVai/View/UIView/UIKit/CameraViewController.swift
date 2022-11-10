import UIKit
import AVFoundation
import Vision
import SwiftUI

class CameraViewController: UIViewController {
    private var cameraView: CameraView { view as! CameraView }

    // swiftlint:disable:previous force_cast
    private let videoDataOutputQueue = DispatchQueue(label: "CameraFeedDataOutput", qos: .userInteractive)
    private var cameraFeedSession: AVCaptureSession?
    private var handPoseRequest: VNDetectHumanHandPoseRequest = {
        // 1
        let request = VNDetectHumanHandPoseRequest()
        // 2
        request.maximumHandCount = 2
        return request
    }()
    private let drawOverlay = UIView()
    private let initialView = UIView()
    private let drawPath = UIBezierPath()
    private var evidenceBuffer = [HandGestureProcessor.PointsPair]()
    private var lastDrawPoint: CGPoint?
    private var isFirstSegment = true
    private var lastObservationTimestamp = Date()
    private var gestureProcessor = HandGestureProcessor()
    private var handHandler = HandHandler()
    private var screenRect: CGRect! = nil  // for view dimensions
    private var forceLandscape: Bool = false
    private var lb = UILabel()
    private let shape = CAShapeLayer() // timer circle
    lazy var startNumber = 4 // inicio timer
    private let totalDisplay = terapies.compactMap{$0.timetoDisplay}.reduce(0,+)
    var index = 0
    let circleTimer = CircularCountDownView(frame: CGRect(x: 20, y: 20, width: 60, height: 60), time: 484.0, step: 1.0) // ajustar tempo depois




    fileprivate func setupProgressView() {
        circleTimer.ring.backgroundBarColor = .lightGray
        circleTimer.ring.foregroundBarColor = .white
        circleTimer.ring.maximumBarColor = .orange
        circleTimer.ring.lineWidth = 5
        circleTimer.ring.textSize = 2
        circleTimer.ring.textColor = .systemRed
        drawOverlay.addSubview(circleTimer)

    }


    fileprivate let congratsView = UIHostingController(rootView: CongratsView())



    fileprivate func setupCongratsHC() {
        addChild(congratsView)
        view.addSubview(congratsView.view)
        congratsView.didMove(toParent: self)
    }

    fileprivate func setupCongratsConstraints(){

        if #available(iOS 16.0, *) {

            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene

            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))

        }

        congratsView.view.frame = view.layer.bounds

    }

    private var textView: UITextView = {
        var textView = UITextView(frame: CGRect(x: 20.0, y: 1000, width: 694, height: 250))
//        textView.contentInsetAdjustmentBehavior = .

        textView.textAlignment = NSTextAlignment.center
        textView.backgroundColor = .clear

        // Update UITextView font size and colour
        textView.font = UIFont.systemFont(ofSize: 36)
        textView.font = UIFont(name: "Montserrat-Medium", size: 36)
        textView.textColor = .white

        // Make UITextView Editable
        textView.isEditable = false
        textView.isHidden = true
        textView.text = terapies[0].text
        return textView
    }()

    // When you are ready do this command...
    private var textViewTwo: UITextView = {
        var textViewTwo = UITextView(frame: CGRect(x: 46, y:33, width: 534, height: 100))
        textViewTwo.contentInsetAdjustmentBehavior = .automatic

        textViewTwo.textAlignment = NSTextAlignment.justified
        textViewTwo.backgroundColor = .clear

        // Update UITextView font size and colour
        textViewTwo.font = UIFont.systemFont(ofSize: 24)
        textViewTwo.font = UIFont(name: "Montserrat-Bold", size: 24)
        textViewTwo.textColor = .white

        // Make UITextView web links clickable
        textViewTwo.isSelectable = true
        textViewTwo.isEditable = false
        textViewTwo.dataDetectorTypes = UIDataDetectorTypes.link

        // Make UITextView corners rounded
        textViewTwo.layer.cornerRadius = 10

        // Make UITextView Editable
        //        textViewTwo.isEditable = true
        textViewTwo.isHidden = false
        textViewTwo.text = "when you are ready, do this command with both hands to start"
        //        textView.text = Terapy.expand.frases[Terapy.expand.count[0]]
        return textViewTwo
    }()

    private var textViewThree: UITextView = {
        var textViewThree = UITextView()
        textViewThree.contentInsetAdjustmentBehavior = .automatic
        textViewThree.translatesAutoresizingMaskIntoConstraints = false
        textViewThree.textAlignment = NSTextAlignment.justified
        textViewThree.backgroundColor = .clear

        // Update UITextView font size and colour
        textViewThree.font = UIFont.systemFont(ofSize: 24)
        textViewThree.font = UIFont(name: "Montserrat-Bold", size: 24)
        textViewThree.textColor = .white

        // Make UITextView Editable
        textViewThree.isHidden = false
        textViewThree.text = "Preferably sit with your feet on the floor"
        //        textView.text = Terapy.expand.frases[Terapy.expand.count[0]]
        return textViewThree
    }()

    var hands: UIImageView = {
        let imageName = "hands1"
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hands1")
        imageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view

        return imageView
    }()


    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(98)
        label.textColor = .white
        return label
    }()

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        forceLandscape ? .landscapeLeft : .portrait
    }


    func timerEnded(){
        index += 1
        guard index < terapies.count-50 else {
            drawOverlay.removeFromSuperview()
            initialView.removeFromSuperview()
            setupCongratsHC()
            setupCongratsConstraints()

            self.inExercise.wrappedValue = false

            return
        }
        DispatchQueue.main.async {
            self.textView.text = terapies[self.index].text


        }
        TimerMachine.instance.set(totalTime: terapies[self.index].timetoDisplay)
        TimerMachine.instance.start()

    }


    var inExercise:Binding<Bool>
    init(inExercise: Binding<Bool>) {
        self.inExercise = inExercise
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func handsConstraints() {
        hands.widthAnchor.constraint(equalToConstant: 249).isActive = true
        hands.heightAnchor.constraint(equalToConstant: 128).isActive = true
        hands.centerXAnchor.constraint(equalTo: initialView.centerXAnchor).isActive = true
        hands.centerYAnchor.constraint(equalTo: initialView.centerYAnchor, constant: 28).isActive = true
    }

    func textThreeConstraints() {
        textViewThree.widthAnchor.constraint(equalToConstant: 511).isActive = true
        textViewThree.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textViewThree.centerXAnchor.constraint(equalTo: initialView.centerXAnchor).isActive = true
        textViewThree.centerYAnchor.constraint(equalTo: initialView.lastBaselineAnchor, constant: -40).isActive = true
        //        initialView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }



    override func viewDidLoad() {
//        print(totalDisplay)
        self.view = CameraView(frame: self.view.frame, showOverlay: false)
        initialView.frame = cameraView.layer.bounds
        drawOverlay.frame = cameraView.layer.bounds
        drawOverlay.isHidden = true

        initialView.addSubview(numberLabel)
        setupProgressView()




        let circlePath = UIBezierPath(arcCenter: initialView.center, radius: 150, startAngle: 0, endAngle: .pi*2, clockwise: true)

        shape.path = circlePath.cgPath // momentaneo
        shape.lineWidth = 15
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0


        initialView.layer.addSublayer(shape)



        super.viewDidLoad()
        // This sample app detects one hand only.
        // Add state change handler to hand gesture processor.
        gestureProcessor.didChangeStateClosure = { [weak self] state in
            self?.handleGestureStateChange(state: state)
        }
        // Add double tap gesture recognizer for clearing the draw path.
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        recognizer.numberOfTouchesRequired = 1
        recognizer.numberOfTapsRequired = 2
        view.addGestureRecognizer(recognizer)

        initialView.addSubview(textViewTwo)
        initialView.addSubview(hands)
        initialView.addSubview(textViewThree)
        drawOverlay.addSubview(textView)
        textView.center = drawOverlay.center
        drawOverlay.addSubview(numberLabel)

        handsConstraints() //This function is outside the viewDidLoad function that controls the constraints
        textThreeConstraints()

        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: drawOverlay.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: drawOverlay.centerYAnchor)
        ])


    }

    @objc func animationClock() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        shape.add(animation, forKey:"animation")
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        screenRect = UIScreen.main.bounds
        cameraView.previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)


        switch UIDevice.current.orientation{
            // Home button on top
        case UIDeviceOrientation.portraitUpsideDown:
            cameraView.previewLayer.connection?.videoOrientation = .portrait

            // Home button on right
        case UIDeviceOrientation.landscapeLeft:

            cameraView.previewLayer.connection?.videoOrientation = .portrait

        case UIDeviceOrientation.landscapeRight:

            textView.center = cameraView.center
            cameraView.previewLayer.connection?.videoOrientation = .portrait

        case UIDeviceOrientation.portrait:
            textView.isHidden = true
            cameraView.previewLayer.connection?.videoOrientation = .portrait

        default:
            cameraView.previewLayer.connection?.videoOrientation = .portrait
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        initialView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(initialView)
        initialView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        initialView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        initialView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        initialView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        drawOverlay.translatesAutoresizingMaskIntoConstraints = false
        initialView.addSubview(drawOverlay)
        drawOverlay.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        drawOverlay.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        drawOverlay.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        drawOverlay.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true







    }

    override func viewDidAppear(_ animated: Bool){
        TimerMachine.instance.setup(totalTime: 3, onEnd: timerEnded)


        super.viewDidAppear(animated)
        do {
            if cameraFeedSession == nil {
                cameraView.previewLayer.videoGravity = .resizeAspectFill
                try setupAVSession()
                cameraView.previewLayer.session = cameraFeedSession
            }
            DispatchQueue.global(qos: .utility).async {
                self.cameraFeedSession?.startRunning()

            }
        } catch {
            AppError.display(error, inViewController: self)
        }



        if #available(iOS 16.0, *) {
            self.forceLandscape = true
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            self.setNeedsUpdateOfSupportedInterfaceOrientations()
            DispatchQueue.main.asyncAfter(deadline: .now() , execute: {

                self.cameraView.previewLayer.connection!.videoOrientation = .landscapeLeft

                windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeLeft)){
                    error in

                }
            })

        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.initialView.removeFromSuperview()
        self.cameraView.removeFromSuperview()
        self.view.removeFromSuperview()


        super.viewDidDisappear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        cameraFeedSession?.stopRunning()
        super.viewWillDisappear(animated)
    }

    func setupAVSession() throws {
        // Select a front facing camera, make an input.
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
            throw AppError.captureSessionSetup(reason: "Could not find a front facing camera.")
        }
        guard let deviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {
            throw AppError.captureSessionSetup(reason: "Could not create video device input.")
        }
        let session = AVCaptureSession()
        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.high
        // Add a video input.
        guard session.canAddInput(deviceInput) else {
            throw AppError.captureSessionSetup(reason: "Could not add video device input to the session")
        }
        session.addInput(deviceInput)
        let dataOutput = AVCaptureVideoDataOutput()
        if session.canAddOutput(dataOutput) {
            session.addOutput(dataOutput)
            // Add a video data output.
            dataOutput.alwaysDiscardsLateVideoFrames = true
            dataOutput.videoSettings =
            [kCVPixelBufferPixelFormatTypeKey
             as String: Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)]
            dataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
        } else {
            throw AppError.captureSessionSetup(reason: "Could not add video data output to the session")
        }
        session.commitConfiguration()
        cameraFeedSession = session
    }

    func processPoints(thumbTip: CGPoint?, indexTip: CGPoint?) {
        // Check that we have both points.
        guard let thumbPoint = thumbTip, let indexPoint = indexTip else {
            // If there were no observations for more than 2 seconds reset gesture processor.
            if Date().timeIntervalSince(lastObservationTimestamp) > 2 {
                gestureProcessor.reset()
            }
            cameraView.showPoints([], color: .clear)
            return
        }
        // Convert points from AVFoundation coordinates to UIKit coordinates.
        let previewLayer = cameraView.previewLayer
        let thumbPointConverted = previewLayer.layerPointConverted(fromCaptureDevicePoint: thumbPoint)
        let indexPointConverted = previewLayer.layerPointConverted(fromCaptureDevicePoint: indexPoint)
        // Process new points
        gestureProcessor.processPointsPair((thumbPointConverted, indexPointConverted))
    }

    private func handleGestureStateChange(state: HandGestureProcessor.State) {
        let pointsPair = gestureProcessor.lastProcessedPointsPair
        var tipsColor: UIColor
        switch state {
        case .possiblePinch, .possibleApart:
            // We are in one of the "possible": states, meaning there is not enough evidence yet to determine
            // if we want to draw or not. For now, collect points in the evidence buffer, so we can add them
            // to a drawing path when required.
            evidenceBuffer.append(pointsPair)
            tipsColor = .orange
        case .pinched:
            // We have enough evidence to draw. Draw the points collected in the evidence buffer, if any.
            for bufferedPoints in evidenceBuffer {
                updatePath(with: bufferedPoints, isLastPointsPair: false)
            }
            // Clear the evidence buffer.
            evidenceBuffer.removeAll()
            // Finally, draw the current point.
            updatePath(with: pointsPair, isLastPointsPair: false)
            tipsColor = .green
        case .apart, .unknown:
            // We have enough evidence to not draw. Discard any evidence buffer points.
            evidenceBuffer.removeAll()
            // And draw the last segment of our draw path.
            updatePath(with: pointsPair, isLastPointsPair: true)
            tipsColor = .red
        }
        cameraView.showPoints([[pointsPair.thumbTip, pointsPair.indexTip]], color: tipsColor)
    }

    private func updatePath(with points: HandGestureProcessor.PointsPair, isLastPointsPair: Bool) {
        // Get the mid point between the tips.
        let (thumbTip, indexTip) = points
        let drawPoint = CGPoint.midPoint(pt1: thumbTip, pt2: indexTip)

        if isLastPointsPair {
            if let lastPoint = lastDrawPoint {
                // Add a straight line from the last midpoint to the end of the stroke.
                drawPath.addLine(to: lastPoint)
            }
            // We are done drawing, so reset the last draw point.
            lastDrawPoint = nil
        } else {
            if lastDrawPoint == nil {
                // This is the beginning of the stroke.
                drawPath.move(to: drawPoint)
                isFirstSegment = true
            } else {
                let lastPoint = lastDrawPoint!
                // Get the midpoint between the last draw point and the new point.
                let midPoint = CGPoint.midPoint(pt1: lastPoint, pt2: drawPoint)
                if isFirstSegment {
                    // If it's the first segment of the stroke, draw a line to the midpoint.
                    drawPath.addLine(to: midPoint)
                    isFirstSegment = false
                } else {
                    // Otherwise, draw a curve to a midpoint using the last draw point as a control point.
                    drawPath.addQuadCurve(to: midPoint, controlPoint: lastPoint)
                }
            }
            // Remember the last draw point for the next update pass.
            lastDrawPoint = drawPoint
        }
        // Update the path on the overlay layer.
        //        drawOverlay.path = drawPath.cgPath
    }

    @IBAction func handleGesture(_ gesture: UITapGestureRecognizer) {
        guard gesture.state == .ended else {
            return
        }
        evidenceBuffer.removeAll()
        drawPath.removeAllPoints()
        //        drawOverlay.path = drawPath.cgPath
    }
    var pointGroups: [[VNRecognizedPoint?]] =
    [[], [], [], [], [], [], [], [], [], [], [], [], [], [],
     [], [], [], [], [], [], [], [], [], [], [], [], [], [],
     [], [], [], [], [], [], []]

}
extension CameraViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    fileprivate func processFinger(_ fingerPointsReal: [VNRecognizedPoint?], id: Int, confidenceLevel: VNConfidence) {
        for (index, ossinho) in fingerPointsReal.enumerated() {
            //            print(index,pointGroups.count, pointGroups[id].count)
            guard let ossinho = ossinho, ossinho.confidence >= confidenceLevel else {
                continue
            }
            if self.pointGroups[id].count <= index {
                self.pointGroups[id].append(ossinho)
            } else {
                self.pointGroups[id][index] = ossinho
            }


        }


    }
    func normalize(nodes: [[VNRecognizedPoint?]], for handIsLeft: Bool) -> CGPoint {
        let range = handIsLeft ? 0...4 : 5...9
        var nodes: [CGPoint] = []
        for ind in range {
            nodes.append(contentsOf: pointGroups[ind].compactMap {$0?.location})
        }
        //        print(nodes)
        return nodes.normalize().sumAll()
    }
    public func captureOutput(_ output: AVCaptureOutput,
                              didOutput sampleBuffer: CMSampleBuffer,
                              from connection: AVCaptureConnection) {
        let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .up, options: [:])
        do {
            // Perform VNDetectHumanHandPoseRequest
            try handler.perform([handPoseRequest])
            // Continue only when a hand was detected in the frame.
            // Since we set the maximumHandCount property of the request to 1, there will be at most one observation.
            guard let observations = handPoseRequest.results else {
                DispatchQueue.main.sync {
                    cameraView.showPoints([], color: .red)
                }
                return
            }
            for (ind, observation) in observations.enumerated() {
                HGR.isHandOpen(hand: observation, onHandOpen: {
                    DispatchQueue.main.async {
                        self.drawOverlay.superview?.bringSubviewToFront(self.drawOverlay)
                    }
                })
                if HGR.handOpenCount > 100 {   // comeca a atividade apos chegar a 100
                    DispatchQueue.main.async{
                        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (time) in
                            self.startNumber -= 1
                            self.numberLabel.alpha = 1
                            if self.startNumber ==  0{
                                self.numberLabel.isHidden = true
                                TimerMachine.instance.start()
                                self.textView.isHidden = false
                                self.circleTimer.start()

                            }
                            UIView.animate(withDuration: 1, delay: 0.01, options:.curveEaseInOut, animations: {
                                self.numberLabel.text = String(self.startNumber)
                                self.numberLabel.alpha = 0
                            }, completion: { (true) in
                            })
                        }
                        self.initialView.backgroundColor = .clear
                        self.drawOverlay.isHidden = false
                        self.hands.isHidden = true
                        self.textViewTwo.isHidden = true
                        self.textViewThree.isHidden = true
                        self.drawOverlay.backgroundColor = #colorLiteral(red: 0.4186097383, green: 0.6832208037, blue: 0.6360456347, alpha: 0.7)



                    }
                    handPoseRequest.maximumHandCount = 0
                }
                let indice = ind*5

                // Get points for thumb and index finger.
                //            observation
                let thumbPoints = try observation.recognizedPoints(.thumb)
                let thumbPointsReal = [
                    thumbPoints[.thumbTip], thumbPoints[.thumbIP], thumbPoints[.thumbMP], thumbPoints[.thumbCMC]
                ]
                let indexPoints = try observation.recognizedPoints(.indexFinger)
                let indexPointsReal = [
                    indexPoints[.indexTip], indexPoints[.indexDIP], indexPoints[.indexPIP], indexPoints[.indexMCP]
                ]
                let middlePoints = try observation.recognizedPoints(.middleFinger)
                let middlePointsReal = [
                    middlePoints[.middleTip], middlePoints[.middleDIP],
                    middlePoints[.middlePIP], middlePoints[.middleMCP]
                ]
                let ringPoints = try observation.recognizedPoints(.ringFinger)
                let ringPointsReal = [
                    ringPoints[.ringTip], ringPoints[.ringDIP], ringPoints[.ringPIP], ringPoints[.ringMCP]
                ]
                let littlePoints = try observation.recognizedPoints(.littleFinger)
                let littlePointsReal = [
                    littlePoints[.littleTip], littlePoints[.littleDIP],
                    littlePoints[.littlePIP], littlePoints[.littleMCP]]
                let confidenceLevel: Float = 0.8
                processFinger(thumbPointsReal, id: 0+indice, confidenceLevel: confidenceLevel)
                processFinger(indexPointsReal, id: 1+indice, confidenceLevel: confidenceLevel)
                processFinger(middlePointsReal, id: 2+indice, confidenceLevel: confidenceLevel)
                processFinger(ringPointsReal, id: 3+indice, confidenceLevel: confidenceLevel)
                processFinger(littlePointsReal, id: 4+indice, confidenceLevel: confidenceLevel)
                DispatchQueue.main.sync {
                    var fingerPointGroups = [[CGPoint]]()
                    for pointGroup in pointGroups {
                        var fingerPoints = [CGPoint]()
                        for point in pointGroup {
                            guard let point = point else { continue }
                            let devicePoint = CGPoint(x: point.location.x, y: 1-point.location.y)
                            let convertedPoint =
                            cameraView.previewLayer.layerPointConverted(fromCaptureDevicePoint: devicePoint)
                            fingerPoints.append(convertedPoint)
                        }
                        fingerPointGroups.append(fingerPoints)
                    }
                    cameraView.showPoints(fingerPointGroups, color: .red)
                }
            }
        } catch {
            cameraFeedSession?.stopRunning()
            let error = AppError.visionError(error: error)
            DispatchQueue.main.async {
                error.displayInViewController(self)
            }
        }
    }
}
extension CGPoint {
    static func+(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x+rhs.x, y: lhs.y+rhs.y)
    }
}
extension Array where Element == CGPoint {
    var minAndMax: (min: CGPoint, max: CGPoint) {
        var min: CGPoint = CGPoint(x: CGFloat.infinity, y: CGFloat.infinity)
        var max: CGPoint = CGPoint(x: -CGFloat.infinity, y: -CGFloat.infinity)
        self.forEach {item in
            if item.x > 0 {
                min.x = item.x < min.x ? item.x : min.x
                max.x = item.x > max.x ? item.x : max.x
            }
            if item.y > 0 {
                min.y = item.y < min.y ? item.y : min.y
                max.y = item.y > max.y ? item.y : max.y
            }

        }
        return (min: min, max: max)
    }

    func normalize() -> [CGPoint] {
        let miniMax = self.minAndMax
        return self.map {item in
            return CGPoint(x: (item.x - miniMax.min.x)/miniMax.max.x,
                           y: (item.y - miniMax.min.y)/miniMax.max.y)
        }
    }
    func sumAll() -> CGPoint {
        self.reduce(CGPoint.zero, +)
    }

}
extension CGRect {
    func scaled(to scale:CGFloat)->CGRect {
        return CGRect(x: self.minX, y: self.minY,
                      width: self.width * scale,
                      height:  self.height * scale)
    }
}

