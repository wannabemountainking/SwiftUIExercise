//
//  BindingBasic.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/8/25.
//

import SwiftUI

struct BindingBasic: View {
    @State private var name: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            VStack(spacing: 20) {
                TextField("이름을 입력하세요", text: $name)
                    .padding()
                    .padding(.horizontal, 10)
                    .textFieldStyle(.roundedBorder)
                
                Button("인사하기") {
                    showAlert = (name.isEmpty) ? false : true
                }
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(name.isEmpty ? Color.clear : Color.white)
                .padding(10)
                .padding(.horizontal, 30)
                .background(name.isEmpty ? Color.clear : Color.blue)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
                .disabled(name.isEmpty)
            }
            .alert("안녕하세요!", isPresented: $showAlert, presenting: name.isEmpty ? nil : name) { _ in
                Button("확인", role: .confirm) {}
            } message: { name in
                Text("\(name)님, 반갑습니다!")
            }

        }
    }
}

#Preview {
    BindingBasic()
}
