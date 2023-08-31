//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Max Lyu on 2023/8/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🙈","🐥","🐶","🐱","🐻","🐧"]
    
    private static func createMemoryGame()->MemoryGame<String>{
        return MemoryGame<String>(numberOfPairsOfCards: 10 ){pairIndex in
            if emojis.indices.contains(pairIndex){
                return EmojiMemoryGame.emojis[pairIndex]
            }else{
                return "⁉️"
            }
        }
    }
    
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()

    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
