//
//  PointGenerator.swift
//  Clicker
//
//  Created by Benjamin Cardenas on 4/4/23.
//

import Foundation

// Declares RainGenerator structure with variables for the Rain Generetors
struct RainGenerator : Identifiable {
    var id = UUID()
    var name: String
    var rainPerSecond: Int
    var price: Int
}

// Declare LightningGenerator structure with variables for Lightning Generators
struct LightningGenerator : Identifiable {
    var id = UUID()
    var name: String
    var lightning: Int
    var price: Int
}
