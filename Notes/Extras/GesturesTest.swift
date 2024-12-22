//
//  GesturesTest.swift
//  Notes
//
//  Created by Gonzalo on 21/12/24.
//

import SwiftUI

struct GesturesTest: View {
    @State var color : Color = .black
    @State var offset: CGSize = .zero
    @State var isChanage : Bool = false
    
    
    @State private var scale: CGFloat = 1.0

    @State private var rotation: Angle = .zero

    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundStyle(color)
            .offset(offset)
            .onTapGesture(count:2) {
                isChanage = !isChanage
                if(isChanage){
                    color = .red
                } else {
                    color = .black
                }
            }
            .onLongPressGesture(minimumDuration: 3, perform: {
                color = .blue
            })
            .gesture (
                DragGesture()
                    .onChanged{ value in
                        offset = value.translation
                        
                    }
            )
        
        
        Rectangle()
            .frame(width: 100, height: 100)
            .foregroundStyle(Color.green)
            .scaleEffect(scale)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        scale = value
                    }
                    .onEnded { _ in
                        scale = 1.0 // Regresa al tamaño original
                    }
            )
                  
        
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .rotationEffect(rotation)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        rotation = value
                    }
                    .onEnded { _ in
                        rotation = .zero // Regresa a la posición original
                    }
            )
                   
    }
}

#Preview {
    GesturesTest()
}
