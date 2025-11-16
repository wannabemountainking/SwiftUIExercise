//
//  DarkMode.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/16/25.
//

import SwiftUI

struct DarkMode: View {
    @State private var isDarkOn: Bool = false
    
    var body: some View {
        ZStack {
            (isDarkOn ? Color.black : Color.white)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                activateDarkMode()
                
                Toggle(isOn: $isDarkOn) {
                    Text("모드 선택")
                }
                .foregroundStyle(isDarkOn ? .white : .black)
            }
            .font(.headline)
            .padding()
            .padding(.horizontal)
        }
    }
    
    private func activateDarkMode() -> Text {
        
        return Text("다크모드가 \(isDarkOn ? "비" : "")활성화되었습니다")
            .font(.title3)
            .foregroundStyle(isDarkOn ? .white : .black)
    }
}

#Preview {
    DarkMode()
}
