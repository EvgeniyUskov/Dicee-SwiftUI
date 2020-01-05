//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Evgeniy Uskov on 14.10.2019.
//  Copyright © 2019 Evgeniy Uskov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()

                Button(action: {
                    self.generateDiceNumbers()
                }) {
                    Text("Roll")
                        .font(.system(size: 50, weight: .heavy))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
                .padding(.bottom, 50)
            }
        }
    }
    
    func generateDiceNumbers() {
        leftDiceNumber = Int.random(in: 1...6)
        rightDiceNumber = Int.random(in: 1...6)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}
