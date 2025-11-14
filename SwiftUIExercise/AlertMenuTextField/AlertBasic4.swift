//
//  AlertBasic4.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/6/25.
//

import SwiftUI

struct AlertBasic4: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var alertType: AlertType?
    @State private var showAlert: Bool = false
    
    enum AlertType: Identifiable {
        case emptyUsername
        case emptyPassword
        case weakPassword
        case success
        var id: Self { self }
        
        var title: String {
            switch self {
            case .emptyUsername: return "사용자 이름 입력"
            case .emptyPassword: return "비밀번호 입력"
            case .weakPassword: return "비밀번호 보안 취약"
            case .success: return "성공"
            }
        }
        
        var message: String {
            switch self {
            case .emptyUsername: return "사용자 이름을 입력하세요"
            case .emptyPassword: return "비밀번호를 입력하세요"
            case .weakPassword: return "비밀번호는 8자 이상이며 대문자, 소문자, 숫자, 특수문자(!@#$%^&*)가 각각 1자 이상 포함되어야 합니다"
            case .success: return "로그인 성공!"
            }
        }
        
    }
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack(spacing: 20) {
                    TextField("username", text: $username, prompt: Text("사용자 이름을 입력하세요"))
                    SecureField("password", text: $password, prompt: Text("비밀번호를 입력하세요"))
                }
                .font(.title3)
                .padding(.horizontal, 30)
                .textFieldStyle(.roundedBorder)
                
                Button {
                    //action
                    validateForm()
                } label: {
                    Text("로그인")
                        .font(.title3)
                        .padding(10)
                        .padding(.horizontal, 20)
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10)
                        )
                } // : button
            } // : VStack
            .padding()
            .alert(
                alertType?.title ?? "알림",
                isPresented: $showAlert,
                presenting: alertType) { type in
                    Button("확인", role: .cancel) {}
                } message: { type in
                    Text(type.message)
                }
        } // : ZStack
    } //: body
    
    func validateForm() {
        let strongPassword = isStrongPassword(password)
        if username.isEmpty {
            alertType = .emptyUsername
            showAlert = true
        } else if password.isEmpty {
            alertType = .emptyPassword
            showAlert = true
        } else if !strongPassword {
            alertType = .weakPassword
            showAlert = true
        } else {
            alertType = .success
            showAlert = true
        }
    }
    
    func isStrongPassword(_ password: String) -> Bool {
        let hasUppercase = password.range(of: "[A-Z]", options: .regularExpression) != nil
        let hasLowercase = password.range(of: "[a-z]", options: .regularExpression) != nil
        let hasNumber = password.range(of: "[0-9]", options: .regularExpression) != nil
        let hasSpecial = password.range(of: "[!@#$%^&*]", options: .regularExpression) != nil
        return password.count >= 8 && hasNumber && hasSpecial && hasLowercase && hasUppercase
    }
}

#Preview {
    AlertBasic4()
}
