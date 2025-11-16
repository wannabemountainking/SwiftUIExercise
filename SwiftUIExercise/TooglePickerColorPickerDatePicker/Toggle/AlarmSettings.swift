//
//  AlarmSettings.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/16/25.
//

import SwiftUI


struct AlarmSettings: View {
    @State private var isTotalNotiOn: Bool = false
    @State private var isEmailNotiOn: Bool = false
    @State private var isPushNotiOn: Bool = false
    
    private var alarmStatusView: some View {
        return VStack(spacing: 10) {
            Text("전체 알림이 \(isTotalNotiOn ? "켜졌" : "꺼졌")습니다")
            Text("이메일 알림이 \(isTotalNotiOn && isEmailNotiOn ? "켜졌" : "꺼졌")습니다")
            Text("푸시 알림이 \(isTotalNotiOn && isPushNotiOn ? "켜졌" : "꺼졌")습니다")
        }
    }
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 10) {
                    alarmStatusView
                }//: VStack
                .font(.title)
                
                VStack(spacing: 10) {
                    Toggle(isOn: $isTotalNotiOn) {
                        Text("전체 알림")
                    }
                    Toggle(isOn: $isEmailNotiOn) {
                        Text("이메일 알림")
                    }
                    .disabled(!isTotalNotiOn)
                    Toggle(isOn: $isPushNotiOn) {
                        Text("푸시 알림")
                    }
                    .disabled(!isTotalNotiOn)
                }//: VStack
                .font(.headline)
                .padding()
                .padding(.horizontal)
                
                Spacer()
            }//: VStack
        }//: ZStack
    }//: body
}

#Preview {
    AlarmSettings()
}
