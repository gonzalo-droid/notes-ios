//
//  TextFieldComponent.swift
//  Notes
//
//  Created by Gonzalo on 21/12/24.
//

import SwiftUI

struct TextFieldComponent: View {
    let placeholder: String
    @Binding var text: String

    var body: some View {
        // Reutilizamos el diseño del formulario original
        TextField(placeholder, text: $text)
            .font(.headline)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
    }
}


#Preview {
    VStack {
        TextFieldComponent(placeholder: "Escribe algo...", text: .constant("Texto inicial"))
        TextFieldComponent(placeholder: "Escribe algo más...", text: .constant(""))
    }
    .padding()
}
