//
//  BaseAuthVewController.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/29.
//

import Foundation
import UIKit

protocol AuthHandlerSupportable: AnyObject {
    var handler: Handler? { get set }
}

class BaseAuthViewController: UIViewController, AuthHandlerSupportable {
    
    var handler: Handler?
    
    init(handler: Handler){
        self.handler = handler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
