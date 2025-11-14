//
//  ContextMenuBasic.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/11/25.
//

import SwiftUI

struct ContextMenuBasic: View {
    @State private var statusText: String = ""
    @State private var background: Color = Color.cyan
    
    var body: some View {
        ZStack {
            Color.orange.opacity(0.6).ignoresSafeArea()
            VStack(spacing: 30) {
                Text(statusText)
                
                VStack(spacing: 10) {
                    Text("Context Menu Test")
                        .font(.headline)
                    Text("이 버튼을 길게 누르면 메뉴가 나옵니다")
                        .font(.subheadline)
                }
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal, 20)
                .background(background)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
                .contextMenu {
                    Button {
                        //action
                        statusText = "공유가 되었습니다"
                        background = Color.yellow
                    } label: {
                        Label("Share Post", systemImage: "square.and.arrow.up")
                    }
                    
                    Button {
                        //action
                        statusText = "신고 되었습니다"
                        background = Color.red
                    } label: {
                        Label("Report Post", systemImage: "exclamationmark.bubble")
                    }
                    
                    Button {
                        //action
                        statusText = "좋아요 추가!"
                        background = Color.green
                    } label: {
                        Label("Like Post", systemImage: "hand.thumbsup")
                    }

                }
            }
            
        }
    }
}



#Preview {
    ContextMenuBasic()
}
