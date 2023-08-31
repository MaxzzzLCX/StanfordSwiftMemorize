//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Max Lyu on 2023/8/17.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
