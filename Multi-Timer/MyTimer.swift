//
//  MyTimer.swift
//  Multi-Timer
//
//  Created by Иван Карамазов on 03.09.2021.
//

import Foundation

struct MyTimer {
    var name: String
    var secondsToFinish: Int
    var created: Date = Date() // timestamp
    
    func finishDate() -> Date {
        return Calendar.current.date(byAdding: .second, value: secondsToFinish, to: created)!
    }
}
