//
//  CubeView.swift
//  Clicker
//
//  Created by Teresa Villegas on 4/12/23.
//

import SwiftUI

//Creates a single cube to be added to grid
struct CubeView: View {
    
    @ObservedObject var gameState : GameState
    let cubeValue : Int
    @State var isSelected = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(.brown)
            .frame(width: 60, height: 60)
            // Allows user to tap cube that allows user to upgrade
            .onTapGesture {
//                isSelected = (!gameState.upgradeComplete) ? true : false
                isSelected = true
                gameState.cubeClicked = cubeValue
                upgrade()
                print(gameState.currentCube?.imageName ?? "")
            }
        VStack {
            if isSelected && !gameState.upgradeComplete {
                collectBarView(gameState: gameState)
                    .onDisappear {
                        isSelected = false
                    }
            }
            Image(systemName: gameState.cubeColorsArray[cubeValue])
                .foregroundColor(
                    (gameState.cubeColorsArray[cubeValue] == "drop.fill") ? .blue : (gameState.cubeColorsArray[cubeValue] == "sun.max.fill") ? .yellow : .green)
        }
        .frame(width: 50, height: 50)
    }
    
    // Function to see what needs to be upgrade
    func upgrade() {
        if gameState.cubeColorsArray[cubeValue] == "drop.fill" {
            gameState.getSunCube(cubeColor: self.gameState.cubeColors[2])
        } else if gameState.cubeColorsArray[cubeValue] == "sun.max.fill" {
            gameState.getGrassCube(cubeColor: self.gameState.cubeColors[3])
        } else {
            gameState.getPlant(cubeColor: self.gameState.cubeColors[4])
        }
    }
}

//Creates a 3x3 grid of cubes
struct CubeGridView: View {
    
    @ObservedObject var gameState : GameState
    
    var body: some View {
        ZStack {
            Grid {
                ForEach(0..<3, id: \.self) { row in
                    GridRow {
                        ForEach(0..<3, id: \.self) { column in
                            let cubeValue = row * 3 + column
                            ZStack {
                                CubeView(gameState: gameState, cubeValue: cubeValue)
                            }
                        }
                    }
                }
            }
            // Displays text when user can no longer add to the grid
            if gameState.gridFull {
                Text("No more space!")
            }
        }
    }
}

struct CubeView_Previews: PreviewProvider {
    static var previews: some View {
        CubeGridView(gameState: GameState())
    }
}
