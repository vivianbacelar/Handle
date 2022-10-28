import SwiftUI
import Vision
import UIKit

struct HGR {
    private init() {}
    private static let fingers: [VNHumanHandPoseObservation.JointsGroupName] =
    [.thumb, .indexFinger, .middleFinger, .ringFinger, .littleFinger]
    // notes it goes Tip > DIP > PIP > MCP
    private static let fingerTips: [VNHumanHandPoseObservation.JointName] =
    [.indexTip, .middleTip, .ringTip, .littleTip]
    private static let fingerMCPs: [VNHumanHandPoseObservation.JointName] =
    [.indexMCP, .middleMCP, .ringMCP, .littleMCP]
    /**
     Determines if a hand is open
     */


    static var onHandOpen: ()->Void = {}
    static var handOpenCount = 0 {
        didSet { if handOpenCount == 100 {onHandOpen()} }
    }

    @discardableResult
    static func isHandOpen(hand: VNHumanHandPoseObservation, onHandOpen: @escaping ()->Void) -> Bool {
        Self.onHandOpen = onHandOpen
        var fingerOpenCount = 0
        do {
            // for each finger besides the thumb, check that the tip is higher than the mcp
            // if one fails this test, return false
            for index in 0..<fingerTips.count {
                let tip = try hand.recognizedPoint(fingerTips[index])
                let mcp = try hand.recognizedPoint(fingerMCPs[index])
                if Int(tip.distance(mcp)*100)>10 {fingerOpenCount += 1}
//                print(fingerTips[index].rawValue, Int(tip.distance(mcp)*100))
            }
            // swiftlint:disable:next todo
            // TODO: Implement below later
            // for the thumb check that it is horizontally outwards (different for each hand)
        } catch {
            print("Point not available?")
        }

        if fingerOpenCount > fingerTips.count-1 {
             handOpenCount += 1
//            print("handOpenCount:", handOpenCount)
        } else {
            handOpenCount = 0
        }
//        print("-->", fingerOpenCount)
        return fingerOpenCount > fingerTips.count-1
    }
    /**
     Determines if a hand is closed
     */
    static func isHandClosed(hand: VNHumanHandPoseObservation) -> Bool {
        do {
            // for each finger besides the thumb, check that the tip is lower than the mcp
            // if one fails this test, return false
            for index in 0..<fingerTips.count {
                let tip = try hand.recognizedPoint(fingerTips[index])
                let mcp = try hand.recognizedPoint(fingerMCPs[index])
                guard tip.y < mcp.y else { return false }
            }
            // swiftlint:disable:next todo
            // TODO: Implement below later
            // for the thumb check that it is horizontally inwards (different for each hand)
        } catch {
            print("Imagine handling errors")
        }
        return true
    }
}
