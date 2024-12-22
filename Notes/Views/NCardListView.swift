//
//  NCardList.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//

import SwiftUI

struct NCardListView : View {
    
    @EnvironmentObject var appInfo : AppInfo
    
    @State var showSheet : Bool = false
    @State var showDetails : Bool = false
    @State var selectedCard : NCard?
    
    var forFavorites : Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(
                    forFavorites ? appInfo.favorites : appInfo.cards
                ) { card in
                    NCardView(card: card){
                        appInfo.toggleFavorite(card: card)
                    }
                        
                        .onTapGesture {
                            selectedCard = card
                            showDetails = true
                        }
                }
            }
            .listStyle(.plain)
            .sheet(isPresented: $showSheet, content: {
                NCreateNoteView() { card in
                    appInfo.addNote(card: card)
                    print(card)
                    showSheet = false
                }
            })
            .navigationDestination(isPresented: $showDetails, destination: {
                if let selectedCard {
                    NDetailNoteView(card: selectedCard)
                }
            })
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.cyan.opacity(0.4), for: .navigationBar)
            .toolbar{
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    NCardListView()
        .environmentObject(AppInfo())
}
