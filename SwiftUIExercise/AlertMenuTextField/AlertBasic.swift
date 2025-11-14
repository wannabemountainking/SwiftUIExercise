//
//  SwiftUIView.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/6/25.
//

import SwiftUI

struct AlertBasic: View {
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Button {
                    //action
                    showAlert.toggle()
                } label: {
                    Text("알람 보기")
                        .font(.title3)
                        .foregroundStyle(Color.white)
                        .padding(12)
                        .padding(.horizontal, 12)
                        .background(Color.cyan)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10)
                        )
                }
                .alert("안녕하세요", isPresented: $showAlert) {
                    Button("확인", role: .confirm) { }
                } message: {
                    Text("첫 번째 Alert 입니다.")
                }

            }
        }
    }
}

#Preview {
    AlertBasic()
}
