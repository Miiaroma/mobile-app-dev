//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Miia Romanainen on 8.2.2021.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var order = Order()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)        }
    }
}
