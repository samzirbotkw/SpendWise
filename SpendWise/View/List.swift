//
//  List.swift
//  SpendWise
//
//  Created by George Zirbo on 18.12.2023.
//

import SwiftUI

struct ListView: View {
    
    @State private var showAddView = false
    @State private var showUpdateView = false
    @State private var list = [Transaction]()

    
    var body: some View {
        NavigationView {
            List(list) { item in
                ListItem(item: item)
            }
            .navigationTitle("Transactions")
            .navigationBarItems(trailing: Button(action: {
                showAddView = true
            }) {
                Image(systemName: "plus")
            })
        }
        
        
    }
}

#Preview {
    ListView()
}
