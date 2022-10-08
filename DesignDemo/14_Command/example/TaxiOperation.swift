//
//  TaxiOperation.swift
//  DesignDemo
//
//  Created by mqh on 2022/9/29.
//

import Foundation

class TaxiOperation: DelayedOperation {
    override func main() {
        print("\(self): Taxi is odered via Uber")
    }
    
    override var description: String {
        return "TaxiOperation"
    }
}
