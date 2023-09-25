//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Max Lyu on 2023/8/17.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    typealias Card = MemoryGame<String>.Card
    
    @ObservedObject var viewModel: EmojiMemoryGame = EmojiMemoryGame()//ViewModel points to View
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack{
            cards
                .foregroundColor(viewModel.color)
                .animation(.default, value: viewModel.cards)
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    
    private var cards: some View{

        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio){ card in
            CardView(card)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
}





struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
