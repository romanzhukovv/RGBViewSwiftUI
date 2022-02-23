//
//  ContentView.swift
//  RGBViewSwiftUI
//
//  Created by Roman Zhukov on 23.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State private var redTFValue = ""
    @State private var greenTFValue = ""
    @State private var blueTFValue = ""
    
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack {
                ColorView(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue)
                VStack {
                    HStack {
                        Text("\(lround(redSliderValue))").frame(width: 40, alignment: .leading)
                        ColorSliderView(value: $redSliderValue, color: .red, valueToTF: $redTFValue)
                        TextField("0", text: $redTFValue, onEditingChanged: { _ in
                            withAnimation {
                                redSliderValue = Double(redTFValue)!
                            }
                        })
                            .frame(width: 50)
                            .multilineTextAlignment(.trailing)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                    }
                    .onAppear {
                        redTFValue = "\(lround(redSliderValue))"
                    }
                    HStack {
                        Text("\(lround(greenSliderValue))").frame(width: 40, alignment: .leading)
                        ColorSliderView(value: $greenSliderValue, color: .green, valueToTF: $greenTFValue)
                        TextField("0", text: $greenTFValue, onEditingChanged: { _ in
                            greenSliderValue = Double(greenTFValue)!
                        })
                            .frame(width: 50)
                            .multilineTextAlignment(.trailing)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                    }
                    .onAppear {
                        greenTFValue = "\(lround(greenSliderValue))"
                    }
                    HStack {
                        Text("\(lround(blueSliderValue))").frame(width: 40, alignment: .leading)
                        ColorSliderView(value: $blueSliderValue, color: .blue, valueToTF: $blueTFValue)
                        TextField("0", text: $blueTFValue, onEditingChanged: { _ in
                            blueSliderValue = Double(blueTFValue)!
                        })
                            .frame(width: 50)
                            .multilineTextAlignment(.trailing)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                    }
                    .onAppear {
                        blueTFValue = "\(lround(blueSliderValue))"
                    }
                }
                .frame(width: 300)
                .padding(.top, 50)
                Spacer()
            }
            .padding(.top, 50)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    let color: Color
    @Binding var valueToTF: String
    
    var body: some View {
        Slider(value: $value, in: 0...255)
            .onChange(of: value, perform: { newValue in
                valueToTF = String(lround(newValue))
            })
            .tint(color)
    }
}
