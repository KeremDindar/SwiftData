//
//  VeresiyeAppApp.swift
//  VeresiyeApp
//
//  Created by Kerem on 9.11.2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataApp: App {
    
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer.init(for: Company.self)
        }catch {
            fatalError()
        }
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(modelContext: container.mainContext)
            
        }
        .environmentObject(CompanyViewModel(modelContext: ModelContext(container)))

        .modelContainer(for: [Company.self,Debts.self])
    }
}
