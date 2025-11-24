//
//  OnAppearBasic.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/24/25.
//

import SwiftUI

struct OnAppearBasic: View {
    @State private var opacity: Double = 0.0
    private var textColor: Color { Color.blue.opacity(opacity) }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .foregroundStyle(textColor)
            }//: ScrollView
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    withAnimation(.spring(duration: 3.0)) {
//                        opacity = 1.0
//                    }
//                }
//            }
            .task {
                do {
                    try await Task.sleep(for: .seconds(0.5))
                    
                    if Task.isCancelled {
                        print("Task was cancelled")
                        return
                    }
                    
                    withAnimation(.easeIn(duration: 3.0)) {
                        opacity = 1.0
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            .navigationTitle("on Appear 연습")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        //destination
                        ProfileView()
                    } label: {
                        Label("profile", systemImage: "person.fill")
                    }
                }
            }
            
            
        }//: NavigationStack
    }
}

struct ProfileView: View {
    var body: some View {
        Text("나의 프로필 화면입니다")
            .font(.largeTitle)
            .fontWeight(.ultraLight)
    }
}

#Preview {
    OnAppearBasic()
}
