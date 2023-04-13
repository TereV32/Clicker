//
//  PopUpMessages.swift
//  Clicker
//
//  Created by Teresa Villegas on 4/12/23.
//

import SwiftUI

struct PopUpMessages: View {
    var body: some View {
        VStack {
            ZStack() {
                Image(systemName: "bubble.middle.bottom.fill")
                    .resizable()
                    .frame(width: 200, height: 150)
                    .foregroundColor(Color.gray)
                Text("Tap the screen to \ncreate rain!")
                    .foregroundColor(Color.white)
            }
            Spacer()
        }
        .padding()
    }
}

//Creates a sheet view that allows the user to make upgrades
struct upgradeCube: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var gameState : GameState
    @Binding var color: Color

    
    var body: some View {
        VStack() {
            Text("\(gameState.waterCount) Water")
                .font(.subheadline)
            
            //Creates a list of upgrades
            List(gameState.cubeColors) { cubeColor in
                //Seperates into sections by category of upgrade
                Section {
                    HStack() {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(cubeColor.color)
                            .frame(width: 40, height: 40)
                            .padding()
                        VStack(alignment: .leading) {
                            Text("\(cubeColor.name)")
                            Text("Cost: \(cubeColor.waterPrice) Water")
                            Text("Cost: \(cubeColor.sunPrice) Sun")
                            
                        }
                        Spacer()
                        Group {
                            Button(action: {
                                self.gameState.purchaseCube(cubeColor: cubeColor)
                                self.color = gameState.currentCube?.color ?? .brown       //Changes the color of block selected to upgrade choosen
                                dismiss()       //Returns to main view after upgrade has been purchased
                            }) {
                                Text("Purchase")
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            .disabled((self.gameState.waterCount < cubeColor.waterPrice) || (self.gameState.sunCount < cubeColor.sunPrice))
                        }
                    }
                } footer: {
                    Text(cubeColor.description)
                }
            }
            .listStyle(.insetGrouped)
            
            //Allows user to get out of sheet
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark.app")
            }
        }
    }
}

//struct PopUpMessages_Previews: PreviewProvider {
//    static var previews: some View {
//        PopUpMessages()
//        upgradeCube(gameState: GameState())
//    }
//}
