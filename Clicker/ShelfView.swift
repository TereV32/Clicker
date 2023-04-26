//
//  ShelfView.swift
//  Clicker
//
//  Created by Benjamin Cardenas on 4/19/23.
//

import SwiftUI

struct flowerView: View {
    
    @ObservedObject var gameState : GameState
//    var number : Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 170, height: 170)
                .cornerRadius(30)
            
            //            Image(gameState.flowers[number])
            Image(gameState.flowers.randomElement()!)
                .resizable()
                .cornerRadius(30)
                .frame(width: 170, height: 170)
        }
    }
}

struct ShelfView: View {
    
    @ObservedObject var gameState : GameState
    
//    private var data: [Int] = Array(1...6)
    
    // Set the image of flowers later
//    @State private var flowers = ["Flower1", "Flower2", "Flower3"].shuffled()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Grid {
                    ForEach(0..<3, id: \.self) { row in
                        GridRow {
                            ForEach(0..<2, id: \.self) { column in
//                                let cubeValue = row * 3 + column
//
                                flowerView(gameState: gameState)
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.automatic)
                .navigationTitle("Flower Shelf")
                .padding()
                
            }
        }
        
    }
}
    
struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView(gameState: GameState())
        
//        flowerView(gameState: GameState())
    }
}
