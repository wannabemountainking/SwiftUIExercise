//
//  ThemeEditor.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/13/25.
//

import SwiftUI

struct ThemeEditor: View {
    @State private var showDialog = false
    @State private var currentTheme = "기본 테마"

    private let themes = ["라이트 모드 ☀️", "다크 모드 🌙", "자동 🔄"]
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 50) {
                    Text(currentTheme)
                        .font(.title)
                    
                    Button {
                        //action
                        showDialog = true
                    } label: {
                        Text("테마 변경")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal, 30)
                            .background(Color.blue)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }
                }//: VStack
                Spacer()
            }//: VStack
            .confirmationDialog(
                "테마 옵션",
                isPresented: $showDialog) {
                    ForEach(themes, id: \.self) { theme in
                        Button {
                            // action
                            currentTheme = "현재 테마: \(theme)"
                        } label: {
                            Text(theme)
                                .font(.headline)
                        }
                    }
                    Button("취소", role: .cancel) { }
                }
        }//: ZStack
    }//: body
}

#Preview {
    ThemeEditor()
}
