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
                .frame(width: 55, height: 55)
            // Allows user to tap cube that allows user to upgrade
                .onTapGesture {
                    gameState.firstWaterMessage = false
                    isSelected = true
//                    gameState.cubeClicked = cubeValue
                    upgrade()
                    print(gameState.currentCube?.imageName ?? "")
                }
        VStack {
            if (gameState.upgradeNumArray[cubeValue] > 0 && gameState.cubeColorsArray[cubeValue] == "drop.fill"){
                collectBarView(gameState: gameState, resourceCount: gameState.upgradeNumArray[cubeValue], numToUpgrade: gameState.cubeColors[2].numToUpgrade)
            } else if (gameState.upgradeNumArray[cubeValue] > 0 && gameState.cubeColorsArray[cubeValue] == "sun.max.fill"){
                collectBarView(gameState: gameState, resourceCount: gameState.upgradeNumArray[cubeValue], numToUpgrade: gameState.cubeColors[3].numToUpgrade)
            } else if (gameState.upgradeNumArray[cubeValue] > 0 && gameState.cubeColorsArray[cubeValue] == "leaf.fill"){
                collectBarView(gameState: gameState, resourceCount: gameState.upgradeNumArray[cubeValue], numToUpgrade: gameState.cubeColors[4].numToUpgrade)
            }
            
            if !gameState.flowers.contains(gameState.cubeColorsArray[cubeValue]) {
                Image(systemName: gameState.cubeColorsArray[cubeValue])
                    .foregroundColor(
                        (gameState.cubeColorsArray[cubeValue] == "drop.fill") ? .blue : (gameState.cubeColorsArray[cubeValue] == "sun.max.fill") ? .yellow : .green)
            } else {
                Image(gameState.cubeColorsArray[cubeValue])
                    .resizable()
                    .frame(width: 55, height: 55)
                    .cornerRadius(5)
            }
        }
        .frame(width: 45, height: 45)
    }
    
    // Function to see what needs to be upgrade
    func upgrade() {
        if gameState.cubeColorsArray[cubeValue] == "drop.fill" {
            gameState.getSunCube(cubeColor: self.gameState.cubeColors[2], cubeClicked: cubeValue)
            print("test")
        } else if gameState.cubeColorsArray[cubeValue] == "sun.max.fill" {
            gameState.getGrassCube(cubeColor: self.gameState.cubeColors[3], cubeClicked: cubeValue)
        } else if gameState.cubeColorsArray[cubeValue] == "leaf.fill" {
            gameState.getPlantCube(cubeColor: self.gameState.cubeColors[4], cubeClicked: cubeValue)
        } else if gameState.flowers.contains(gameState.cubeColorsArray[cubeValue]) {
            gameState.collectFlower(cubeClicked: cubeValue)
        }
        isSelected = false
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
                            let cubeValue = (row * 3 + column)
                            ZStack {
                                CubeView(gameState: gameState, cubeValue: cubeValue)
                            }
                            .onAppear {
                                print("one cubevalue \(gameState.cubeValue)")
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
