//
//  PopUpMessages.swift
//  Clicker
//
//  Created by Teresa Villegas on 4/12/23.
//

import SwiftUI

struct PopUpMessages: View {
    var body: some View {
        VStack {
            ZStack() {
                Image(systemName: "bubble.middle.bottom.fill")
                    .resizable()
                    .frame(width: 200, height: 150)
                    .foregroundColor(Color.gray)
                Text("Tap the screen to \ncreate rain!")
                    .foregroundColor(Color.white)
            }
            Spacer()
        }
        .padding()
    }
}

// View that shows a collection bar to allow user to see how many more items needed
struct collectBarView: View {
    
    @ObservedObject var gameState : GameState
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.gray)
                .opacity(0.5)
                .frame(width: 45, height: 10)
            Capsule()
                .fill(Color.white)
                .frame(width: CGFloat(showBar())*4.5, height: 10)
        }
    }
    
    func showBar() -> Int {
        var upgradeValue = 0
        if gameState.cubeColorsArray[gameState.cubeClicked] == "drop.fill" {
            upgradeValue = gameState.waterCount
        } else if gameState.cubeColorsArray[gameState.cubeClicked] == "sun.max.fill" {
            upgradeValue = gameState.sunCount
        }
        print(gameState.cubeColorsArray[gameState.cubeClicked])
        print(upgradeValue)
        return upgradeValue
    }
}

struct PopUpMessages_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMessages()
        collectBarView(gameState: GameState())
    }
 }
 
