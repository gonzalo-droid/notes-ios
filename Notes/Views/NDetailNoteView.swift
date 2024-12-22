//
//  NDetailNoteView.swift
//  Notes
//
//  Created by Gonzalo on 21/12/24.
//

import SwiftUI

struct NDetailNoteView: View {
    @State var card: NCard
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(card.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                Text(card.text)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                Spacer()
                Image("logo")
            }
        }
        .background(Color.white)
        .cornerRadius(16)
        .padding()
        .background(Color.cyan.opacity(0.2))
    }
}

#Preview {
    NDetailNoteView(card: NCard(title: "Titulo", text: "text", type: .small))
}
