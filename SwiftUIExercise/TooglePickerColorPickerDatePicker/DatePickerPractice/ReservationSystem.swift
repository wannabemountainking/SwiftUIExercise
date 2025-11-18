//
//  ReservationSystem.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/18/25.
//

import SwiftUI

struct ReservationSystem: View {
    let cal = Calendar.current
    let today = Date()
    
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var isEndBeforeStart = false
    
    
    // startTime과 endTime 간의 분단위 차이 == 회의 시간
    private var timeDiff: Int? {
        let diffCompo = cal.dateComponents([.minute], from: startTime, to: endTime)
        if diffCompo.minute ?? 0 < 0 {
            return nil
        }
        return diffCompo.minute ?? 0
    }
    
    var body: some View {
        
        let startDateOfToday = cal.startOfDay(for: today)
        var startCompo = cal.dateComponents([.hour, .minute], from: startTime)
        var endCompo = cal.dateComponents([.hour, .minute], from: endTime)
        var openingTime: Date {
            if endCompo.minute ?? 0 < startCompo.minute ?? 0 + 30 {
                let startTimeDate = cal.date(byAdding: .minute, value: -30, to: endTime) ?? startDateOfToday
                startCompo = cal.dateComponents([.hour, .minute], from: startTimeDate)
                return startTimeDate
            }
            return cal.date(byAdding: .hour, value: 9, to: startDateOfToday) ?? startDateOfToday
        }
        var closingTime: Date {
            if endCompo.minute ?? 0 < startCompo.minute ?? 0 + 30 {
                let endTimeDate = cal.date(byAdding: .minute, value: 30, to: startTime) ?? startDateOfToday
                endCompo = cal.dateComponents([.hour, .minute], from: endTimeDate)
                return endTimeDate
            }
            return cal.date(byAdding: .hour, value: 18, to: startDateOfToday) ?? startDateOfToday
        }

        
        NavigationStack {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    Text("회의 예약 시간")
                    Text("\(startCompo.hour ?? 0)시 \(startCompo.minute ?? 0)분 ~ \(endCompo.hour ?? 0)시 \(endCompo.minute ?? 0)분")
                    
                    // startTime DatePicker
                    DatePicker(
                        selection: $startTime,
                        in: openingTime ... closingTime,
                        displayedComponents: [.hourAndMinute]) {
                            Text("시작 시간")
                        }
                    // endTime DatePicker
                    DatePicker(
                        selection: $endTime,
                        in: openingTime ... closingTime,
                        displayedComponents: [.hourAndMinute]) {
                            Text("종료 시간")
                        }
                    
                }//: VStack
                .font(.headline)
                .padding()
                .padding(.horizontal, 50)

            }//: ZStack
            .navigationTitle("회의실 예약")
            .navigationBarTitleDisplayMode(.inline)
        }//: NavigationStack
    }// : body
}

#Preview {
    ReservationSystem()
}
