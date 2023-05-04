//
//  ShelfView.swift
//  Clicker
//
//  Created by Benjamin Cardenas on 4/19/23.
//

import SwiftUI

struct flowerView: View {
    
    @ObservedObject var gameState : GameState
    var number : Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 170, height: 170)
                .cornerRadius(30)
            
            Image(gameState.flowers[number])
                .resizable()
                .cornerRadius(30)
                .frame(width: 170, height: 170)
            if !gameState.flowersUnlocked.contains(gameState.flowers[number]) {
                Image(systemName: "lock.fill")
                    .resizable()
                    .opacity(0.75)
                    .frame(width: 100, height: 125)
                
            }
        }
    }
}

struct ShelfView: View {
    
    @ObservedObject var gameState : GameState
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color("Color")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    Grid {
                        ForEach(0..<3, id: \.self) { row in
                            GridRow {
                                ForEach(0..<2, id: \.self) { column in
                                    let cubeValue = row * 2 + column
                                    flowerView(gameState: gameState, number: cubeValue)
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
}
    
struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView(gameState: GameState())
        
//        flowerView(gameState: GameState())
    }
}
