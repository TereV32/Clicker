//
//  GameState.swift
//  Clicker
//
//  Created by Benjamin Cardenas on 4/4/23.
//

import Foundation

class GameState : ObservableObject {
    // Declares the Variables
    @Published var count = 0
    @Published var rainPerSecond = 0
    //Creates the rain generators
    @Published var rainGenerators: [ RainGenerator ] = [
        RainGenerator(name: "Rain Generator #1", rainPerSecond: 1, price: 10),
        RainGenerator(name: "Rain Generator #2", rainPerSecond: 2, price: 50),
        RainGenerator(name: "Rain Generator #3", rainPerSecond: 5, price: 150),
        RainGenerator(name: "Rain Generator #4", rainPerSecond: 10, price: 400)]

    //Declares the Timer
    var timer: Timer?
    
    // Initializes a count the timer.
    init() {
        self.count = 1
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.tick()
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
}
