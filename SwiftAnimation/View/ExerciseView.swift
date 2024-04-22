//
//  ExerciseView.swift
//  SwiftAnimation
//
//  Created by Macbook Pro on 22/04/24.
//

import SwiftUI

struct ExerciseView: View {
    @State private var show = false
    @State private var loading =  false
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .font(.system(size: 100))
                .foregroundStyle(.brown)
            
            if show {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("5.0 😎")
                        .transition(.iniAnimasi)
                }
            } else {
                HStack {
                    ForEach (0...4, id: \.self) {
                        item in Circle()
                            .frame(width: 20, height: 10)
                            .foregroundStyle(loading ? .blue : .mint)
                            .scaleEffect(loading ? 1.0 : 0.4)
                            .animation(.linear(duration:0.6).repeatForever().delay(0.2 * Double(item)), value: loading)
                    }
                }
            }
        }
        .onTapGesture {
            withAnimation(.bouncy) {
                startDelay()
                loading.toggle()
            }
        }
    }
}

#Preview {
    ExerciseView()
}

extension AnyTransition {
    static var iniAnimasi: AnyTransition {
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .top), removal: .offset(x: 0, y: 600))
    }
}

extension ExerciseView {
    func startDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            show.toggle()
        }
    }
}
