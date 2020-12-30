//
//  iot_iosApp.swift
//  Shared
//
//  Created by Tuan Son Nguyen on 31/12/20.
//

import SwiftUI

@main
struct iot_iosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
