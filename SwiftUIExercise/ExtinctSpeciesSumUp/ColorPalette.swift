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
                Spacer()
                Text(basicColors.first(where: {$0.color == currentColor})!.title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(basicColors.first(where: { $0.color == currentColor })!.textColor)
                Spacer()
                TabView(selection: $currentColor) {
                    Color.orange
                }//: TabView
                .frame(height: 100)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .padding(.bottom, 50)
                
                HStack {
                    ForEach(basicColors) { basicColor in
                        VStack {
                            Circle()
                                .foregroundStyle(basicColor.color)
                                .overlay {
                                    Circle()
                                        .stroke(basicColor.color == currentColor ? .white : basicColor.color, lineWidth: 5)
                                }
                                .overlay(content: {
                                    Text(basicColor.title)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(basicColor.textColor)
                                })
                                .frame(width: basicColor.color == currentColor ? 80 : 60, height: basicColor.color == currentColor ? 80 : 60)
                                .padding()
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        currentColor = basicColor.color
                                    }
                                }
                        }// : VStack
                        .tag(basicColor.color)
                    }// LOOP
                }
            }//: VStack
        }// ZStack
    }//: body
}

#Preview {
    ColorPalette()
}
