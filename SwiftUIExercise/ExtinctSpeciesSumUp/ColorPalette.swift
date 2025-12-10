//
//  ColorPalette.swift
//  SwiftUIExercise
//
//  Created by yoonie on 12/11/25.
//

import SwiftUI


enum BasicColor: Identifiable {
    case red
    case blue
    case green
    case yellow
    
    var id: String {
        switch self {
        case .red: return "red"
        case .blue: return "blue"
        case .green: return "green"
        case .yellow: return "yellow"
        }
    }
    
    var title: String {
        switch self {
        case .red: return "빨강"
        case .blue: return "파랑"
        case .green: return "초록"
        case .yellow: return "노랑"
        }
    }
    
    var color: Color {
        switch self {
        case .red: return .red
        case .blue: return .blue
        case .green: return .green
        case .yellow: return .yellow
        }
    }
    
    var textColor: Color {
        switch self {
        case .red: return .white
        case .blue: return .white
        case .green: return .white
        case .yellow: return .black
        }
    }
}

struct ColorPalette: View {
    @State private var currentColor: Color = .white
    
    private let basicColors: [BasicColor] = [
        BasicColor.red, .blue, .green, .yellow
    ]
    
    var body: some View {
        ZStack {
            currentColor.ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                GroupBox {
                    TabView(selection: $currentColor) {
                        ForEach(basicColors) { basicColor in
                            basicColor.color.ignoresSafeArea()
                            Text(basicColor.title)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundStyle(basicColor.textColor)
                        }//: Loop
                    }//: TabView
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }//: GroupBox
                Spacer()
                
                
            }//: VStack
        }
        
    }//: body
}

#Preview {
    ColorPalette()
}
