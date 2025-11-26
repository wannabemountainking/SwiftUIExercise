//
//  DoubleTab.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/26/25.
//

import SwiftUI

struct DoubleTab: View {
    @State private var showHeart: Bool = false
    @State private var numberOfLikes: Int = 0
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 100) {
                ZStack {
                    // 항상 존재하는 베이스 이미지
                    Image(systemName: "pointer.arrow.click.2")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .foregroundStyle(.indigo)
                        .opacity(showHeart ? 0 : 1)
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .foregroundStyle(.red)
                        .scaleEffect(showHeart ? 1.2 : 0.5)
                        .opacity(showHeart ? 1 : 0)
                }
                .onTapGesture(count: 2) {
                    guard !showHeart else {return}
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                        showHeart = true
                    }
                    numberOfLikes += 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showHeart = false
                        }
                    }
                }

                Text("👍 : \(numberOfLikes)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    DoubleTab()
}
