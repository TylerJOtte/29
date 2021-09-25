//
//  TwentyNineApp.swift
//  TwentyNine
//
//  Created by Tyler J. Otte on 9/25/21.
//

import SwiftUI

@main
struct TwentyNineApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
