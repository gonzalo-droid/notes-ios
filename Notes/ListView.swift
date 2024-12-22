//
//  CardView.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//


import SwiftUI



struct RetoCards: View {
    @State private var showSheet = false

    @StateObject var appInfo = AppInfo()
    
    
    
    var body: some View {
        NCardList()
            .environmentObject(appInfo)
            .sheet(isPresented: $showSheet, content: {
                NCreateNoteView() { card in                
                    appInfo.addNote(card: card)
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

