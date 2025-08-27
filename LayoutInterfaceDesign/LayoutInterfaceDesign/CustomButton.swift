//
//  CustomButton.swift
//  LayoutInterfaceDesign
//
//  Created by İlknur Tulgar on 27.08.2025.
//

import SwiftUI

struct CustomButton: View {
    var title : String
    
    var body: some View {
        Button(action: {
            print("click")
        }) {
           Text(title)
                .foregroundColor(.white)
                .frame(width: 120, height: 25)
                .padding(15)
                .background(Color.pink)
                .clipShape(Capsule())
                
        }
        
    }
        
}

#Preview {
    CustomButton(title: "Mesaj Gönder")
}
