//
//  AlarmTimePicker.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/16/25.
//

import SwiftUI

struct AlarmTimePicker: View {
    @State private var alarmTime: Date = Date()
    
    var body: some View {
        VStack(spacing: 30) {
            DatePicker(
                "알람 시간",
                selection: $alarmTime,
                displayedComponents: [.hourAndMinute]
            )
            .datePickerStyle(.wheel)
            .labelsHidden() // 라벨 숨기기
            
            Text("알람: \(alarmTime.formatted(date: .omitted, time: .shortened))")
                .font(.title)
        }
        .padding()
        .padding(.horizontal, 10)
    }
}

#Preview {
    AlarmTimePicker()
}
