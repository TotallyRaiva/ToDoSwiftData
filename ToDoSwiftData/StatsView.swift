//
//  StatsView.swift
//  ToDoSwiftData
//
//  Created by Reiwa on 17.04.2025.
//
import SwiftUI
import SwiftData

struct StatsView: View {
    let total: Int
    let completed: Int
    let pending: Int

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Label("\(total)", systemImage: "list.bullet")
                Spacer()
                Text("Total Tasks")
            }

            HStack {
                Label("\(completed)", systemImage: "checkmark.circle.fill")
                    .foregroundColor(.green)
                Spacer()
                Text("Completed")
            }

            HStack {
                Label("\(pending)", systemImage: "clock.fill")
                    .foregroundColor(.orange)
                Spacer()
                Text("Pending")
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(.ultraThinMaterial))
        .padding()
    }
}

#Preview {
    StatsView(total: 5, completed: 3, pending: 2)
}
