//
//  ContentView.swift
//  Clicker
//
//  Created by Teresa Villegas on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameState = GameState()
    
    var body: some View {
        TabView {
            RainView(gameState: gameState)
                .tabItem {
                    Label("Rain", systemImage: "moonphase.full.moon")
                }
            
            GrassView(gameState: gameState)
                .tabItem {
                    Label("Grass", systemImage: "moonphase.full.moon")
                }
            MenuView(gameState: gameState)
                .tabItem{
                    Label("Menu" , systemImage: "moonphase.full.moon")
                }
        }
    }
}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
