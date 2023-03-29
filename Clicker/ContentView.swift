//
//  ContentView.swift
//  Clicker
//
//  Created by Teresa Villegas on 3/1/23.
//

import SwiftUI
import SpriteKit
import EffectsLibrary

struct ContentView: View {
    
    @State public var count = 0
    @State private var button1Count = 0
    @State private var button2Count = 0
    @State private var button3Count = 0
    
    let rainEmitter = SKEmitterNode(fileNamed: "Rain.sks")!

    var rainScene: SKScene {
        let scene = RainScene.shared
        scene.size = UIScreen.screenSize
        scene.scaleMode = .fill
        scene.backgroundColor = .clear
        return scene
    }

    var body: some View {
//        ZStack {
//            SpriteView(scene: rainScene, options: .allowsTransparency)
//                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
//
            VStack {
                Spacer()
                
                Text("Total # of clicks: \(count)")
                
                Spacer()
                
                HStack {
                    Button {
                        button1Count += 1
                        count += 1
                    } label: {
                        Text("Button 1")
                    }
                    Text("Button 1: \(button1Count)")
                }
                Spacer()
            }
//        }
        .padding()
    }
//    func createResourceLabel(_ resource: String, _ resourceAction: String) -> some View {
//        HStack {
//            Image("\(resource)")
//            Button {
//                 += 1
//            } label: {
//                Text("\(resourceAction)")
//            }
//            Text("\(resource.capitalized): \(resourceCount)")
//        }
//    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

