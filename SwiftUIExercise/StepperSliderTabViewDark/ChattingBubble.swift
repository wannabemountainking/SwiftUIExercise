//
//  ChattingBubble.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/23/25.
//

import SwiftUI


struct ThemeConfigSettings {
    let textColor: Color
    let cellColorOfMine: Color
    let cellColorOfCounterpart: Color
    
    static let darkMode = ThemeConfigSettings(
        textColor: .white,
        cellColorOfMine: .blue,
        cellColorOfCounterpart: Color.gray.opacity(0.4)
    )
    static let lightMode = ThemeConfigSettings(
        textColor: .black,
        cellColorOfMine: .yellow,
        cellColorOfCounterpart: Color.gray.opacity(0.1)
    )
}

struct ChattingBubble: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.5).ignoresSafeArea()
            
            VStack {
                <#code#>
            }
        }
    }
}


#Preview {
    ChattingBubble()
}
