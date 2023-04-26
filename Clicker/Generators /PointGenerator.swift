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
    var imageName: String
    var color: Color
    var numToUpgrade: Int
}
