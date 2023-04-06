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
                    Label("Rain", systemImage: "cloud.drizzle.fill")
                }
                .padding()
            
            LightningView(gameState: gameState)
                .tabItem {
                    Label("Lightning", systemImage: "cloud.bolt.fill")
                }
                .padding()
            
            MenuView(gameState: gameState)
                .tabItem{
                    Label("Menu" , systemImage: "gearshape")
                }
                .padding()
        }
    }
}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
