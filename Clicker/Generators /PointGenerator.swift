//
//  PointGenerator.swift
//  Clicker
//
//  Created by Benjamin Cardenas on 4/4/23.
//

import Foundation
import SwiftUI

// Declare CubeColor structure with variables for Cube Upgrades
struct CubeColor : Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var color: Color
    var waterPerSecond: Int
    var oxygenPerSecond: Int
    var waterPrice: Int
    var sunPrice: Int
}
