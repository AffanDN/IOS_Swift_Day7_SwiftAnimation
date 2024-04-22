//
//  MorphingAnimation.swift
//  SwiftAnimation
//
//  Created by Macbook Pro on 22/04/24.
//

import SwiftUI

struct MorphingAnimation: View {
    @State private var recordBegin = false
    @State private var recording = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                .frame(width: recordBegin ? 60 : 250, height: 60)
                .foregroundStyle(.brown)
                .overlay {
                    Image(systemName: "globe.asia.australia.fill")
                        .font(.title)
                        .foregroundStyle(.white)
                        .scaleEffect(recording ? 1 : 3)
                }
            RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                .trim(from: 0.0, to: recordBegin ? 0.0 : 1)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ?  70 : 260, height: 70)
                .foregroundStyle(.brown)
        }
        .onTapGesture {
            withAnimation(.default) {
                recordBegin.toggle()
                recording.toggle()
            }
        }
    }
}

#Preview {
    MorphingAnimation()
}
