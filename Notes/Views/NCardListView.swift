//
//  NCardList.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//

import SwiftUI

struct NCardList: View {
    
    @State private var showSheet = false


    let cards: [NCard]
    
    var body: some View {
        List {
            ForEach(cards) { card in
                NCardView(card: card)
            }
        }
        .listStyle(.plain)
        
    }
}

#Preview {
    let cards: [NCard] = [
        NCard(title: "Card Thor 1", text: "Texto del card Texto del card 1", type: .small),
        NCard(title: "Card Thor 3", text: "Texto del card 3", type: .medium),
        NCard(title: "Card Thor 4", text: "Texto del card Texto del card 4", type: .small),
        NCard(title: "Card Thor 6", text: "Texto del card 6", type: .medium)
    ]
    
    NCardList(cards:cards)
}
