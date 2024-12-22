//
//  NCardList.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//

import SwiftUI

struct NCardList: View {
    
    @EnvironmentObject var appInfo : AppInfo
    
    @State private var showSheet = false
    
    var body: some View {
        List {
            ForEach(appInfo.cards) { card in
                NCardView(card: card)
            }
        }
        .listStyle(.plain)
        
    }
}

#Preview {
    NCardList()
        .environmentObject(AppInfo())
}
