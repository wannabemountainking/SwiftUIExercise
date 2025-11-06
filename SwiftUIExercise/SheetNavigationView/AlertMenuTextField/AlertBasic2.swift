//
//  AlertBasic2.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/6/25.
//

import SwiftUI

struct AlertBasic2: View {
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            
            VStack {
                Button {
                    //action
                    showAlert.toggle()
                } label: {
                    Text("항목 삭제")
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundStyle(.red)
                        .padding(12)
                        .padding(.horizontal, 12)
                        .background(.yellow)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10)
                        )
                }
                .alert("정말 삭제하시겠습니까?", isPresented: $showAlert) {
                    Button("취소", role: .cancel) {
                        print("취소됨")
                    }
                    Button("삭제", role: .destructive) {
                        print("삭제됨")
                    }
                } message: {
                    Text("이 작업은 취소할 수 없습니다")
                }

            }
        }
    }
}

#Preview {
    AlertBasic2()
}
