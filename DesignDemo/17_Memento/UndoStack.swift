//
//  UndoStack.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//  Caretaker 负责人

import Foundation

class UndoStack: CustomStringConvertible {
    
    private lazy var mementos = [Memento]()
    private let textView: UITextView
    
    init(_ textView: UITextView){
        self.textView = textView
    }
    
    //保存操作
    func save(){
        mementos.append(textView.memento)
    }
    
    //撤销操作
    func undo(){
        guard !mementos.isEmpty else { return }
        textView.restore(with: mementos.removeLast())
    }
    
    var description: String {
        return mementos.reduce("", {$0 + $1.description})
    }
    
}
