//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Daniel Bauer on 11.05.24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
