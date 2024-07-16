//
//  CircleProgress.swift
//  SummerProject
//
//  Created by Claude White on 2024-07-11.
//

import SwiftUI

struct CircleProgress: View {
    @State var progress: Double
    @State var value = 0.0
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .frame(width: 50, height: 50)
                .foregroundStyle(Color.clear)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
            Circle()
                .stroke(lineWidth: 0.1)
                .frame(width: 40, height: 40)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.3), .clear]), startPoint: .bottomTrailing, endPoint: .topLeading))
                .overlay {
                    Circle()
                        .stroke(.black.opacity(0.1), lineWidth: 2)
                        .blur(radius: 5)
                        .mask {
                            Circle()
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        }
                }
            Circle()
                .trim(from: 0, to: value)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.mint, .accentColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .onAppear {
            withAnimation {
                value = progress
            }
        }
    }
}

#Preview {
    CircleProgress(progress: 0.3)
}
