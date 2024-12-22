//
//  NCardList.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//

import SwiftUI

struct NCardList: View {
    
    @EnvironmentObject var appInfo : AppInfo
    
    @State var showSheet : Bool = false
    @State var showDetails : Bool = false
    @State var selectedCard : NCard?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(appInfo.cards) { card in
                    NCardView(card: card)
                        .onTapGesture {
                            selectedCard = card
                            showDetails = true
                        }
                }
            }
            .listStyle(.plain)
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
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    
        
    }
}

#Preview {
    NCardList()
        .environmentObject(AppInfo())
}
