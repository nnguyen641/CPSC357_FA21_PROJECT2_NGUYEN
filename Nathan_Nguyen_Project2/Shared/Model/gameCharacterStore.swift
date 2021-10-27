//
//  gameCharacterStore.swift
//  Project2
//
//  Created by Nathan Nguyen on 10/26/21.
//

import Foundation
import SwiftUI
import Combine

class gameCharacterStore : ObservableObject {
    
    @Published var gameCharacters: [gameCharacter]
    
    init(gameCharacters: [gameCharacter] = []){
        self.gameCharacters = gameCharacters
    }
}
