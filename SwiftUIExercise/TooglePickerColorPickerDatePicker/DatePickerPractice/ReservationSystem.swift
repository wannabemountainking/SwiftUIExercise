//
//  ReservationSystem.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/18/25.
//

import SwiftUI

struct ReservationSystem: View {
    @State private var startHour: Int = 9
    @State private var startMinute: Int = 0
    @State private var endHour: Int = 18
    @State private var endMinute: Int = 0
    
    let cal = Calendar.current
    // startTime : 시작시간 Date
    private var startTime: Date {
        let components = DateComponents(hour: startHour, minute: startMinute)
        return cal.date(from: components) ?? Date()
    }
    // // endTime : 끝나는 시간 Date
    private var endTime: Date {
        let components = DateComponents(hour: endHour, minute: endMinute)
        return cal.date(from: components) ?? Date()
    }
    
    private var timeDiff: Int {
        let compo = cal.dateComponents([.minute], from: startTime, to: endTime)
        return diff.minute ?? 0
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ReservationSystem()
}
