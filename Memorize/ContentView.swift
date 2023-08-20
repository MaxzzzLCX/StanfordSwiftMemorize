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
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.black)
        .padding()
        
    }
}


struct CardView: View{
    @State var isFaceUp: Bool = true
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🙈").font(.largeTitle)
            } else{
                base.fill()
            }
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
