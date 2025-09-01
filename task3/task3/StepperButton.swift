//
//  StepperButton.swift
//  task3
//
//  Created by İlknur Tulgar on 1.09.2025.
//

import SwiftUI

struct StepperButton: View {
    var title: String
    var action : () -> Void
    var body: some View {
        Button(action : action){
            Text(title)
                .foregroundStyle(Color.white)
                .font(.headline)
                
        }
        .controlSize(.large)
        .buttonBorderShape(.capsule)
        .buttonStyle(.borderedProminent)
        .tint(.pink)
    }
}

#Preview {
    StepperButton(title: "+" ,action: {print("click")})
}
