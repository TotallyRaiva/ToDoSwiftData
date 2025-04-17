//
//  Task.swift
//  ToDoSwiftData
//
//  Created by Reiwa on 16.04.2025.
//
import Foundation
import SwiftData

@Model
public class Task: Identifiable {
    public var id: UUID
    public var title: String
    public var isCompleted: Bool
    public var timestamp: Date

    public init(title: String, isCompleted: Bool = false, timestamp: Date = .now) {
        self.id = UUID()
        self.title = title
        self.isCompleted = isCompleted
        self.timestamp = timestamp
    }
}
