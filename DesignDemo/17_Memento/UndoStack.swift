//
//  UndoStack.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//  Caretaker 负责人，管理备忘录，提供保存和获取备忘录的功能，但是不能对备忘录的内容进行访问和修改

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
