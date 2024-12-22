//
//  AppInfo.swift
//  Notes
//
//  Created by Gonzalo on 21/12/24.
//

import Foundation

class AppInfo : ObservableObject {
    @Published var cards: [NCard]  = [
        NCard(title: "Apples", text: "Buy 1kg of green apples", type: .small, isFavorite: true),
        NCard(title: "Milk", text: "Get 2 cartons of almond milk", type: .small),
        NCard(title: "Bread", text: "Whole-grain bread for sandwiches", type: .small),
        NCard(title: "Chicken Breast", text: "Fresh, boneless chicken for dinner", type: .medium),
        NCard(title: "Eggs", text: "A dozen free-range eggs", type: .small, isFavorite: true),
        NCard(title: "Rice", text: "Buy 5kg of basmati rice", type: .medium),
        NCard(title: "Cheese", text: "Cheddar cheese block, 500g", type: .small),
        NCard(title: "Tomatoes", text: "Fresh tomatoes for salad (1kg)", type: .small),
        NCard(title: "Shampoo", text: "Organic shampoo for dry hair", type: .medium),
        NCard(title: "Coffee", text: "Ground coffee for the French press", type: .small, isFavorite: true)
    ]
    
    func addNote(card : NCard) {
        cards.append(card)
    }
}

