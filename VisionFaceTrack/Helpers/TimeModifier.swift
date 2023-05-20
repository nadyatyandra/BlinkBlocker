//
//  TimeModifier.swift
//  VisionFaceTrack
//
//  Created by Nadya Tyandra on 21/05/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

class TimeModifier {
    static let shared = TimeModifier()
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d.%02d", minutes, seconds)
    }
}
