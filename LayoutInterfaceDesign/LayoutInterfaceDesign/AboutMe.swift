//
//  AboutMe.swift
//  LayoutInterfaceDesign
//
//  Created by İlknur Tulgar on 27.08.2025.
//

import SwiftUI

struct AboutMe: View {
    var aboutMe : String
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                
                Text("Hakkımda")
                    .fontWeight(.medium)
                    .font(.title)
    
                Text(aboutMe)
                    .fontWeight(.regular)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
           
        }
      
    }
}

#Preview {
    AboutMe(aboutMe: "lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum lorem  ipsum")
}
