//
//  TogglePickerDatePicker.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/16/25.
//

import SwiftUI

struct BirdayPicker: View {
    @State private var birthdate: Date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            DatePicker(
                "생년월일",
                selection: $birthdate,
                in: ...Date(),
                displayedComponents: .date
            )
            .datePickerStyle(.graphical)
            
            Text("선택한 날짜: \(birthdate.formatted(date: .long, time: .omitted))")
        }
        .padding()
    }
}

#Preview {
    BirdayPicker()
}
