//
//  RainDrop.swift
//  Clicker
//
//  Created by Teresa Villegas on 4/3/23.
//

import SwiftUI

// Creates one raindrop view
struct RainDrop: View {
    
    // Places raindrop in random y position
    @State private var yPosition = CGFloat.random(in: -100...0)
    // Chooses a different opacity for every raindrop
    @State private var opacity = Double.random(in: 0.1...0.7)
    @State private var isAnimating = false

    var body: some View {
        VStack {
            Image("raindrop")
                .opacity(opacity)
                .offset(y: isAnimating ? UIScreen.main.bounds.height - yPosition : -200)
                .animation(Animation.easeInOut(duration: Double.random(in: 2...6)).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear() {
                    self.isAnimating = true
                }
        }
    }
}

// Creates an x amount of raindrops depending on rainPerSecond
struct RainDropView: View {
    @Binding var rainPerSecond: Int

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(Array(0..<rainPerSecond), id: \.self) { _ in
                    RainDrop()
                        .frame(width: 2, height: 60)
                        .offset(x: CGFloat.random(in: 0...geometry.size.width))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
        .ignoresSafeArea()
    }
}


struct RainDrop_Previews: PreviewProvider {
    static var previews: some View {
        RainDrop()
    }
}
