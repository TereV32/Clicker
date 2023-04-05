//
//  ContentView.swift
//  Clicker
//
//  Created by Teresa Villegas on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            RainView()
                .tabItem {
                    Label("Rain", systemImage: "moonphase.full.moon")
                }
            
            GrassView()
                .tabItem {
                    Label("Grass", systemImage: "moonphase.full.moon")
                }
        }
    }
}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
