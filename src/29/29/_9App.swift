//
//  _9App.swift
//  29
//
//  Created by Tyler J. Otte on 9/25/21.
//

import SwiftUI

@main
struct _9App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
