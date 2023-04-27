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
            ZStack {
                ButtonViews(gameState: gameState, imageName: gameState.currentCube?.imageName ?? "")
                if gameState.firstStartMessage {
                    PopUpMessages()
                        .offset(x: 0, y: 525)
                }
                if gameState.firstWaterMessage && gameState.buttonClickedNum == 2{
                    PopUpMessage2()
                        .offset(x: 0, y: 10)
                }
            }
                .tabItem {
                    Label("Home", systemImage: "house")
                    
                }
            ShelfView(gameState: gameState)
                .tabItem {
                    Label("Shelf", systemImage: "leaf.circle.fill")
                }
        }
        .accentColor(.black)
        .onAppear {
            if !gameState.firstStartMessage {
                gameState.firstStartMessage = true
            }
            if !gameState.firstWaterMessage {
                gameState.firstWaterMessage = true
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
