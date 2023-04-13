//
//  ButtonViews.swift
//  Clicker
//
//  Created by Teresa Villegas on 4/12/23.
//

import SwiftUI

struct ButtonViews: View {
    
    @ObservedObject var gameState : GameState
    
    var body: some View {
        VStack {
            //Shows the amount of resources collected
            HStack {
                Spacer()
                Text("\(gameState.waterCount) Water")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Text("\(gameState.sunCount) Sun")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
            }
            Spacer()
            CubeGridView(gameState: gameState)
            Spacer()
            //Buttons
            HStack {
                //Button to get water
                Button(action: {
                    self.gameState.rainClick()
                    print(gameState.waterCount)
                }) {
                    ZStack {
                        Capsule()
                            .fill(.blue)
                            .frame(width: 150, height: 75)
                        Image(systemName: "drop.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.teal)
                    }
                }
                //Button to get sun
                Button(action: {
                    self.gameState.sunClick()
                }) {
                    ZStack {
                        Capsule()
                            .fill(.blue)
                            .frame(width: 150, height: 75)
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
    }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var gameState = GameState()
        ButtonViews(gameState: gameState)
    }
}
