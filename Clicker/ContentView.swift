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
            ButtonViews(gameState: gameState)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ShelfView()
                .tabItem{
                    Label("Shelf", systemImage: "leaf.circle.fill")
                }
        }
        
        
    }
}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        ContentView()
            .environment(\.colorScheme, .dark)
        //ShelfView()
    }
}
