//
//  ScoreSystem.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/8/25.
//

import SwiftUI

struct ScoreSystem: View {
    @State private var score: Int = 0
    @State private var showAlert: Bool = false
    @State private var buttonColor: ButtonColor?
    private let buttonColors: [ButtonColor] = [.red, .blue, .green]
    
    enum ButtonColor: Identifiable {
        case red, blue, green
        
        var id: String {
            switch self {
            case .red: return "red"
            case .blue: return "blue"
            case .green: return "green"
            }
        }
        
        var title: String {
            switch self {
            case .red: return "빨간색"
            case .blue: return "파란색"
            case .green: return "초록색"
            }
        }
        
        var color: Color {
            switch self {
            case .red: return Color.red
            case .blue: return Color.blue
            case .green: return Color.green
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Text("총 점수: \(score)")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .foregroundStyle(buttonColor?.color ?? Color.black)
                
                HStack(spacing: 20) {
                    ForEach(buttonColors, id: \.self) { color in
                        Button {
                            //action
                            withAnimation {
                                showAlert = true
                                buttonColor = color
                                score += 10
                            }
                        } label: {
                            Text(color.title)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .padding(10)
                                .padding(.horizontal, 15)
                                .background(color.color.opacity(0.7))
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                        }
                    }//: ForEach
                } //: HStack
            } // : VStack
            .alert(
                "득점!",
                isPresented: $showAlert,
                presenting: buttonColor) { color in
                    Button("확인", role: .confirm) { }
                } message: { color in
                    Text("\(color.title) 버튼으로 10점 획득! 현재 점수: \(score)")
                }
        }// : ZStack
    }
}

#Preview {
    ScoreSystem()
}
