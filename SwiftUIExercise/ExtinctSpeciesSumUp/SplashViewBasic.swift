//
//  SplashViewBasic.swift
//  SwiftUIExercise
//
//  Created by yoonie on 12/9/25.
//

import SwiftUI

struct SplashViewBasic: View {
    @State private var isLoading: Bool = true
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack(spacing: 50) {
                if isLoading {
                    ProgressView()
                        .scaleEffect(3)
                    Text("로딩 중...")
                        .font(.title)
                } else {
                    Text("환영합니다!")
                        .font(.largeTitle)
                        .fontWeight(.ultraLight)
                }
            }
            .task {
                try? await Task.sleep(for: .seconds(2))
                withAnimation(.easeInOut(duration: 0.7)) {
                    isLoading = false
                }
            }
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    withAnimation(.easeInOut(duration: 0.7)) {
//                        isLoading = false
//                    }
//                }
//            }
        }
    }
}

#Preview {
    SplashViewBasic()
}
