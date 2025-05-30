//
//  TaskRow.swift
//  ToDoSwiftData
//
//  Created by Reiwa on 16.04.2025.
//
import SwiftUI
import SwiftData

struct TaskRow: View {
    @Bindable var task: Task

    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                       task.isCompleted.toggle()
                    
                   }
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    .imageScale(.large)
                    .scaleEffect(task.isCompleted ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: task.isCompleted)
            }
            Text(task.title)
                .strikethrough(task.isCompleted)
                .foregroundColor(task.isCompleted ? .secondary : .primary)
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
#Preview(traits: .sizeThatFitsLayout) {
    let task = Task(title: "Sample Task")
    return TaskRow(task: task)
        .padding()
}
