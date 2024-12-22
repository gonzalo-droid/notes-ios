//
//  NCreateNoteViewModel.swift
//  Notes
//
//  Created by Gonzalo on 21/12/24.
//

import Foundation

class NCreateNoteViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var showAlert = false
    @Published var size: NCardType = .small
    @Published var isFavorite: Bool = false
    
    func createNote() -> NCard {
        let card = NCard(title: title, text: description, type: size, isFavorite: isFavorite)
        return card
    }
    
}
