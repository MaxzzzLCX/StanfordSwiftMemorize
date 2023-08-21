//
//  ContentView.swift
//  Memorize
//
//  Created by Max Lyu on 2023/8/17.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: Array<String> =  []
    let animals = ["🙈","🐥","🐶","🐱","🐻","🐧"]
    let food = ["🍎","🍋","🥐","🍳","🍔","🌮","🍍","🥘"]
    let vehicles = ["🚝","🚀","⛵️","🚁","🛴"]
    
    @State var themeColor: Color = .green
    
    @State var cardCount: Int = 4
    @State var currentTheme: String = "Animals"
    
    
    var body: some View {
        VStack{
            title
            cards
            Spacer()
            themeSelection
            // cardCountAdjuster
        }
        .padding()
    }
    
    var title: some View{
        Text("Memorize!")
            .font(.largeTitle)
    }
    
    
    var cards: some View{
        LazyVGrid(columns:[GridItem(),GridItem(),GridItem(),GridItem(),GridItem()]){
            
            ForEach(0..<emojis.count, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
        
            }
        }
        .foregroundColor(themeColor)
    }
    
    
    
    var themeSelection: some View{
        HStack{
            Spacer()
            animalTheme
            Spacer()
            foodTheme
            Spacer()
            vehicleTheme
            Spacer()
        }
    }
    
    func themeButtonCreation(caption: String, symbol: String, themeEmojis: [String], color: Color) -> some View{
        
        Button(action: {
            emojis = themeEmojis + themeEmojis
                .shuffled()
            themeColor = color
        }, label: {
            VStack{
                Image(systemName: symbol).font(.largeTitle)
                Text(caption)
            }
        })
    }
    
    var animalTheme: some View{
        themeButtonCreation(caption: "Animals", symbol: "pawprint.fill", themeEmojis: animals, color: .green)
    }
    var foodTheme: some View{
        themeButtonCreation(caption: "Food", symbol: "fork.knife.circle", themeEmojis: food, color: .red)
    }
    var vehicleTheme: some View{
        themeButtonCreation(caption: "Vehicles", symbol: "car.fill", themeEmojis: vehicles, color: .black)
    }
    
    
    // THE FOLLOWING IS FROM LECTURE. NOT NEEDED FOR ASSIGNMENT
    var cardCountAdjuster: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
        
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    
    
    var cardRemover: some View{
        cardCountAdjuster(by: -1, symbol:"rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: 1, symbol:"rectangle.stack.badge.plus.fill")
    }
    
    // THE ABOVE IS FROM LECTURE. NOT NEEDED FOR ASSIGNMENT
    
    
}


struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
