//
//  SpendWiseApp.swift
//  SpendWise
//
//  Created by George Zirbo on 17.12.2023.
//

import SwiftUI

@main
struct SpendWiseApp: App {
    var body: some Scene {
        WindowGroup {
            CreateView(isPresented: .constant(true))
        }
    }
}
