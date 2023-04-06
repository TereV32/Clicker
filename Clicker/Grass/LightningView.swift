//
//  LigthningView.swift
//  Clicker
//
//  Created by Teresa Villegas on 4/4/23.
//

import SwiftUI

struct LightningView: View {
    @ObservedObject var gameState = GameState()
    
    var body: some View {
        ZStack {
            
            Color("Color")
                .edgesIgnoringSafeArea(.all)
            
            // Makes it rain the amount of raindropsPerSecond in the game
            if gameState.lightningCount > 0 {
                randomLightningView(lightningCount: $gameState.lightningCount)
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
                    
                    Text("\(gameState.lightningCount) lightning strikes")
                        .font(.callout)
                    
                    Spacer()
                }
                Spacer()
                Spacer()
                
                // Get lightning Button
                Button(action: {
                    self.gameState.purchaseLightning()
                }) {
                    VStack(alignment: .center) {
                        Image(systemName: "cloud.bolt.fill")
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

struct LightningView_Previews: PreviewProvider {
    static var previews: some View {
        LightningView()
        
        LightningView()
            .environment(\.colorScheme, .dark)
    }
}
