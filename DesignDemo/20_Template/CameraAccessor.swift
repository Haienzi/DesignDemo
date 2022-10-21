//
//  CameraAccesor.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/19.
//  相机权限申请类

import Foundation
import AVFoundation

class CameraAccessor: PermissionAccessor {
    
    override func requestAccess(_ completion: @escaping PermissionAccessor.Completion) {
        AVCaptureDevice.requestAccess(for: .video) { status in
            return completion(status)
        }
    }
    
    override func hasAccess() -> Bool {
        return AVCaptureDevice.authorizationStatus(for: .video) == .authorized
    }
    
    override var description: String {
        return "Camera"
    }
}
