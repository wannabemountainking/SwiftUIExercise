//
//  MainInSettings.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/2/25.
//

import SwiftUI

struct MainInSettings: View {
    @State private var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.cyan.opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    //action
                    showSheet.toggle()
                } label: {
                    Text("설정 열기")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                        )
                }
            }
            .fullScreenCover(isPresented: $showSheet) {
                Settings()
            }
        }
    }
}

#Preview {
    MainInSettings()
}
