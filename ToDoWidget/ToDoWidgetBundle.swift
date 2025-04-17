//
//  ToDoWidgetBundle.swift
//  ToDoWidget
//
//  Created by Reiwa on 17.04.2025.
//

import WidgetKit
import SwiftUI

@main
struct ToDoWidgetBundle: WidgetBundle {
    var body: some Widget {
        ToDoWidget()
        ToDoWidgetControl()
        ToDoWidgetLiveActivity()
    }
}
