//
//  ContentView.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            HStack {
                ZStack() {
                    Circle()
                        .background(Color.blue)
                        .padding(5)
                        .background(Color.red)
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.red)
                }
                
                Text("Hello, Platzi! buenas buenas")
                    .font(.system(size: 30))
                    .lineLimit(2)
                    .padding(10)
                    .multilineTextAlignment(.leading)
                    .bold()
                    .underline()
            }
                    
            Spacer()
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                // .frame(width: 100, height: 100)
                
    
            Spacer()
            
            Button(action: {
                    print("Button with icon tapped!")
                }) {
                    HStack(
                        alignment: .center, spacing: 10
                    ) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.yellow)
                        Text("Favorite")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
