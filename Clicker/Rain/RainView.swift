//
//  RainView.swift
//  Clicker
//
//  Created by Teresa Villegas on 3/30/23.
//

import SwiftUI

struct RainView: View {
    @ObservedObject var gameState : GameState 
    @State private var showingSheet = false
    
    
    var body: some View {
        ZStack {
            
            Color("Color")
                .edgesIgnoringSafeArea(.all)
            
            // Makes it rain the amount of raindropsPerSecond in the game
            if gameState.rainPerSecond > 0 {
                RainDropView(rainPerSecond: $gameState.rainPerSecond)
            }
            
            if gameState.lightningCount > 0 {
                randomLightningView(lightningCount: $gameState.lightningCount)
            }
            
            VStack() {
                // Displays Rain drops and Rain Drops/s
                Text("\(gameState.count) Rain Drop")
                    .font(.largeTitle)
                // Displays raindrops/s once user buys a cloud
                if gameState.rainPerSecond > 0 {
                    Text("\(gameState.rainPerSecond) Rain Drop/s")
                        .font(.title2)
                }
                Spacer()
                Spacer()
                /*Declares the list of the rain generators
                List(gameState.rainGenerators) { rainGenerator in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(rainGenerator.name)
                            Text("\(rainGenerator.rainPerSecond) rain/s")
                            Text("Price: \(rainGenerator.price) raindrops")
                        }
                        Spacer()
                        // Groups the Generators to be purchased
                        Group {
                            
                            Button(action: {
                                self.gameState.purchase(rainGenerator: rainGenerator)
                            }) {
                                Text("Purchase")
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            .disabled(self.gameState.count < rainGenerator.price)
                        }
                        
                    }
                    .listRowBackground(Color.clear)
                }
                // Styling the List for the Generators
                .listStyle(.plain)
                .padding() */
                
                
                // Make it Rain Button
                Button(action: {
                    self.gameState.click()
                }) {
                    Image(systemName: "cloud.rain")
                    //Text("Make it Rain!")
                      //.font(.largeTitle)
                }
                // Styling the buttons.
                .padding(10)
                .frame(width: 150)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
            }
        }
    }
}

struct RainView_Previews: PreviewProvider {
    static var previews: some View {
        
    @ObservedObject var gameState = GameState()
        RainView(gameState: gameState)
            .environment(\.colorScheme, .dark)
    }
}

