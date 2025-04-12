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
        let value = vm.getValue(forKey: "_init")
        if !value.isClosure {
            fatalError("not callable")
        }
        
        _ = value(Double.random(in: 0..<10))
    }
    
    func update() {
        let value = vm.getValue(forKey: "_update")
        if !value.isClosure {
            fatalError("not callable")
        }
        
        _ = value(Double.random(in: 0..<10))
    }
    
    func draw(_ graphics: Graphics) {
        let value = vm.getValue(forKey: "_draw")
        if !value.isClosure {
            fatalError("not callable")
        }
        
        _ = value(graphics)
    }
}

extension RiftVM {
    static let runtimeAPI: [GSExportable.Type] = [
        Graphics.self,
        Input.self,
        Touch.self,
        Math.self,
        Rift.self,
//        System.self,
        Assets.self
    ]
    
    private func setRuntimeObjects() {
        Self.runtimeAPI.forEach {
            vm.bindClass(with: $0)
        }
        
        vm.setValue(Assets(), forKey: "assets")
    }
}
