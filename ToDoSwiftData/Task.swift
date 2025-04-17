//
//  Task.swift
//  ToDoSwiftData
//
//  Created by Reiwa on 16.04.2025.
//
import Foundation   
import SwiftData


@Model
class Task {
    var title: String
    var isCompleted: Bool
    var timestamp: Date
    
    init (title: String, isCompleted: Bool = false, timestamp: Date = .now) {
        self.title = title
        self.isCompleted = isCompleted
        self.timestamp = timestamp
    }
}
