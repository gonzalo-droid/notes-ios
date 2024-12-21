//
//  CardView.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//


import SwiftUI



struct RetoCards: View {
    @State private var showSheet = false


    let cards: [NCard] = [
        NCard(title: "Card Thor 1", text: "Texto del card Texto del card 1", type: .small),
        NCard(title: "Card Thor 2", text: "Texto del card Texto del card 2", type: .small),
        NCard(title: "Card Thor 3", text: "Texto del card 3", type: .medium),
        NCard(title: "Card Thor 4", text: "Texto del card Texto del card 4", type: .small),
        NCard(title: "Card Thor 5", text: "Texto del card 5", type: .small),
        NCard(title: "Card Thor 6", text: "Texto del card 6", type: .medium),
        NCard(title: "Card Thor 7", text: "Texto del card 7", type: .small),
        NCard(title: "Card Thor 8", text: "Texto del card 8", type: .medium)
    ]
    
    
    var body: some View {
        NCardList(cards: cards)
            .sheet(isPresented: $showSheet, content: {
                NCreateNoteView() { card in
                    
                    print(card)
                    
                    showSheet = false

                }
            })
            .overlay{
                VStack{
                    Spacer()
                    
                    Button(action: {
                        showSheet = true
                    }) {
                        HStack(
                            alignment: .center
                        ) {
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(.yellow)
                            Text("Show Sheet")
                                .fontWeight(.bold)
                                
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.white)
                    
                }
            }
    }
}



#Preview {
    RetoCards()
        .padding()
}

