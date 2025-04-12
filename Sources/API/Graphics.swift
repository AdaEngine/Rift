//
//  Graphics.swift
//  Rift
//
//  Created by Vladislav Prusakov on 12.04.2025.
//

import Gravity

@GSExportable
class Graphics: @unchecked Sendable {
    func drawText(_ text: String) {
        print("Draw", text)
    }
}

@GSExportable
struct Color {
    let red: Double
    let green: Double
    let blue: Double
    var alpha: Double
    
    init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    func opacity(_ alpha: Double) -> Color {
        var new = self
        new.alpha = alpha
        return new
    }
}

