//
//  MessageAppWithAlarm.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/23/25.
//

import SwiftUI


struct MessageAppWithAlarm: View {
    @State private var unread: Int = 5
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack(spacing: 20) {
                TabView {
                    Tab("채팅", systemImage: "message.fill") {
                        ChatView(unread: $unread)
                    } 
                    .badge(unread)
                    Tab("연락처", systemImage: "person.2.fill") {
                        Contact()
                    }
                    Tab("프로필", systemImage: "person.circle.fill") {
                        Profile()
                    }
                }
            }
        }
    }
}

struct ChatView: View {
    @Binding var unread: Int
    
    var body: some View {
        if unread != 0 {
            Text("\(unread)개의 읽지 않은 메시지가 있습니다.")
        } else {
            Text("모든 메시지를 읽었습니다.")
        }
        Button("메세지 읽기") {
            //action
            unread = 0
        }
        .font(.headline)
        .fontWeight(.semibold)
        .foregroundStyle(.white)
        .frame(height: 40)
        .frame(maxWidth: .infinity)
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(20)

    }
}

struct Contact: View {
    var body: some View {
        Text("연락처 화면입니다")
    }
}
struct Profile: View {
    var body: some View {
        Text("프로필 화면입니다.")
    }
}

#Preview {
    MessageAppWithAlarm()
}
