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
    
    func virtualMachine(_ virtualMachine: GravityVirtualMachine, didGetValueFrom target: GSValue, forKey: String) throws -> GSValue? {
        return nil
    }
    
    func virtualMachine(_ virtualMachine: Gravity.GravityVirtualMachine, xdata: UnsafeMutableRawPointer?, didSetUndefValue value: Gravity.GSValue, in target: Gravity.GSValue, forKey key: String) -> Bool {
        return false
    }
    
    func virtualMachine(
        _ virtualMachine: GravityVirtualMachine,
        xdata: UnsafeMutableRawPointer?,
        didGetUndefValueFrom target: GSValue,
        forKey key: String
    ) throws -> GSValue? {
        return nil
    }
    
    func virtualMachine(_ virtualMachine: Gravity.GravityVirtualMachine, didRequestStringWith length: UInt32, data: UnsafeMutableRawPointer?) -> String {
        guard let data else {
            return ""
        }
        let object = Unmanaged<AnyObject>.fromOpaque(data).takeUnretainedValue()
        return String(describing: object)
    }
}
