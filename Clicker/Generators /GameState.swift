//
//  GameState.swift
//  Clicker
//
//  Created by Benjamin Cardenas on 4/4/23.
//

import Foundation

class GameState : ObservableObject {
    // Declares the Variables
    // Published prop. allows other views to react to changes
    @Published var waterCount = 0
    @Published var waterPerSceond = 0
    
    @Published var sunCount = 0
    
    @Published var oxygenCount = 0
    @Published var oxygenPerSecond = 0
    
    @Published var currentCube : CubeColor?
    
    //Sees if game has been started before
    @Published var firstStartMessage = false
    
    //Creates the cube upgrades with an arrays that initialized the values below
    @Published var cubeColors: [ CubeColor ] = [
        CubeColor(name: "Dirt", description: "", color: .brown, waterPerSecond: 0, oxygenPerSecond: 0, waterPrice: 0, sunPrice: 0),
        CubeColor(name: "Water", description: "Unlock water block: Produces 1 water/sec", color: .blue, waterPerSecond: 1, oxygenPerSecond: 0, waterPrice: 10, sunPrice: 0),
        CubeColor(name: "Grass", description: "Unlock grass block: Produces 1 oxygen/sec", color: .green, waterPerSecond: -1, oxygenPerSecond: 2, waterPrice: 15, sunPrice: 20)]
    
    //Declares the Timer with nil
    var timer: Timer?
    
    // Initializes a count timer that fires off every 1 second. Repears forever
    init() {
        self.waterCount = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.tick() // repeats ticks function to update raindrops/s
        })
    }
    
    
    // Function for a click to increment the count
    func rainClick() {
        self.waterCount += 1
    }
    // Function for a click to increment the count
    func sunClick() {
        self.sunCount += 1
    }
   
    // Function to purchase cubes and reduce count.
    func purchaseCube(cubeColor: CubeColor) {
        if cubeColor.waterPrice <= self.waterCount {
            if cubeColor.sunPrice <= self.sunCount {
                self.waterCount -= cubeColor.waterPrice
                self.sunCount -= cubeColor.sunPrice
                self.waterPerSceond += cubeColor.waterPerSecond
                self.oxygenPerSecond += cubeColor.oxygenPerSecond
                self.currentCube = cubeColor
            }
        }
    }
    
    
    // Function where it adds generators points to the count.
    func tick() {
        self.waterCount += self.waterPerSceond
    }
}
