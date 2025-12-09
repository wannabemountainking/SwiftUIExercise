//
//  GroupGroupBox.swift
//  SwiftUIExercise
//
//  Created by yoonie on 12/9/25.
//

import SwiftUI

struct GroupGroupBox: View {
    var userName: String = "홍길동"
    var userEmail: String = "hong@example.com"
    var appVersion: String = "1.0.0"
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                GroupBox {
                    //content
                    Text("이름: \(userName)")
                    Text("이메일: \(userEmail)")
                } label: {
                    HStack {
                        Image(systemName: "person.circle")
                        Text("계정정보")
                    }
                }
                .padding()
                
                GroupBox {
                    //content
                    Text("버전: \(appVersion)")
                    Text("개발자: 김도윤")
                } label: {
                    HStack {
                        Image(systemName: "info.circle")
                        Text("앱 정보")
                    }
                }
                .padding()

                Group {
                    Text("""
                        이용해주셔서 감사합니다.
                        문의사항은 이메일로
                        연락 부탁드립니다.
                        """)
                }
                .foregroundStyle(.gray)

            }
        }
    }
}

#Preview {
    GroupGroupBox()
}
