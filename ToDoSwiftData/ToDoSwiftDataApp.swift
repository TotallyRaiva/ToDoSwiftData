//
//  ToDoSwiftDataApp.swift
//  ToDoSwiftData
//
//  Created by Reiwa on 16.04.2025.
//

import SwiftUI
import SwiftData

@main
struct ToDoSwiftDataApp: App {
    let sharedModelContainer: ModelContainer = {
        let schema = Schema([Task.self])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            url: FileManager.default
                .containerURL(forSecurityApplicationGroupIdentifier: "group.com.raiva.todoswiftdata")!
                .appendingPathComponent("Tasks.sqlite")
        )
        return try! ModelContainer(for: Task.self, configurations: modelConfiguration)
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
