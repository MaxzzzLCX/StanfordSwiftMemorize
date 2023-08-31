//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Max Lyu on 2023/8/23.
//

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        // can directly do cards=[], because from above we know cards is of type Card
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        
        
    }
    
    func choose(_ card: Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    //nested struct
    struct Card{
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
