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
    @Published var waterCount = 0
    @Published var sunCount = 0
    @Published var grassCount = 0
    @Published var buttonClickedNum = 0
    
    @Published var currentCube : CubeColor?
    @Published var cubeClicked = 0
    @Published var cubeColorsArray: [String] = Array(repeating: "", count: 9)
    @Published var upgradeNumArray: [Int] = Array(repeating: 0, count: 9)
    
    @Published var gridFull = false
    @Published var gridsUnlocked = 3
    @Published var cubeValue = 0
    
    @Published var upgradeWaterComplete = false
    @Published var upgradeSunComplete = false
    @Published var upgradeGrassComplete = false

    @Published var numflowersCollected = 0
    
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
    func getSunCube(cubeColor: CubeColor) {
        cubeColorsArray.remove(at: cubeClicked)
        let blueIndices = cubeColorsArray.indices.filter { cubeColorsArray[$0] == "drop.fill" }
        if let randomIndex = blueIndices.randomElement() {
            let resourceCount = upgradeNumArray[randomIndex]
            if resourceCount > 0 {
                
                let collectedResources = upgradeNumArray[cubeClicked]
                print("res \(resourceCount), coll \(collectedResources), amount now \(resourceCount + collectedResources)")
                upgradeNumArray.insert(resourceCount + collectedResources, at: cubeClicked)
                upgradeNumArray.insert(0, at: randomIndex)
            }
            cubeColorsArray[randomIndex] = ""
        }
        
        
        
        if !blueIndices.isEmpty {
            upgradeNumArray[cubeClicked] += 1
            if upgradeNumArray[cubeClicked] >= cubeColor.numToUpgrade {
                cubeColorsArray.insert("sun.max.fill", at: cubeClicked)
                upgradeNumArray.insert(0, at: cubeClicked)
            } else {
                cubeColorsArray.insert("drop.fill", at: cubeClicked)
            }
        }
    }
    
    
    // Function that collects sun and when meets requirements changes cube to a grass
    func getGrassCube(cubeColor: CubeColor) {
        cubeColorsArray.remove(at: cubeClicked)
        let yellowIndices = cubeColorsArray.indices.filter { cubeColorsArray[$0] == "sun.max.fill" }
        if let randomIndex = yellowIndices.randomElement() {
            cubeColorsArray[randomIndex] = ""
            if upgradeNumArray[randomIndex] != 0 {
                upgradeNumArray[cubeClicked] = upgradeNumArray[randomIndex]
                upgradeNumArray[randomIndex] = 0
                print(upgradeNumArray)
            }
        }
        
        if !yellowIndices.isEmpty {
            upgradeNumArray[cubeClicked] += 1
            print(upgradeNumArray)
        }
        if upgradeNumArray[cubeClicked] >= cubeColor.numToUpgrade {
            cubeColorsArray.insert("leaf.fill", at: cubeClicked)
            upgradeNumArray[cubeClicked] = 0
        } else {
            cubeColorsArray.insert("sun.max.fill", at: cubeClicked)
        }
        
    }
    
    
    // Function that collects grass and when meets requirements changes cube to a plant
    func getPlantCube(cubeColor: CubeColor) {
        cubeColorsArray.remove(at: cubeClicked)
        let greenIndices = cubeColorsArray.indices.filter { cubeColorsArray[$0] == "leaf.fill" }
        if let randomIndex = greenIndices.randomElement() {
            cubeColorsArray[randomIndex] = ""
            if upgradeNumArray[randomIndex] != 0 {
                upgradeNumArray[cubeClicked] = upgradeNumArray[randomIndex]
                upgradeNumArray[randomIndex] = 0
                print(upgradeNumArray)
            }
            
        }
        
        if !greenIndices.isEmpty {
            upgradeNumArray[cubeClicked] += 1
            print(upgradeNumArray)
        }
        if upgradeNumArray[cubeClicked] >= cubeColor.numToUpgrade {
            let randomElement = flowers.randomElement()
            cubeColorsArray.insert(randomElement!, at: cubeClicked)
            if !flowersUnlocked.contains(randomElement!) {
                flowersUnlocked.append(randomElement!)
            }
            print(cubeColorsArray)
            upgradeGrassComplete = true
            upgradeNumArray[cubeClicked] = 0
        } else {
            cubeColorsArray.insert("leaf.fill", at: cubeClicked)
        }
        
    }
    
    // Collect Flower
    func collectFlower(cubeColor: CubeColor) {
        cubeColorsArray.insert("", at: cubeClicked)
        numflowersCollected += 1
        gridsUnlocked += 1
    }
    
    
    
    
    // Function to see if grid is full
    func isGridFull() -> Bool {
        return !cubeColorsArray.contains("")
    }
    
    
    
}
