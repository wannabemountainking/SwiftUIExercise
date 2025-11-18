//
//  DDays.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/17/25.
//

import SwiftUI

struct DDays: View {
    @State private var targetDate: Date = Date()
    
    var body: some View {
        
        // ✅ 구역 1: 계산/로직 공간 (View를 반환하지 않는 일반 Swift 코드)
        let components = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: targetDate)
        let days = components.day ?? 0
        let hours = components.hour ?? 0
        
        // ✅ 구역 2: View 반환 공간 (반드시 View를 반환해야 함)
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack(spacing: 50) {
                DatePicker(
                    "목표 날짜 선택",
                    selection: $targetDate,
                    in: Date()...,
                    displayedComponents: .date
                )//: DatePicker
                .padding()
                .padding(.horizontal)
                .datePickerStyle(.graphical)
                Text(days == 0 ? "D-Day!" : "D-  \(days)일 \(hours)시간")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.indigo)
                Spacer()
            }//: VStack
        }//: ZStack
    }//: body
}

#Preview {
    DDays()
}
