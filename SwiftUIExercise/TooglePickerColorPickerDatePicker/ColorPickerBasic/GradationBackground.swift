//
//  GradationBackground.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/16/25.
//

import SwiftUI

struct GradationBackground: View {
    @State private var startColor: Color = .white
    @State private var endColor: Color = .black
    @State private var isReset: Bool = true
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [startColor, endColor],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 0.5), value: startColor)
            .animation(.easeInOut(duration: 0.5), value: endColor)
            
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    ColorPicker(selection: $startColor, supportsOpacity: true) {
                        HStack {
                            Image(systemName: "arrow.up.circle.fill")
                                .foregroundStyle(startColor)
                            Text("시작 색")
                        }
                    }
                    .onChange(of: startColor) { _, _ in
                        isReset = false
                    }
                    
                    Divider()
                    
                    ColorPicker(selection: $endColor, supportsOpacity: true) {
                        HStack {
                            Image(systemName: "arrow.down.circle.fill")
                                .foregroundStyle(endColor)
                            Text("마지막 색")
                        }
                    }
                    .onChange(of: endColor) { _, _ in
                        isReset = false
                    }
                }
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
                .padding(.horizontal, 100)
                .background(.ultraThinMaterial)
                
                Spacer()
                
                Button {
                    //action
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                        startColor = .white
                        endColor = .black
                        isReset = true
                    }
                    
                } label: {
                    HStack {
                        Image(systemName: isReset ? "checkmark.circle.fill" : "arrow.counterclockwise.circle.fill")
                        Text(isReset ? "초기화 완료" : "색상 초기화")
                    }
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(isReset ? Color.gray.opacity(0.6) : .blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .disabled(isReset)
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
                .shadow(color: isReset ? .clear : .blue, radius: 8, x: 2, y: 4)
            }
        }
    }
}

#Preview {
    GradationBackground()
}
