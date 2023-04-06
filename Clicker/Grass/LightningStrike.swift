//
//  LightnngStrike.swift
//  Clicker
//
//  Created by Teresa Villegas on 4/4/23.
//

import SwiftUI

struct LightningStrike: View {
    
    @State private var isAnimating = false
    @State private var imageScale = 0.0
    
    var body: some View {
        VStack {
            Image("custom.cloud.moon.bolt")
                .resizable()
                .scaledToFit()
                .scaleEffect(imageScale)
//                .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear {
                    withAnimation(.easeOut(duration: 1.0)) {
                        imageScale = 1
                    }
                    self.isAnimating = true
                }
        }
    }
}

struct randomLightningView: View {
    @Binding var lightningCount: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(Array(0..<lightningCount), id: \.self) { _ in
                    LightningStrike()
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


struct LightningStrike_Previews: PreviewProvider {
    static var previews: some View {
        LightningStrike()
    }
}
