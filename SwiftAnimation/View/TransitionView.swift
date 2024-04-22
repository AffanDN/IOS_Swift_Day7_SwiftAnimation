//
//  TransitionView.swift
//  SwiftAnimation
//
//  Created by Macbook Pro on 22/04/24.
//

import SwiftUI

struct TransitionView: View {
    @State private var show = false
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.brown)
                .overlay {
                    Text("Show Details")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.mint)
//                    .transition(.scale(scale: 0, anchor: .bottom))
                    .transition(.offsetScaleOpacity)
                    .overlay {
                        Text("Well It Goes Like This")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                }
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }
        .onTapGesture {
            withAnimation(.bouncy) {
                show.toggle()
            }
        }
    }
}

#Preview {
    TransitionView()
}

// MARK: - EXTENSION
extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
//        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0))
    }
}

