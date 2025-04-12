//
//  RiftVM.swift
//  Rift
//
//  Created by Vladislav Prusakov on 12.04.2025.
//

import Gravity

class RiftVM {
    
    var compiler: GravityCompiler!
    var vm: GravityVirtualMachine!
    var binary: UnsafeMutablePointer<gravity_closure_t>?
    
    init() { }
    
    func setup() {
        let settings = GravityVirtualMachine.Settings(
            reportNullErrors: true,
            disableGarbageCollectorCheck: false,
            xdata: nil
        )
        
        self.vm = GravityVirtualMachine(settings: settings, delegate: self)
        self.compiler = GravityCompiler()
    }
    
    func execute(sourceCode: String) {
        self.binary = compiler.compile(source: sourceCode)
        compiler.transferMem(to: vm)

        self.setRuntimeObjects()
        
        vm.loadClosure(closure: self.binary)
    }
    
    func callSetupFunction() {
        let initFunction = vm.getValue(forKey: "_init")
        if !initFunction.isClosure {
            fatalError("not callable")
        }
        
        _ = initFunction()
    }
    
    func update() {
        let updateFunction = vm.getValue(forKey: "_update")
        if !updateFunction.isClosure {
            fatalError("not callable")
        }
        
        _ = updateFunction(Double.random(in: 0..<10))
    }
    
    func draw(_ graphics: Graphics) {
        let drawFunction = vm.getValue(forKey: "_draw")
        if !drawFunction.isClosure {
            fatalError("not callable")
        }
        
        _ = drawFunction(graphics)
    }
}

extension RiftVM {
    static let runtimeAPI: [GSExportable.Type] = [
        Graphics.self,
        Input.self,
        Touch.self,
        Math.self,
        System.self,
        Assets.self,
        Rift.self
    ]
    
    private func setRuntimeObjects() {
        do {
            // First bind all classes
            try Self.runtimeAPI.forEach {
                try vm.bindClass(with: $0)
            }
        } catch {
            fatalError("RUNTIME ERROR: \(error.localizedDescription)")
        }
        
        // Then create and set the rift instance
        let system = System(platform: "macOS")
        let assets = Assets()
        let input = Input()
        let rift = Rift(system: system, assets: assets, input: input)
        
        vm.setValue(rift, forKey: "rift")
    }
}
