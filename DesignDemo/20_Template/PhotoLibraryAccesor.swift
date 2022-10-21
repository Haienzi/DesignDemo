//
//  PhotoLibraryAccesor.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/19.
//  相册权限申请类

import Foundation
import Photos

class PhotoLibraryAccesor: PermissionAccessor {
    
    override func requestAccess(_ completion: @escaping PermissionAccessor.Completion) {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            completion(status == .authorized)
        }
    }
    
    override func hasAccess() -> Bool {
        return PHPhotoLibrary.authorizationStatus() == .authorized
    }
    
    override var description: String {
        return "Photo"
    }
    
    override func didReceiveAccess() {
        print("PhotoLibrary Accesor: ReceiveAccess. updating something")
    }
    
    override func didRejectAccess() {
        print("PhotoLibrary Accesor: RejectAccess. updating something")
    }
}
