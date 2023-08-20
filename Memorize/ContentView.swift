//
//  ContentView.swift
//  Memorize
//
//  Created by Max Lyu on 2023/8/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .foregroundColor(.black)
        .padding()
        
    }
}


struct CardView: View{
    var isFaceUp: Bool = false
    var body: some View{
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("🙈").font(.largeTitle)
            } else{
                RoundedRectangle(cornerRadius: 12)
            }
            
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
