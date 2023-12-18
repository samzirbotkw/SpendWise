//
//  ListItem.swift
//  SpendWise
//
//  Created by George Zirbo on 18.12.2023.
//

import SwiftUI

struct ListItem: View {
    let item: Transaction

    var body: some View {
        //horizontal stack withdollar icon, name, amount, and date
    
        HStack() {
            Image(systemName: "triangle.fill")
                .rotationEffect(item.type == "Expense" ? Angle(degrees: 180) : .zero)
                .foregroundColor(item.type == "Income" ? .green.opacity(0.7) : .red.opacity(0.7))
                .font(.system(size: 15))
                .padding(.trailing, 5)

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.date, style: .date)
                    .font(.subheadline)
            }

            Spacer()

            Text("\(item.amount, specifier: "$%.2f")")
                .foregroundColor(item.type == "Income" ? .green.opacity(0.7) : .red.opacity(0.7))
                .font(.headline)
                .environment(\.locale, Locale(identifier: "en_US"))
        }

    }
}

