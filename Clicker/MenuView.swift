//
//  MenuView.swift
//  Clicker
//
//  Created by Benjamin Cardenas on 4/5/23.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var gameState = GameState()
    
    var body: some View {
            //Button("Press to Dismiss") {
            //dismiss()
            
            // Declares the list of the rain generators
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
            .padding()
        }
        //.font(.title)
    }
//}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
