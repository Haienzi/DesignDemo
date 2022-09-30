//
//  LoginViewController.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/29.
//

import Foundation

class LoginViewController: BaseAuthViewController {
    func loginButtonSelected(){
        print("Login View Controller: User selected Login Button")
        
        let request = LoginRequest(email: "smail@163.com", password: "121212Hello")
        
        if let error = handler?.handle(with: request) {
            print("Login View Controller: Error ->" + (error.errorDescription ?? ""))
        } else {
            print("Login View Controller: all conditions are valid" )
        }
    }
}
