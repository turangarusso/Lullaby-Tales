//
//  CustomComponent.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import Foundation
import SwiftUI

struct CustomTextfield: ViewModifier {
    var roundedCornes = 40.0
    var startColor: Color = .white
    var endColor: Color = .white

    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .accentColor(Color.black)
            .colorScheme(.light)
            .padding(3)
            .foregroundColor(Color("TextfieldInputColor"))
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))

//            .shadow(radius: 10)
    }
}


struct BigButtonStyle: ButtonStyle {
    
    @State var color: Color = .white   //default color if not initialized
    var roundedCornes = 40.0
    var startColor: Color = .white
    var endColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
            configuration
            .label
            .font(.subheadline)
            .bold()
            .padding()
            .frame(width: 150)
            .foregroundColor(Color("ButtonText"))
            .background(color)
            .cornerRadius(roundedCornes)
            .padding(3)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))
    }
}


struct MiddleButtonStyle: ButtonStyle {
    
    @State var color: Color = .white   //default color if not initialized
    
    func makeBody(configuration: Configuration) -> some View {
            configuration
            .label
            .font(.subheadline)
            .bold()
            .padding()
            .frame(width: 120)
            .foregroundColor(Color("ButtonText"))
            .background(color)
            .cornerRadius(40)
    }
}

