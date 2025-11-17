//
//  FitJetApp.swift
//  FitJet
//
//  Created by Pavithran P K on 13/11/25.
//

import SwiftUI
import CoreData

@main
struct FitJetApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            mainTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
