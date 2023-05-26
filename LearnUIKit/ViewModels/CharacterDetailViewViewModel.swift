//
//  CharacterDetailViewViewModel.swift
//  LearnUIKit
//
//  Created by Duc Do on 26/05/2023.
//

import Foundation

final class CharacterDetailViewViewModel {
    private let character: Character
    init(character: Character) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
