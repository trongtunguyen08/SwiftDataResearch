//
//  SwiftDataResearchApp.swift
//  SwiftDataResearch
//
//  Created by Tu Nguyen on 15/6/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataResearchApp: App {
    private var container: ModelContainer {
        let scheme = Schema([Expense.self])
        let container = try! ModelContainer(for: scheme, configurations: [])
        return container
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
