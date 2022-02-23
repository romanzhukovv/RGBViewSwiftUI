//
//  ColorView.swift
//  RGBViewSwiftUI
//
//  Created by Roman Zhukov on 23.02.2022.
//

import SwiftUI

struct ColorView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color.init(red: red / 255,
                                        green: green / 255,
                                        blue: blue / 255))
            .frame(width: 300, height: 150, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 5))
            .shadow(radius: 10)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 25, green: 25, blue: 25)
    }
}
