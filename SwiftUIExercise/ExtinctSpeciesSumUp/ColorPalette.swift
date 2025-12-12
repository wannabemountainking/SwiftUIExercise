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

    @State private var currentColor: Color = .red
    
    private let basicColors: [BasicColor] = [
        BasicColor.red, .blue, .green, .yellow
    ]
    
    var body: some View {
        ZStack {
            currentColor.ignoresSafeArea()
            VStack {
                TabView(selection: $currentColor) {
                    ForEach(basicColors) { basicColor in
                        Text(basicColor.title)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(basicColor.textColor)
                            .tag(basicColor.color)
                            
                    }// LOOP
                }//: TabView
                .frame(height: 500)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .padding(.bottom, 50)
                
                HStack(spacing: 30) {
                    ForEach(basicColors) { basicTint in
                        Circle()
                            .foregroundStyle(basicTint.color)
                            .frame(height: currentColor == basicTint.color ? 90 : 60)
                            .overlay {
                                Circle()
                                    .stroke(.white.opacity(0.7), lineWidth: 3)
                                    .foregroundStyle(.clear)
                                    .overlay {
                                        Text(basicTint.title)
                                            .font(.headline)
                                            .foregroundStyle(basicTint.textColor)
                                    }//: circle()
                            }//: overlay
                            .onTapGesture {
                                currentColor = basicTint.color
                            }
                    }//: Loop
                }//: HStack
            }//: VStack
        }// ZStack
        .animation(.easeInOut(duration: 0.7), value: currentColor)
    }//: body
}




#Preview {
    ColorPalette()
}
