//
//  AlarmBasic.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/13/25.
//

import SwiftUI

struct AlarmBasic: View {
    
    private let sounds: [String] = ["종소리", "새소리", "파도소리", "클래식"]
    
    @State private var resultAction: String = "현재 알람음: 기본 알람음"
    @State private var showActionSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Spacer()
                
               VStack(spacing: 50) {
                   Text(resultAction)
                        .font(.largeTitle)
                    Button {
                        //action
                        showActionSheet = true
                    } label: {
                        Text("알람음 변경")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal, 30)
                            .background(Color.blue)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }
                }
                Spacer()
            }
            .actionSheet(isPresented: $showActionSheet) {
                selectSound()
            }
        }// ZStack
    }//: body
    
    private func selectSound() -> ActionSheet {
        var buttons: [ActionSheet.Button] = sounds.map { sound in
            
            ActionSheet.Button.default(
                Text(sound)) {
                    resultAction = "현재 알림음: \(sound)"
                }
        }
        
        buttons.append(.cancel())
        return ActionSheet(
            title: Text("알람음 설정"),
            buttons: buttons
        )
    }
}

#Preview {
    AlarmBasic()
}
