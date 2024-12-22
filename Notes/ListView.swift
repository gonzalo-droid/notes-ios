//
//  CardView.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//


import SwiftUI



struct ListView: View {

    @StateObject var appInfo = AppInfo()
    
    var body: some View {
        TabView {
            NCardListView()
                .tabItem {
                    Label("Home",systemImage: "house.fill")
                }
            
            NCardListView(forFavorites: true)
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            
        }
            .environmentObject(appInfo)        
    }
}



#Preview {
    ListView()
        .padding()
}

