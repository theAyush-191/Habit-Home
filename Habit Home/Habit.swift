//
//  HabitData.swift
//  Habit Home
//
//  Created by Ayush Singh on 18/09/25.
//

import SwiftData
import Foundation

@Model
class Habit: Identifiable{
    var id: String
    var habit: String
    var isCompleted: Bool
    var createdAt: Date
    
    init(habit: String, isCompleted: Bool = false,createdAt date: Date = Date()){
        self.id = UUID().uuidString
        self.habit = habit
        self.isCompleted = isCompleted
        self.createdAt=date
    }
}
