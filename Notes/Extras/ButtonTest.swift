//
//  ButtonTest.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//

import SwiftUI

struct ButtonTest: View {
    @State var counter:Int = 0
    var body: some View {
        VStack {
            
            Text("\(counter)")
            
            Button(action: {
                counter += 1
            }) {
                HStack(
                    alignment: .center, spacing: 10
                ) {
                    Image(systemName: "plus.app.fill")
                        .foregroundColor(.yellow)
                    Text("Plus")
                        .fontWeight(.bold)
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
            }
        }

        
    }
}

#Preview {
    ButtonTest()
}
