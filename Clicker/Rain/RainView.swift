//
//  RainView.swift
//  Clicker
//
//  Created by Teresa Villegas on 3/30/23.
//

import SwiftUI

struct RainView: View {
    
    @State public var count = 0
    @State private var button1Count = 0
    @State public var rainPerSecond = 0
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("Raindrops: \(count)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(4)
                Text("\(rainPerSecond)/s: ")
                    .font(.headline) //Add raindrops per second
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                Spacer()
                Spacer()
                Spacer()
                
                if count >= 10 {
                    VStack {
                        HStack {
                            Button {
                                rainPerSecond = 1
                            } label: {
                                Text("Auto Rain")
                                    .padding(20)
                                    .background(.blue)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
                
                HStack {
                    Button {
                        button1Count += 1
                        count += 1
                    } label: {
                        Text("Make it Rain Bitch!")
                            .padding(20)
                            .background(.blue)
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Capsule())
                        
                    }
                }
            }.onReceive(timer, perform: { _ in
                count = count + rainPerSecond
            })
        }
    }
}

struct RainView_Previews: PreviewProvider {
    static var previews: some View {
        RainView()
    }
}
