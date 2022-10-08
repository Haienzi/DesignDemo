//
//  UITextView+Memento.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/8.
//  原发器

import Foundation
import UIKit

extension UITextView {
    var memento: Memento {
        return TextViewMenmento(text: text, textColor: textColor, selectedRange: selectedRange)
    }
    
    func restore(with memento: Memento){
        guard let textViewMemento = memento as? TextViewMenmento else { return }
        text = textViewMemento.text
        textColor = textViewMemento.textColor
        selectedRange = textViewMemento.selectedRange
    }
    
    struct TextViewMenmento: Memento {
        let text: String
        let date = Date()
        
        let textColor: UIColor?
        let selectedRange: NSRange
        
        var description: String {
            let time = Calendar.current.dateComponents([.hour, .minute, .second, .nanosecond], from: date)
            let color = String(describing: textColor)
            return "Text: \(text)\n" + "Date: \(time.description)\n"
            + "Color: \(color)\n" + "Range: \(selectedRange)\n"
        }
    }
}
