//
//  ProgressTest.swift
//  Notes
//
//  Created by Gonzalo on 21/12/24.
//

import SwiftUI

struct ProgressTest: View {
    @State private var progress: Double = 0.3

       var body: some View {
           VStack {
               Text("Cargando...")
                   .font(.headline)

               // Barra de progreso
               ProgressView(value: progress)
                   .progressViewStyle(LinearProgressViewStyle())
                   .padding()

               ProgressView()
                   .progressViewStyle(CircularProgressViewStyle())
               
               // Botón para simular progreso
               Button("Aumentar Progreso") {
                   withAnimation {
                       progress = min(progress + 0.1, 1.0)
                   }
               }
               .padding()
           }
       }
}

#Preview {
    ProgressTest()
}
