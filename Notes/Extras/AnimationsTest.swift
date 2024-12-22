//
//  AnimationsTest.swift
//  Notes
//
//  Created by Gonzalo on 21/12/24.
//

import SwiftUI

struct AnimationsTest: View {
    @State var showGreen: Bool = false

    var body: some View {
        VStack {
            // Círculo azul
            Circle()
                .foregroundStyle(Color.cyan)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    withAnimation {
                        showGreen.toggle()
                    }
                }

            // Círculo verde (visible si showGreen es true)
            if showGreen {
                Circle()
                    .foregroundStyle(Color.green)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .slide, removal: .scale))

                    //.transition(.move(edge: .leading))
                    // .transition(.scale)
                
            }
        }
    }
}

#Preview {
    AnimationsTest()
}
