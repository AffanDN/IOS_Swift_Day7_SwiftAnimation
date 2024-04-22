//
//  LoadingIndicator.swift
//  SwiftAnimation
//
//  Created by Macbook Pro on 22/04/24.
//

import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        VStack (spacing: 30){
            LoadingProgress()
            LoadingWithProgress()
        }
    }
}

#Preview {
    LoadingIndicator()
}

struct LoadingProgress: View {
    @State private var isLoading: Bool = false
    var body: some View {
        Circle()
            .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.7)
            .stroke(Color.brown, lineWidth: 5)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
            .onAppear {
                isLoading = true
            }
    }
}

struct LoadingWithProgress: View {
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    var body: some View {
        ZStack {
            Text("\(progress * 100, specifier: "%.f")%")
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 12)
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.7)
                .stroke(Color.brown, lineWidth: 5)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
                .onAppear {
                    isLoading = true
                    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
                        if progress > 1.0 {
                            progress = 0.0
                        } else {
                            progress += 0.05
                        }
                    }
                }
        }
        .frame(width: 100, height: 100)
    }
}
