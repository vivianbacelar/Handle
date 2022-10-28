/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The camera view shows the feed from the camera, and renders the points
     returned from VNDetectHumanHandpose observations.
*/

import UIKit
import AVFoundation
import SwiftUI

class CameraView: UIView {
    private var overlayLayer = CAShapeLayer()
    private var overlayLayer2 = CAShapeLayer()
    private var pointsPath = UIBezierPath()
    private var pointsPath2 = UIBezierPath()
    private var showOverlay:Bool
    var previewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
        // swiftlint:disable:previous force_cast
    }
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    init(frame: CGRect, showOverlay:Bool = false) {
        self.showOverlay = showOverlay
        super.init(frame: frame)
        guard showOverlay else { return }
        setupOverlay()
    }

    required init?(coder: NSCoder) {
        self.showOverlay = false
        super.init(coder: coder)
        setupOverlay()
    }
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
//        guard showOverlay else { return }
        if layer == previewLayer {
            overlayLayer.frame = layer.bounds
            overlayLayer2.frame = layer.bounds
        }
    }
    private func setupOverlay() {
        previewLayer.addSublayer(overlayLayer2)
        previewLayer.addSublayer(overlayLayer)
    }

    func showPoints(_ pointsGroups: [[CGPoint]], color: UIColor) {
        pointsPath.removeAllPoints()
        pointsPath2.removeAllPoints()
        for pointGroup in pointsGroups {
            for point in pointGroup {
                pointsPath.move(to: point)
                pointsPath.addArc(withCenter: point, radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            }
//            let orderedPoints = pointGroup.sorted { a, b in a.y < b.y}
            if let firstPoint = pointGroup.first {
                pointsPath2.move(to: firstPoint)
                for point in pointGroup.dropFirst() {
                    pointsPath2.addLine(to: point)
                // pointsPath.addArc(withCenter: point, radius: 5, startAngle: 0,
                // endAngle: 2 * .pi, clockwise: true)
                }
            }
            overlayLayer.fillColor = UIColor.red.cgColor
            overlayLayer2.fillColor = UIColor.clear.cgColor
            overlayLayer2.strokeColor = UIColor.gray.cgColor
            overlayLayer2.lineWidth = 5
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            overlayLayer.path = pointsPath.cgPath
            overlayLayer2.path = pointsPath2.cgPath
            CATransaction.commit()
        }
    }
}


