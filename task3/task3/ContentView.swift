//
//  ContentView.swift
//  task3
//
//  Created by İlknur Tulgar on 1.09.2025.
//

import SwiftUI

struct ContentView: View {
    @State var counter = 0
    
    var body: some View {
        VStack (alignment: .center, spacing: 30) {
           Text("Counter : \(counter)")
                .font(.title)
                .foregroundColor(.pink)
                .padding()
            
        
            HStack(){
                StepperButton(title: "+", action: {
                    counter += 1
                })
                Spacer().frame(width: 60)
                              StepperButton(title: "-", action: {
                    counter -= 1
                })
                
            }
        }

    }
}

#Preview {
    ContentView()
}
