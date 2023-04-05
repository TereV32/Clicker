//
//  GrassView.swift
//  Clicker
//
//  Created by Teresa Villegas on 4/4/23.
//

import SwiftUI

struct GrassView: View {
    @ObservedObject var gameState = GameState()
    
    var body: some View {
        ZStack {
            // Makes it rain the amount of raindropsPerSecond in the game
            if gameState.grassCount > 0 {
//                randomGrassView(grassCount: $gameState.grassCount)
            }
            
            VStack() {
                
                HStack(alignment: .center) {
                    Spacer()
                    // Displays Rain drops and Rain Drops/s
                    VStack() {
                        Text("\(gameState.count) rain drop")
                            .font(.callout)
                        if gameState.rainPerSecond > 0 {
                            Text("\(gameState.rainPerSecond) rain drop/s")
                                .font(.caption2)
                        }
                    }
                    Spacer()
                    
                    Text("\(gameState.grassCount) grassblades")
                        .font(.callout)
                    
                    Spacer()
                }
                Spacer()
                Spacer()
                
                // Get Grassblade Button
                Button(action: {
                    self.gameState.purchaseGrass()
                }) {
                    VStack(alignment: .center) {
                        Text("Grow grass")
                            .font(.title)
                        Text("Price: 1,000 Raindrops")
                            .font(.caption2)
                    }
                }
                // Styling the buttons.
                .padding(10)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
            }
            
        }
    }
}

struct GrassView_Previews: PreviewProvider {
    static var previews: some View {
        GrassView()
    }
}
