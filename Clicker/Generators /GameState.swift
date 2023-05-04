//
//  GameState.swift
//  Clicker
//
//  Created by Benjamin Cardenas on 4/4/23.
//

import Foundation
import SwiftUI

class GameState : ObservableObject {
    // Declares the Variables
    // Published prop. allows other views to react to changes
    @Published var buttonClickedNum = 0
    
    @Published var currentCube : CubeColor?
    @Published var cubeColorsArray: [String] = Array(repeating: "", count: 9)
    @Published var upgradeNumArray: [Int] = Array(repeating: 0, count: 9)
    
    @Published var gridFull = false
    @Published var cubeValue = 0
    
    @Published var flowers = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6"]
    
    @Published var flowersUnlocked: [String] = ["", "", "", "", "", ""]
    
    // Sees if game has been started before
    @Published var firstStartMessage = false
    @Published var firstWaterMessage = false
    
    // Creates the cube upgrades with an arrays that initialized the values below
    @Published var cubeColors: [ CubeColor ] = [
        CubeColor(imageName: "", color: .brown, numToUpgrade: 0),
        CubeColor(imageName: "drop.fill", color: .blue, numToUpgrade: 0),
        CubeColor(imageName: "sun.max.fill", color: .yellow, numToUpgrade: 3),
        CubeColor(imageName: "leaf.fill", color: .green, numToUpgrade: 3),
        CubeColor(imageName: "plant", color: .clear, numToUpgrade: 3)]
    
    
    
    // Function to change cube to water when button is clicked
    func getWaterCube(cubeColor: CubeColor) {
        let brownIndices = cubeColorsArray.indices.filter { cubeColorsArray[$0] == "" }
        if let randomIndex = brownIndices.randomElement() {
            cubeColorsArray[randomIndex] = cubeColor.imageName
        }
        buttonClickedNum += 1
        print(cubeColorsArray)
    }
    
    // Function that collects water and when meets requirements changes cube to sun
    func getSunCube(cubeColor: CubeColor, cubeClicked: Int) {
        var currentWaterCount = upgradeNumArray[cubeClicked]
        let blueIndices = cubeColorsArray.indices.filter { $0 != cubeClicked && cubeColorsArray[$0] == "drop.fill" }
        if !blueIndices.isEmpty {
            let randomIndex = blueIndices.randomElement()!
            if upgradeNumArray[randomIndex] > 0 {
                currentWaterCount += upgradeNumArray[randomIndex]
                upgradeNumArray[randomIndex] = 0
            }
            upgradeNumArray[cubeClicked] = currentWaterCount + 1
            cubeColorsArray[randomIndex] = ""
            
            if upgradeNumArray[cubeClicked] >= cubeColor.numToUpgrade {
                cubeColorsArray[cubeClicked] = "sun.max.fill"
                upgradeNumArray[cubeClicked] = 0
            } else {
                cubeColorsArray[cubeClicked] = "drop.fill"
            }
            print(blueIndices)
            print(upgradeNumArray)
        }
    }
    
    
    // Function that collects sun and when meets requirements changes cube to a grass
    func getGrassCube(cubeColor: CubeColor, cubeClicked: Int) {
        var currentSunCount = upgradeNumArray[cubeClicked]
        
        let yellowIndices = cubeColorsArray.indices.filter { $0 != cubeClicked && cubeColorsArray[$0] == "sun.max.fill" }
        if !yellowIndices.isEmpty {
            let randomIndex = yellowIndices.randomElement()!
            if upgradeNumArray[randomIndex] > 0 {
                currentSunCount += upgradeNumArray[randomIndex]
                upgradeNumArray[randomIndex] = 0
            }
            upgradeNumArray[cubeClicked] = currentSunCount + 1
            cubeColorsArray[randomIndex] = ""
        }
        
        if upgradeNumArray[cubeClicked] >= cubeColor.numToUpgrade {
            cubeColorsArray[cubeClicked] = "leaf.fill"
            upgradeNumArray[cubeClicked] = 0
        } else {
            cubeColorsArray[cubeClicked] = "sun.max.fill"
        }
        print(upgradeNumArray)
        
    }
    
    
    // Function that collects grass and when meets requirements changes cube to a plant
    func getPlantCube(cubeColor: CubeColor, cubeClicked: Int) {
        var currentGrassCount = upgradeNumArray[cubeClicked]
        
        let greenIndices = cubeColorsArray.indices.filter { $0 != cubeClicked && cubeColorsArray[$0] == "leaf.fill" }
        if !greenIndices.isEmpty {
            let randomIndex = greenIndices.randomElement()!
            if upgradeNumArray[randomIndex] > 0 {
                currentGrassCount += upgradeNumArray[randomIndex]
                upgradeNumArray[randomIndex] = 0
            }
            upgradeNumArray[cubeClicked] = currentGrassCount + 1
            cubeColorsArray[randomIndex] = ""
            
            if upgradeNumArray[cubeClicked] >= cubeColor.numToUpgrade {
                let randomElement = flowers.randomElement()
                cubeColorsArray[cubeClicked] = randomElement!
                if !flowersUnlocked.contains(randomElement!) {
                    flowersUnlocked.append(randomElement!)
                }
                upgradeNumArray[cubeClicked] = 0
            } else {
                cubeColorsArray[cubeClicked] = "leaf.fill"
            }
            print(upgradeNumArray)
        }
    }
    
    // Collect Flower
    func collectFlower(cubeClicked: Int) {
        cubeColorsArray.insert("", at: cubeClicked)
    }
    
    
    
    
    // Function to see if grid is full
    func isGridFull() -> Bool {
        return !cubeColorsArray.contains("")
    }
    
}

