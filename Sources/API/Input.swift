//
//  Input.swift
//  Rift
//
//  Created by Vladislav Prusakov on 12.04.2025.
//

import Gravity

@GSExportable
final class Input: @unchecked Sendable {
    /// - Parameter keyCode: Support A, B, X, Y, R1, R2, L1, L2, START, SELECT
    /// - Returns: true if button is pressed
    func isPressed(_ keyCode: String) -> Bool {
        return false
    }
    
    /// - Parameter stickName: Support LEFT_STICK and RIGHT_STICK parameter.
    /// - Returns: vector of stick direction
    func getPosition(_ stickName: String) -> Int {
        return 0
    }
    
    /// - Returns: array of touches.
    func getTouches() -> [Touch] {
        return [Touch(position: 0), Touch(position: 1)]
    }
}

@GSExportable
final class Touch: @unchecked Sendable {
    let position: Int
    
    init(position: Int) {
        self.position = position
    }
}

extension Touch: CustomStringConvertible {
    var description: String {
        return "Touch { position: \(position) }"
    }
}
