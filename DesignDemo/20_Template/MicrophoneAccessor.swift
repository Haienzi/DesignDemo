//
//  MicrophoneAccessor.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/19.
//  麦克风权限申请类

import Foundation
import AVFoundation

class MicrophoneAccessor: PermissionAccessor {
    
    override func requestAccess(_ completion: @escaping PermissionAccessor.Completion) {
        AVAudioSession.sharedInstance().requestRecordPermission { status in
            completion(status)
        }
    }
    
    override func hasAccess() -> Bool {
        return AVAudioSession.sharedInstance().recordPermission == .granted
    }
    
    override var description: String {
        return "Microphone"
    }
}
