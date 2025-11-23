//
//  DarkModeCensor.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/23/25.
//

import SwiftUI

struct ThemeConfig {
    let backgroundColor: Color
    let iconName: String
    let iconColor: Color
    let modeText: String
    let descriptionText: String
    
    static let darkMode = ThemeConfig(
        backgroundColor: .blue,
        iconName: "moon.fill",
        iconColor: Color.gray,
        modeText: "다크",
        descriptionText: "지금은 다크 모드입니다. 눈부심이 훨씬 경감될 것입니다."
    )
    
    static let lightMode = ThemeConfig(
        backgroundColor: .yellow,
        iconName: "sun.max",
        iconColor: Color.pink,
        modeText: "라이트",
        descriptionText: "지금은 라이트 모드입니다. 낮의 상대적으로 강한 빛에도 컨텐츠가 잘 보입니다."
    )
}

struct DarkModeCensor: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var themeConfig: ThemeConfig {
        colorScheme == .dark ? .darkMode : .lightMode
    }

    var body: some View {
        ZStack {
            themeConfig.backgroundColor.ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image(systemName: themeConfig.iconName)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(themeConfig.iconColor)
                    .accessibilityLabel(themeConfig.modeText + " 모드 아이콘")
                
                Text("현재 모드: \(themeConfig.modeText)")

                Text(themeConfig.descriptionText)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
            }
            .font(.title3)
            .padding(20)
            .padding(.horizontal, 50)
        }
        .animation(.easeInOut(duration: 0.3), value: colorScheme)
    }
}

#Preview {
    DarkModeCensor()
}
