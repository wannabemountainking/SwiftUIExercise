//
//  Login.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/14/25.
//

import SwiftUI

struct Login: View {
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @FocusState private var focusedField: Field?
    
    enum Field {
        case email
        case password
    }
    
    private var isFormValid: Bool {
        return emailAddress.contains("@") && password.count >= 6
    }
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    TextField("이메일을 입력하세요", text: $emailAddress)
                        .focused($focusedField, equals: .email)
                    SecureField("비밀번호를 입력하세요", text: $password)
                        .focused($focusedField, equals: .password)
                    Button {
                        // action: 조건을 통과하면 버튼색 파란색 활성화, 못하면 회색, 비활성화
                        isLoggedIn = true
                        focusedField = nil
                    } label: {
                        Text("로그인")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(isFormValid ? Color.blue : Color.gray)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }
                    .disabled(!isFormValid)


                }//: VStack
                .font(.headline)
                .padding(15)
                .padding(.horizontal, 10)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        focusedField = .   email
                    }
                }
                
                Spacer()
                // 조건을 통과하면 보이도록
                if isLoggedIn {
                    Text("환영합니다,\n\(emailAddress)!")
                        .font(.title)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }//: VStack
        }//: ZStack
    }//: body
}

#Preview {
    Login()
}
