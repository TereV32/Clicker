//
//  ContentView.swift
//  Clicker
//
//  Created by Teresa Villegas on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State public var count = 0
    @State private var button1Count = 0
    
    var body: some View {
        
        RainView()
        
//        VStack {
//            Text("Rain Total: \(count)")
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(.black)
//                .padding(4)
//            Text("Rain Drops/s: ")
//                .font(.headline) //Add raindrops per second
//                .foregroundColor(.black)
//                .multilineTextAlignment(.center)
//            Spacer()
//            Spacer()
//            Spacer()
//
//            HStack {
//                Button {
//                    button1Count += 1
//                    count += 1
//                } label: {
//                    Text("Make it Rain Bitch!")
//                        .padding(20)
//                        .background(.blue)
//                        .foregroundColor(.white)
//                        .font(.title)
//                        .clipShape(Capsule())
//                }
//            }
//        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

