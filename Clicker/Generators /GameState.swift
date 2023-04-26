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
    
    @Published var currentCube : CubeColor?
    @Published var cubeClicked = 0
    @Published var cubeColorsArray: [String] = ["", "", "", "", "", "", "", "", ""]
    
    @Published var gridFull = false
    
    @Published var upgradeWaterComplete = false
    @Published var upgradeSunComplete = false
    @Published var upgradeGrassComplete = false

    
    @Published var flowers = ["Flower1", "Flower2", "Flower3", "Flower4", "Flower5", "Flower6"]
    
    // Sees if game has been started before
    @Published var firstStartMessage = false
    
    // Creates the cube upgrades with an arrays that initialized the values below
    @Published var cubeColors: [ CubeColor ] = [
        CubeColor(imageName: "", color: .brown, numToUpgrade: 0),
        CubeColor(imageName: "drop.fill", color: .blue, numToUpgrade: 0),
        CubeColor(imageName: "sun.max.fill", color: .yellow, numToUpgrade: 1),
        CubeColor(imageName: "leaf.fill", color: .green, numToUpgrade: 1),
        CubeColor(imageName: "plant", color: .clear, numToUpgrade: 1)]
    
//    //Declares the Timer with nil
//    var timer: Timer?
//
//    // Initializes a count timer that fires off every 1 second. Repears forever
//    init() {
//        self.waterCount = 0
//        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
//            self.tick() // repeats ticks function to update raindrops/s
//        })
//    }
    
    
    // Function to change cube to water when button is clicked
    func getWaterCube(cubeColor: CubeColor) {
        let BrownIndices = cubeColorsArray.indices.filter { cubeColorsArray[$0] == "" }
        if let randomIndex = BrownIndices.randomElement() {
            cubeColorsArray[randomIndex] = cubeColor.imageName
//            objectWillChange.send()
        }
        print(cubeColorsArray)
    }
    
    // Function that collects water and when meets requirements changes cube to sun
    func getSunCube(cubeColor: CubeColor) {
        cubeColorsArray.remove(at: cubeClicked)
        let blueIndices = cubeColorsArray.indices.filter { cubeColorsArray[$0] == "drop.fill"  }
        print(blueIndices)
        print(cubeClicked)
        if let randomIndex = blueIndices.randomElement() {
            cubeColorsArray[randomIndex] = ""
//            objectWillChange.send()
        }
        if !blueIndices.isEmpty {
            waterCount += 1
        }
        if waterCount == cubeColor.numToUpgrade {
            cubeColorsArray.insert("sun.max.fill", at: cubeClicked)
            upgradeWaterComplete = true
            waterCount = 0
        } else {
            cubeColorsArray.insert("drop.fill", at: cubeClicked)
            upgradeWaterComplete = false
        }
    }
    
    // Function that collects sun and when meets requirements changes cube to a grass
    func getGrassCube(cubeColor: CubeColor) {
        cubeColorsArray.remove(at: cubeClicked)
        let yellowIndices = cubeColorsArray.indices.filter { cubeColorsArray[$0] == "sun.max.fill"  }
        print(yellowIndices)
        print(cubeClicked)
        if let randomIndex = yellowIndices.randomElement() {
            cubeColorsArray[randomIndex] = ""
//            objectWillChange.send()
        }
        if !yellowIndices.isEmpty {
            sunCount += 1
        }
        if sunCount == cubeColor.numToUpgrade {
            cubeColorsArray.insert("leaf.fill", at: cubeClicked)
            upgradeSunComplete = true
            sunCount = 0
        } else {
            cubeColorsArray.insert("sun.max.fill", at: cubeClicked)
            upgradeSunComplete = false
        }
    }
    
    // Function that collects grass and when meets requirements changes cube to a plant
    func getPlant(cubeColor: CubeColor) {
        cubeColorsArray.remove(at: cubeClicked)
        let greenIndices = cubeColorsArray.indices.filter { cubeColorsArray[$0] == "leaf.fill" }
        print(greenIndices)
        print(cubeClicked)
        if let randomIndex = greenIndices.randomElement() {
            cubeColorsArray[randomIndex] = ""
        }
        if !greenIndices.isEmpty {
            grassCount += 1
        }
        if grassCount == cubeColor.numToUpgrade {
            cubeColorsArray.insert(flowers.randomElement()!, at: cubeClicked)
            upgradeGrassComplete = true
            grassCount = 0
            print(cubeColorsArray)
        } else {
            cubeColorsArray.insert("leaf.fill", at: cubeClicked)
            upgradeGrassComplete = false
        }
    }
    
//    // Function where it adds generators points to the count.
//    func tick() {
//        self.waterCount += self.waterPerSceond
//    }
    
    // Function to see if grid is full
    func isGridFull() -> Bool {
        return cubeColorsArray.allSatisfy{ $0 == "drop.fill" }
    }
}
