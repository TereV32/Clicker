//
//  ButtonViews.swift
//  Clicker
//
//  Created by Teresa Villegas on 4/12/23.
//

import SwiftUI

struct ButtonViews: View {
    
    @ObservedObject var gameState : GameState
    @State var imageName: String
    
    var body: some View {
        ZStack {
            Color("Color")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Spacer()
                
                CubeGridView(gameState: gameState)
                Spacer()
                //Buttons
                HStack {
                    //Button to get water
                    Button(action: {
                        if gameState.isGridFull() {
                            gameState.gridFull = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                gameState.gridFull = false
                            }
                        } else {
                            self.gameState.getWaterCube(cubeColor: self.gameState.cubeColors[1])
                            self.imageName = gameState.currentCube?.imageName ?? ""       //Changes the color of block selected to upgrade choosen
                            gameState.firstStartMessage = false

                        }
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
                }
                Spacer()
                Spacer()
            }
        }
    }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        
        @ObservedObject var gameState = GameState()
        
        ButtonViews(gameState: GameState(), imageName: gameState.currentCube?.imageName ?? "")
            
            
    }
}
