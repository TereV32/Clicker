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
            ButtonViews(gameState: gameState, imageName: gameState.currentCube?.imageName ?? "")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ShelfView(gameState: gameState)
                .tabItem {
                    Label("Shelf", systemImage: "leaf.circle.fill")
                }
        }
//            Color("Color")
//                .edgesIgnoringSafeArea(.all)
            
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
