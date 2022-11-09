//
//  CircularTimerExtensions.swift
//  Circular Timer
//
//  Created by Ricardo Venieris on 02/11/22.
//

import Foundation

extension Double {
    func precision(_ precision: Double) -> String {
        let d = "\(precision)".split(separator: ".").last ?? "0"
        let f = d == "0" ? 0 : d.count
        return String(format: "%.\(f)f", self)
    }
}


extension CGFloat {
    var half: CGFloat { self / 2 }
}

extension FloatingPoint {
    func clamped(to range: ClosedRange<Self>) -> Self {
        max(min(self, range.upperBound), range.lowerBound)
    }
}

