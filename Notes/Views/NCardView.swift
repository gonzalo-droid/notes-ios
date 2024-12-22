//
//  NCardView.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//

import SwiftUI

struct NCardView: View {
    
    let card: NCard
    
    
    var onToggleFavorite : (() -> Void)?
    
    
    func FavoriteButton() -> some View {
        Image(systemName: card.isFavorite ? "heart.fill" : "heart")
            .foregroundStyle(Color.red)
            .onTapGesture {
                onToggleFavorite?()
            }
    }
    
    @ViewBuilder
    func CardHorizontalView() -> some View {
        HStack {
            Text(card.title)
                .font(.headline)
                .lineLimit(2)
                .frame(width: 120)
                .padding(8)
                .background(Color.cyan.opacity(0.2))
                .cornerRadius(8)            
            
            Text(card.text)
                .font(.subheadline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
            
            FavoriteButton()
     
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
    }
    
    func CardVerticalView() -> some View {
        VStack {
            HStack(alignment: .top) {
                Spacer()
                FavoriteButton()
            }
            Text(card.title)
                .font(.title2)
                .lineLimit(2)
                .padding(.vertical, 8)
                .padding(.horizontal, 30)
                .background(Color.cyan.opacity(0.2))
                .cornerRadius(8)
                
            
            Text(card.text)
                .font(.body)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 150)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
    }
    
    
    var body: some View {
        switch card.type {
            case .small:
                CardHorizontalView()
                    .listRowSeparator(.hidden)
            default:
                CardVerticalView()
                    .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    VStack {
        NCardView(card: NCard(title:"Hello", text: "World",type: .medium ))
        NCardView(card: NCard(title:"Hello", text: "World",type: .small ))
    }
}
