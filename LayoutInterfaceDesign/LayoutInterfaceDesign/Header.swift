//
//  Header.swift
//  LayoutInterfaceDesign
//
//  Created by İlknur Tulgar on 27.08.2025.
//

import SwiftUI

struct Header: View {
    var name : String
    var info : String
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]),
                           startPoint: .top,
                           endPoint: .bottom)
                    .frame(height: 200)
                    .cornerRadius(20)
                    .padding(.horizontal)
            VStack {
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 75,height: 75)
                    .clipShape(Circle())
                    .foregroundColor(.red)
                Text(name)
                    .font(.title.italic())
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(info)
                    .font(.title2.italic())
                    .foregroundColor(.white.opacity(5))
            }
            .padding()
        }
    }
}

#Preview {
    Header(name: "İlknur Tulgar", info: "iOS Developer")
}
