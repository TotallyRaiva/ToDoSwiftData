//
//  NewTaskView.swift
//  ToDoSwiftData
//
//  Created by Reiwa on 16.04.2025.
//
import SwiftUI
import SwiftData


struct NewTaskView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var taskTitle: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Task title", text: $taskTitle)
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let task = Task(title: taskTitle)
                        modelContext.insert(task)
                        dismiss()
                    }
                    .disabled(taskTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        dismiss()
                    }
                }
            }
        }
    }
}
#Preview {
    NewTaskView()
        .modelContainer(for: Task.self, inMemory: true)
}
