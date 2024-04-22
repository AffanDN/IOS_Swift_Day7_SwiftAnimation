//
//  ContentView.swift
//  SwiftAnimation
//
//  Created by Macbook Pro on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var colorChange = false
    @State private var sizeChanged = false
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(colorChange ? .white : .brown)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(colorChange ? .brown : .white)
                .font(.system(size: 100))
                .scaleEffect(sizeChanged ? 1.0 : 0.5)
        }
        // Implicit Animation
//        .animation(.bouncy, value: colorChange)
//        .animation(.easeInOut, value: sizeChanged)
        .onTapGesture {
            // Explicit Animation = hsrus didalam modifier
            withAnimation(.spring(.bouncy, blendDuration: 1.0)) {
                colorChange.toggle()
                sizeChanged.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
