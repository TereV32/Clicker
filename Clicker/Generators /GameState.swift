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
    @Published var count = 0
    @Published var rainPerSecond = 0
    
    @Published var lightningCount = 0
    @Published var priceOfLightning = 1000;
    
    //Creates the rain generators with an arrays that initialized the values below
    @Published var rainGenerators: [ RainGenerator ] = [
        RainGenerator(name: "Rain Cloud #1", rainPerSecond: 10, price: 10),
        RainGenerator(name: "Rain Cloud #2", rainPerSecond: 2, price: 50),
        RainGenerator(name: "Rain Cloud #3", rainPerSecond: 5, price: 150),
        RainGenerator(name: "Rain Cloud #4", rainPerSecond: 10, price: 400)]
    
    //Declares the Timer with nil
    var timer: Timer?
    
    // Initializes a count timer that fires off every 1 second. Repears forever
    init() {
        self.count = 1
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.tick() // repeats ticks function to update raindrops/s
        })
    }
    
    // Function for a click to increment the count
    func click() {
        self.count += 1
    }
    
    // Function to purchase generators and reduce count.
    func purchase(rainGenerator: RainGenerator) {
        if rainGenerator.price <= self.count {
            self.count -= rainGenerator.price
            self.rainPerSecond += rainGenerator.rainPerSecond
        }
    }
    

    // Function where it adds generators points to the count. 
    func tick() {
        self.count += self.rainPerSecond
    }
    
    // Function that creates lightning
    func purchaseLightning() {
        if priceOfLightning <= count {
            self.count -= priceOfLightning
            self.lightningCount += 1
        }
    }
}
