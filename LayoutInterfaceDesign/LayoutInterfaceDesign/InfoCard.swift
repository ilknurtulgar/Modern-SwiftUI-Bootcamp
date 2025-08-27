//
//  InfoCard.swift
//  LayoutInterfaceDesign
//
//  Created by İlknur Tulgar on 27.08.2025.
//

import SwiftUI

struct InfoCard: View {
    var title : String
    var value : String
    
    var body: some View {
        
            
            VStack (spacing: 5) {
                Text(value)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(title)
                    .font(.footnote)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
            
    }
}

#Preview {
    InfoCard(title: "followers", value: "123")
}
