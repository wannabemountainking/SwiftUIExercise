//
//  LanguageSettings.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/14/25.
//

import SwiftUI

struct LanguageSettings: View {
    
    private let basicLanguages = ["한국어 🇰🇷", "English 🇺🇸", "日本語 🇯🇵"]
    private let betaVersionLanguages = ["Español 🇪🇸", "Français 🇫🇷"]
    @State private var selectedLanguage: String = "한국어"
    @State private var showDialog: Bool = false
    @State private var betaVersionLanguagesAllowed: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Spacer()
                VStack(spacing: 50) {
                    Text("현재 언어: \(selectedLanguage)")
                        .font(.largeTitle)
                        .fontWeight(.ultraLight)
                    
                    HStack(spacing: 50) {
                        Button {
                            // action
                            betaVersionLanguagesAllowed.toggle()
                        } label: {
                            Text("베타 언어 표시")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(betaVersionLanguagesAllowed ? .green : .gray)
                            
                            Image(systemName: betaVersionLanguagesAllowed ? "checkmark.square.fill" : "square")
                                .foregroundStyle(betaVersionLanguagesAllowed ? .green : .gray)
                                .font(.title2)
                        }
                    }
                    
                    Button {
                        //action
                        showDialog = true
                    } label: {
                        Text("언어 변경")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }

                }// : VStack
                Spacer()
            }//: VStack
            .confirmationDialog(
                "언어 선택",
                isPresented: $showDialog,
                titleVisibility: .visible) {
                    ForEach(basicLanguages, id: \.self) { basic in
                        Button(basic) {
                            selectedLanguage = basic
                       }
                    }
                    if betaVersionLanguagesAllowed {
                        ForEach(betaVersionLanguages, id: \.self) { beta in
                            Button(beta) {
                                selectedLanguage = beta
                            }
                        }
                    }
                    Button("취소", role: .cancel) {  }
                } message: {
                    Text("원하는 언어를 선택하세요")
                }
        }//: ZStack
    }//: body
}

#Preview {
    LanguageSettings()
}
