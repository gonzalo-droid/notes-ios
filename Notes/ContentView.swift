//
//  ContentView.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .background(Color.blue)
                .padding()
                .background(Color.red)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundStyle(Color.yellow)
                .cornerRadius(100)
                .opacity(0.5)
            
            Ellipse()
                .stroke(lineWidth: 5)
                .frame(width: 50, height: 100)
                .foregroundStyle(Color.red)
                .rotationEffect(.degrees(50))
                
            
            Text("Hello, Platzi! buenas buenas")
                .font(.system(size: 30))
                .lineLimit(2)
                .multilineTextAlignment(.trailing)
                .bold()
                .underline()
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
