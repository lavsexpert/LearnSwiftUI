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
    @State var showAlert = false
    
    func computeScore() -> Int {
        let redDiff = redGuess - redTarget
        let greenDiff = greenGuess - greenTarget
        let blueDiff = blueGuess - blueTarget
        let diff = sqrt(redDiff * redDiff + greenDiff * greenDiff + blueDiff * blueDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
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
                ColorSlider(value: $redGuess, textColor: .red)
                ColorSlider(value: $greenGuess, textColor: .green)
                ColorSlider(value: $blueGuess, textColor: .blue)
            }
            Button(action: {
                self.showAlert = true
            }){
                Text("Сверить цвета")
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 00))
                .alert(isPresented: $showAlert){
                    Alert(title: Text("Ваш результат"), message: Text("\(computeScore())"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(redGuess: 0.5, greenGuess: 0.5, blueGuess: 0.5)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack{
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
    }
}
