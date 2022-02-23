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
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.init(red: redSliderValue/255,
                                                green: greenSliderValue/255,
                                                blue: blueSliderValue/255))
                    .frame(width: 300, height: 150, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 5))
                    .shadow(radius: 10)
                VStack {
                    HStack {
                        Text("\(lround(redSliderValue))").frame(width: 40, alignment: .leading)
                        ColorSliderView(value: $redSliderValue, color: .red)
                        TextField("0", text: $redTFValue).frame(width: 40)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("\(lround(greenSliderValue))").frame(width: 40, alignment: .leading)
                        ColorSliderView(value: $greenSliderValue, color: .green)
                        TextField("0", text: $greenTFValue).frame(width: 40)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("\(lround(blueSliderValue))").frame(width: 40, alignment: .leading)
                        ColorSliderView(value: $blueSliderValue, color: .blue)
                        TextField("0", text: $blueTFValue).frame(width: 40)
                            .multilineTextAlignment(.trailing)
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
    
    var body: some View {
        Slider(value: $value, in: 0...255)
            .tint(color)
    }
}
