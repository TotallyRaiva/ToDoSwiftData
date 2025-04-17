//
//  ContentView.swift
//  ToDoSwiftData
//
//  Created by Reiwa on 16.04.2025.
//
import SwiftUI
import SwiftData


enum TaskFilter: String, CaseIterable, Identifiable {
    case all = "All"
    case pending = "Pending"
    case completed = "Completed"
    
    var id: String { self.rawValue }
}

struct ContentView: View {
    @State private var tasks: [Task] = []
    @Environment(\.modelContext) private var modelContext
    @State private var showingNewTaskView = false
    @State private var selectedFilter: TaskFilter = .all
    @State private var refreshTrigger = false
    
    var filteredTasks: [Task] {
        switch selectedFilter {
            case .all:
                return tasks
            case .pending:
                return tasks.filter { !$0.isCompleted }
            case .completed:
                return tasks.filter { $0.isCompleted }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                StatsView(
                    total: tasks.count,
                    completed: tasks.filter { $0.isCompleted }.count,
                    pending: tasks.filter { !$0.isCompleted }.count
                )

                ScrollView {
                    VStack {
                        Picker("Filter", selection: $selectedFilter) {
                            ForEach(TaskFilter.allCases) { filter in
                                Text(filter.rawValue).tag(filter)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        .onChange(of: selectedFilter) {
                            fetchTasks()
                        }

                        if filteredTasks.isEmpty {
                            VStack(spacing: 8) {
                                Image(systemName: "tray")
                                    .font(.system(size: 36))
                                    .foregroundColor(.gray)
                                Text("No tasks here")
                                    .foregroundColor(.secondary)
                            }
                            .padding(.top, 60)
                        } else {
                            List {
                                ForEach(filteredTasks) { task in
                                    TaskRow(task: task)
                                }
                                .onDelete { indexSet in
                                    withAnimation {
                                        for index in indexSet {
                                            let taskToDelete = filteredTasks[index]
                                            modelContext.delete(taskToDelete)
                                        }
                                    }
                                }
                            }
                            .id(refreshTrigger)
                            .frame(minHeight: 300) // Optional: helps List play nice in ScrollView
                        }
                    }
                }
            }
            .navigationTitle("TASKS")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingNewTaskView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $showingNewTaskView) {
                NewTaskView()
            }
            .onAppear {
                fetchTasks()
            }
        }
    }
    
    func fetchTasks() {
        do {
            let descriptor = FetchDescriptor<Task>(
                sortBy: [SortDescriptor(\.timestamp, order: .reverse)]
            )
            tasks = try modelContext.fetch(descriptor)
        } catch {
            print("Failed to fetch tasks: \(error)")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
