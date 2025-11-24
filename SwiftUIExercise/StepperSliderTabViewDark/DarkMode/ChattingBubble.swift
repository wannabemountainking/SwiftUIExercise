//
//  ChattingBubble.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/23/25.
//

import SwiftUI

struct ChattingBubble: View {
    @Environment(\.colorScheme) var colorScheme
    private var myBackgroundColor: Color {
        colorScheme == .dark ? .blue : .yellow
    }
    private var textColor: Color {
        colorScheme == .dark ? .white : .black
    }
    private var yourBackgroundColor: Color {
        colorScheme == .dark ? .gray.opacity(0.8) : .gray.opacity(0.3)
    }
    
    var body: some View {
        ZStack {
            Color.teal.opacity(0.5).ignoresSafeArea()
            
            VStack(spacing: 5) {
                
                VStack {
                    HStack {
                        Text("나는 상대방이야")
                            .padding()
                            .background(yourBackgroundColor)
                            .clipShape(
                                UnevenRoundedRectangle(
                                    topLeadingRadius: 30,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 30,
                                    topTrailingRadius: 30
                                )
                            )
                        Spacer()
                    }

                    
                    HStack {
                        Text("문제 있나")
                            .padding()
                            .background(yourBackgroundColor)
                            .clipShape(
                                UnevenRoundedRectangle(
                                    topLeadingRadius: 30,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 30,
                                    topTrailingRadius: 30
                                )
                            )
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text("나는 나야")
                            .padding()
                            .background(myBackgroundColor)
                            .clipShape(
                                UnevenRoundedRectangle(
                                    topLeadingRadius: 30,
                                    bottomLeadingRadius: 30,
                                    bottomTrailingRadius: 0,
                                    topTrailingRadius: 30
                                )
                            )
                    }
                    HStack {
                        Spacer()
                        Text("문제 없지")
                            .padding()
                            .background(myBackgroundColor)
                            .clipShape(
                                UnevenRoundedRectangle(
                                    topLeadingRadius: 30,
                                    bottomLeadingRadius: 30,
                                    bottomTrailingRadius: 0,
                                    topTrailingRadius: 30
                                )
                            )
                    }
                }
                .font(.headline)
                .padding()
                .padding(.horizontal, 10)
                .foregroundStyle(textColor)
            }
        }
    }
}

#Preview {
    ChattingBubble()
}
