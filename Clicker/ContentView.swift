//
//  ContentView.swift
//  Clicker
//
//  Created by Teresa Villegas on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var button1Count = 0
    @State private var button2Count = 0
    @State private var button3Count = 0

    var body: some View {
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
            HStack {
                Button {
                    button2Count += 1
                    count += 1
                } label: {
                    Text("Button 2")
                }
                Text("Button 2: \(button2Count)")
            }
            HStack {
                Button {
                    button3Count += 1
                    count += 1
                } label: {
                    Text("Button 3")
                }
                Text("Button 3: \(button3Count)")
            }

        }
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
