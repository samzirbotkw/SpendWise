//
//  Create.swift
//  SpendWise
//
//  Created by George Zirbo on 18.12.2023.
//

import SwiftUI

struct CreateView: View {
    @Binding var isPresented: Bool
    
    @State private var name: String = ""
    @State private var type: String = ""
    
    @State private var amount: Double = 0
    @State private var date: Date = Date()
    @State private var details: String = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Transaction Type")) {
                    Picker("Type", selection: $type) {
                        ForEach(["Expense", "Income"], id: \.self) { transactionType in
                            Text(transactionType.capitalized)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Transaction Details")) {
                    TextField("Name", text: $name)
                    TextField("Amount", text: Binding(
                        get: {
                            return amount != 0 ? String(amount) : ""
                        },
                        set: {
                            amount = Double($0) ?? 0
                        }
                    ))
                    .keyboardType(.decimalPad)
                    DatePicker("Date", selection: $date, in: ...Date(), displayedComponents: .date)
                    TextField("Details", text: $details)
                }
            }
        }
        .navigationTitle("Add Transaction")
        .navigationBarItems(
            leading: Button("Cancel") {
                isPresented = false
            },
            trailing: Button("Save") {
//                let transaction = Transaction (
//                    name: name,
//                    type: type,
//                    amount: amount,
//                    date: date,
//                    details: details
//                )
                //insert the transaction
                
                isPresented = false
            }
        )
    }
}

//struct CreateView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateView(isPresented: .constant(false))
//    }
//}

#Preview {
    CreateView(isPresented: .constant(true))
}
