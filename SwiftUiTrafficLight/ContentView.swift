//
//  ContentView.swift
//  SwiftUiTrafficLight
//
//  Created by Виталий on 26.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var currentLightColor: Color?
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                trafficLightColor(color: redTrafficColor)
                Spacer().frame(height: 24)
                trafficLightColor(color: yellowTrafficColor)
                Spacer().frame(height: 24)
                trafficLightColor(color: greenTrafficColor)
                Spacer()
                
                nextButton
            }
            .padding()
        }
    }
    
    private var nextButton: some View {
        Button(action: { switchTrafficLight() }) {
            Text("NEXT")
                .foregroundColor(.white)
                .font(.title)
                .padding(
                    EdgeInsets(
                        top: 8,
                        leading: 32,
                        bottom: 8,
                        trailing: 32)
                )
        }
        .background(Color.blue)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white, lineWidth: 4)
        )
        .cornerRadius(16)
    }
    
    private var redTrafficColor: Color {
        generateTrafficColor(color: .red)
    }
    
    private var yellowTrafficColor: Color {
        generateTrafficColor(color: .yellow)
    }
    
    private var greenTrafficColor: Color {
        generateTrafficColor(color: .green)
    }
    
    private func switchTrafficLight() {
        guard let currentLightColor = self.currentLightColor else {
            self.currentLightColor = .red
            return
        }
        
        switch (currentLightColor) {
        case .green:
            self.currentLightColor = .red
        case .red:
            self.currentLightColor = .yellow
        case .yellow:
            self.currentLightColor = .green
        default:
            break
        }
    }
    
    private func trafficLightColor(color: Color) -> some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(color)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
    
    private func generateTrafficColor(color: Color) -> Color {
        var primaryColor = color
        if primaryColor != currentLightColor {
            primaryColor = primaryColor.opacity(0.4)
        }
        return primaryColor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
