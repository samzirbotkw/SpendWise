//
//  Toast.swift
//  SpendWise
//
//  Created by George Zirbo on 18.12.2023.
//

import SwiftUI

struct Toast: View {
    let message: String
    let backgroundColor: Color
    
    var body: some View {
        Text(message)
            .padding()
            .background(backgroundColor.opacity(0.65))
            .foregroundColor(.white)
            .cornerRadius(25)
            .transition(.opacity) // Makes the toast fade in and out
    }
}

#Preview {
    Toast(message: "Transaction added", backgroundColor: Color.green)
}
