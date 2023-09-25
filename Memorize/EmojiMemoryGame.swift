//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Max Lyu on 2023/8/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🙈","🐥","🐶","🐱","🐻","🐧","🪿","🐽","🐨","🐯","🐸"]
    
    private static func createMemoryGame()->MemoryGame<String>{
        return MemoryGame<String>(numberOfPairsOfCards: 2 ){pairIndex in
            if emojis.indices.contains(pairIndex){
                return EmojiMemoryGame.emojis[pairIndex]
            }else{
                return "⁉️"
            }
        }
    }
    
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()

    
    var cards: Array<Card>{
        model.cards
    }
    
    var color: Color{
        .orange
    }
    
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    
    func choose(_ card: Card){
        model.choose(card)
    }
}
