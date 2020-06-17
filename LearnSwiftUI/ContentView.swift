//
//  ContentView.swift
//  LearnSwiftUI
//
//  Created by Sergey Lavrov on 18.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let redTarget = Double.random(in: 0..<1)
    let greenTarget = Double.random(in: 0..<1)
    let blueTarget = Double.random(in: 0..<1)
    @State var redGuess: Double
    @State var greenGuess: Double
    @State var blueGuess: Double
    
    var body: some View {
        VStack{
            HStack {
                // Целевой цветной блок
                VStack {
                    Rectangle().foregroundColor(Color(red: redTarget, green: greenTarget, blue: blueTarget))
                    Text("Угадай этот цвет")
                }
                // Угадывание цветного блока
                VStack{
                    Rectangle().foregroundColor(Color(red: redGuess, green: greenGuess, blue: blueGuess))
                    HStack {
                        Text("R: \(Int(redGuess * 255.0))").foregroundColor(.red)
                        Text("G: \(Int(greenGuess * 255.0))").foregroundColor(.green)
                        Text("B: \(Int(blueGuess * 255.0))").foregroundColor(.blue)
                    }
                }
            }
            VStack{
                HStack{
                    Text("0").foregroundColor(.red)
                    Slider(value: $redGuess)
                    Text("255").foregroundColor(.red)
                }.padding()
                HStack{
                    Text("0").foregroundColor(.green)
                    Slider(value: $greenGuess)
                    Text("255").foregroundColor(.green)
                }.padding()
                HStack{
                    Text("0").foregroundColor(.blue)
                    Slider(value: $blueGuess)
                    Text("255").foregroundColor(.blue)
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(redGuess: 0.5, greenGuess: 0.5, blueGuess: 0.5)
    }
}
