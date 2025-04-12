//
//  RiftVM+Delegate.swift
//  Rift
//
//  Created by Vladislav Prusakov on 12.04.2025.
//

import Gravity

extension RiftVM: GravityVirtualMachineDelegate {
    func virtualMachineDidReciveLog(_ virtualMachine: Gravity.GravityVirtualMachine, message: String, data: UnsafeMutableRawPointer?) {
        
    }
    
    func virtualMachineDidClearLog(_ virtualMachine: Gravity.GravityVirtualMachine, data: UnsafeMutableRawPointer?) {
        
    }
    
    func virtualMachineBridgeEquals(_ virtualMachine: Gravity.GravityVirtualMachine, lhsValue: Gravity.GSValue, rhsValue: Gravity.GSValue) -> Bool {
        return false
    }
    
    func virtalMachine(_ virtualMachine: Gravity.GravityVirtualMachine, didRequestCloneFor object: Gravity.GSValue) -> Gravity.GSValue {
        return object
    }
    
    func virtualMachine(_ virtualMachine: Gravity.GravityVirtualMachine, didExecuteIn ctx: Gravity.GSValue, arguments: [Gravity.GSValue], argumentsCount: Int16, vIndex: UInt32, data: UnsafeMutableRawPointer?) -> Bool {
        return false
    }
    
    func virtualMachine(_ virtualMachine: Gravity.GravityVirtualMachine, didSetValue value: Gravity.GSValue, in target: Gravity.GSValue, forKey key: String) -> Bool {
        return false
    }
    
    func virtualMachine(_ virtualMachine: Gravity.GravityVirtualMachine, didGetValueFrom target: Gravity.GSValue, forKey: String, vIndex: UInt32) -> Bool {
        return false
    }
    
    func virtualMachine(_ virtualMachine: Gravity.GravityVirtualMachine, didSetUndefValue value: Gravity.GSValue, in target: Gravity.GSValue, forKey key: String) -> Bool {
        return false
    }
    
    func virtualMachine(_ virtualMachine: Gravity.GravityVirtualMachine, didGetUndefValueFrom target: Gravity.GSValue, forKey: String, vIndex: UInt32) -> Bool {
        return false
    }
    
    func virtualMachine(_ virtualMachine: Gravity.GravityVirtualMachine, didRequestStringWith length: UInt32, data: UnsafeMutableRawPointer?) -> String {
        return ""
    }
    
    func virtualMachine(_ virtualMachine: Gravity.GravityVirtualMachine, didRequestFree object: Gravity.GSValue) {
        
    }
    
    func virtualMachine(_ virtualMachine: Gravity.GravityVirtualMachine, didRequestSizeFor object: Gravity.GSValue) -> UInt32 {
        return 0
    }
    
    func virtualMachine(_ virtualMachine: Gravity.GravityVirtualMachine, didInitObjectIn ctx: Gravity.GSValue, instance: UnsafeMutablePointer<gravity_instance_t>?, arguments: [Gravity.GSValue], argumentsCount: Int16, data: UnsafeMutableRawPointer?) -> Bool {
        return false
    }
}
