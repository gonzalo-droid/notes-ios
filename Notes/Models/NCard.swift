//
//  NCard.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//

import Foundation

struct NCard : Identifiable{
    let id = UUID()
    let title: String
    let text: String
    let type: NCardType
    var isFavorite: Bool = false
}

enum NCardType {
    case small
    case medium
}
