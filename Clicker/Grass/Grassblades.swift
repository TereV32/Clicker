//
//  Grassblades.swift
//  Clicker
//
//  Created by Teresa Villegas on 4/4/23.
//

import SwiftUI

struct Grassblades: View {
    
    @State private var isAnimating = false
    @State private var imageScale = 0.0
    
    var body: some View {
        VStack {
            Image("grassblade")
                .resizable()
                .scaledToFit()
                .scaleEffect(imageScale)
//                .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        imageScale = 0.5
                    }
                    self.isAnimating = true
                }
        }
    }
}

struct randomGrassView: View {
//    @Binding var grassCount: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
//                ForEach(0..<grassCount) { _ in
                ForEach(0..<100) { _ in

                    Grassblades()
                        .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .offset(x: CGFloat.random(in: 0...geometry.size.width), y: CGFloat.random(in: 0...geometry.size.height))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
        .ignoresSafeArea()
    }
    
}


struct Grassblades_Previews: PreviewProvider {
    static var previews: some View {
        Grassblades()
        randomGrassView()
    }
}
