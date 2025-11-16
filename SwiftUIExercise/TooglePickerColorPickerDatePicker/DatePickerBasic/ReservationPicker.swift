//
//  ReservationPicker.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/16/25.
//

import SwiftUI

struct ReservationPicker: View {
    @State private var reservationDate: Date = Date()
    
    let startDate: Date = Date() // 오늘
    let endDate: Date = Calendar.current
        .date(
            byAdding: .day,
            value: 30,
            to: Date()
        ) ?? Date()
    
    var body: some View {
        Form {
            Section("예약 정보") {
                DatePicker(
                    "예약 날짜",
                    selection: $reservationDate,
                    in: startDate...endDate,
                    displayedComponents: [.date, .hourAndMinute]
                )
            }
            
            Section("예약 내용") {
                Text("예약일: \(reservationDate.formatted())")
            }
        }
    }
}

#Preview {
    ReservationPicker()
}
