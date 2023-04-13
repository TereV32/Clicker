//
//  CubeView.swift
//  Clicker
//
//  Created by Teresa Villegas on 4/12/23.
//

import SwiftUI

//Creates a single cube to be added to grid
struct CubeView: View {

    @ObservedObject var gameState : GameState
    @State var color: Color
    @State var isSelected =  false
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            RoundedRectangle(cornerRadius: 5)
                .fill(color)
                .frame(width: 60, height: 60)
        }
        .sheet(isPresented: $isSelected)  {

        } content: {
            upgradeCube(gameState: gameState, color: $color)
        }
    }
}

//Creates a 3x3 grid of cubes
struct CubeGridView: View {

    @ObservedObject var gameState : GameState
    
    var body: some View {
        Grid {
            ForEach(0..<3, id: \.self) { row in
                GridRow {
                    ForEach(0..<3, id: \.self) { column in
                        CubeView(gameState: gameState, color: gameState.currentCube?.color ?? .brown)
                    }
                }
            }
        }
    }
}

struct CubeView_Previews: PreviewProvider {
    static var previews: some View {
        CubeGridView(gameState: GameState())
    }
}
