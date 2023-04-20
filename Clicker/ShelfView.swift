//
//  ShelfView.swift
//  Clicker
//
//  Created by Benjamin Cardenas on 4/19/23.
//

import SwiftUI

struct ShelfView: View {
    private let data: [Int] = Array(1...16)
    
    // Set the image of flowers later
    private let flowers: [Color] = [.gray, .gray]
    
    // Flexible columns that fill the remaining space
    private let numberColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()) ]
    
    // Adaptive to make sure its the size of smallest element
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    // Fixed creates columns with fixed dimensions
    private let fixedColumns = [
        GridItem(.fixed(200)),
        GridItem(.fixed(200))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundColor(flowers[number%2])
                                .cornerRadius(30)
                                //.disabled(true)
                                
                                
                                
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.automatic)
            .navigationTitle("Flower Shelf")
            .padding()
            
        }
    }
    
}

struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView()
    }
}
