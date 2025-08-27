//
//  ContentView.swift
//  LayoutInterfaceDesign
//
//  Created by İlknur Tulgar on 27.08.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 20) {
            Header(name: "İlknur Tulgar", info: "iOS Developer")
            HStack{
                InfoCard(title: "Followers", value: "123")
                InfoCard(title: "Following", value: "123")
                InfoCard(title: "Likes", value: "100")
            }
            AboutMe(aboutMe: "lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum")
            Spacer()
            HStack(spacing: 20){
                CustomButton(title: "Mesaj Gönder")
                    .frame(maxWidth: .infinity)
                CustomButton(title: "Takip Et")
                    .frame(maxWidth: .infinity)
            }
        }
        
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}


#Preview {
    ContentView()
}
