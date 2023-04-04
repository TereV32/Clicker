//
//  PointGenerator.swift
//  Clicker
//
//  Created by Benjamin Cardenas on 4/4/23.
//

import Foundation

// Declares the variables for the Rain Generetors
struct RainGenerator : Identifiable {
    var id = UUID()
    var name: String
    var rainPerSecond: Int
    var price: Int
}
