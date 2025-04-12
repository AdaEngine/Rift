//
//  Rift.swift
//  Rift
//
//  Created by Vladislav Prusakov on 12.04.2025.
//

import Gravity

@GSExportable
final class Rift {
    let system: System
    
    init(system: System) {
        self.system = system
    }
}

@GSExportable
final class System {
    let platform: String
    
    init(platform: String) {
        self.platform = platform
    }
}

