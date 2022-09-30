//
//  SignUpViewController.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/29.
//

import Foundation

class SignUpViewController: BaseAuthViewController {
    func signUpButtonSelected() {
        print("Signup View Controller: User Selected SignUpButton")
        
        let request = SignUpRequest(userName: "Hello", email: "smail@163.com", password: "Hello121212", repeatedPassword: "hello121212")
        
        if let error = handler?.handle(with: request) {
            print("Signup View Controller: Error ->" + (error.errorDescription ?? ""))
        } else {
            print("Signup View Controller: all conditions are valid" )
        }
    }
}
