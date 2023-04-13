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
        ZStack {
            Color("Color")
                .edgesIgnoringSafeArea(.all)
            
            ButtonViews(gameState: gameState)
                .padding(20)
        }
    }
}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
