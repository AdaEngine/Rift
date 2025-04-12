//
//  Rift.swift
//  Rift
//
//  Created by Vladislav Prusakov on 12.04.2025.
//

import Gravity

@GSExportable
final class Rift {
    
    var text: String = "VLAD"
    
    let system: System
    let assets: Assets
    let input: Input
    
    package init(
        system: System,
        assets: Assets,
        input: Input
    ) {
        self.system = system
        self.assets = assets
        self.input = input
    }
}

@GSExportable("RiftSystem")
final class System {
    let platform: String
    
    init(platform: String) {
        self.platform = platform
    }
}

