//
//  AlertBasic3.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/6/25.
//

import SwiftUI

struct AlertBasic3: View {
    @State private var showBackground: Bool = false
    @State private var backgroundColor: Color = .white
    
    enum BackgroundColor: String, Identifiable, CaseIterable {
        case red = "빨강"
        case blue = "파랑"
        
        var id: Self { self }
        
        var backColor: Color {
            switch self {
            case .red:
                return Color.red
            case .blue:
                return Color.blue
            }
        }
    }
    private let colors: Array<BackgroundColor> = BackgroundColor.allCases
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
           VStack() {
                Button {
                    //action
                    showBackground.toggle()
                } label: {
                    Text("배경색 변경")
                        .font(.title3)
                        .padding(12)
                        .padding(.horizontal, 12)
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10)
                        )
                }
                .alert("배경색 변경", isPresented: $showBackground) {
                    ForEach(colors, id: \.self.id) { color in
                        Button {
                            //action
                            backgroundColor = color.backColor
                        } label: {
                            Text(color.rawValue)
                                .font(.headline)
                        }
                    }
                    Button("취소", role: .cancel) {}
                    
                } message: {
                    Text("배경색을 선택하세요")
                }

            }
        }
    }
}

#Preview {
    AlertBasic3()
}
