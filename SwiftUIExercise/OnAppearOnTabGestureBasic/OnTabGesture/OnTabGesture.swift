//
//  OnTabGesture.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/26/25.
//

import SwiftUI

struct OnTabGesture: View {
    @State private var currentColor: Color = .green
    
    private let colors: [Color] = [.red, .blue, .green, .yellow, .purple]
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
            
            NavigationStack {
                VStack(spacing: 20) {
                    HStack {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .fill(color)
                                .overlay(content: {
                                    Circle()
                                        .stroke(color.opacity(0.2), lineWidth: currentColor == color ? 15 : 0)
                                })
                                .padding(7)
                                .onTapGesture {
                                    currentColor = color
                                }
                        }
                    }
                    RoundedRectangle(cornerRadius: 25)
                        .fill(currentColor)
                }
                .padding(25)
                .navigationTitle("색상 팔레트")
                .navigationBarTitleDisplayMode(.inline)
                .animation(.easeInOut(duration: 0.5), value: currentColor)
            }//:NavigationStack
        }//: ZStack
    }
}

#Preview {
    OnTabGesture()
}
