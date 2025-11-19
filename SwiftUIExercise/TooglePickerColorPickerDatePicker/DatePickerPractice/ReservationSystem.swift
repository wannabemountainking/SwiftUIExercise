//
//  ReservationSystem.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/18/25.
//

import SwiftUI

struct ReservationSystem: View {
<<<<<<< HEAD
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
=======
    
    private let nineAMToSixPM: ClosedRange<Date> = {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: Date())
        components.hour = 9
        components.minute = 0
        let nineAM = calendar.date(from: components)!
        components.hour = 18
        let sixPM = calendar.date(from: components)!
        return nineAM ... sixPM
    }()
    
    let calendar = Calendar.current
    let today = Date()
    
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date().advanced(by: 3600)
    @State private var isEndBeforeStart: Bool = false
    @State private var isMeetingMinuteTooShort: Bool = false
    
    var meetingMinutes: Int {
        let diff = calendar.dateComponents([.minute], from: startTime, to: endTime)
        return diff.minute ?? 0
>>>>>>> origin/main
    }
    var startHourMinute: (hour: Int, minute: Int) {
        let compo = calendar.dateComponents([.hour, .minute], from: startTime)
        return (hour: (compo.hour ?? 0), minute: (compo.minute ?? 0))
    }
    var endHourMinute: (hour: Int, minute: Int) {
        let compo = calendar.dateComponents([.hour, .minute], from: endTime)
        return  (hour: (compo.hour ?? 0), minute: (compo.minute ?? 0))
    }
    
    var body: some View {
        
<<<<<<< HEAD
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

        
=======
>>>>>>> origin/main
        NavigationStack {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                VStack(spacing: 20) {
<<<<<<< HEAD
                    
                    Text("회의 예약 시간")
                    Text("\(startCompo.hour ?? 0)시 \(startCompo.minute ?? 0)분 ~ \(endCompo.hour ?? 0)시 \(endCompo.minute ?? 0)분")
                    
                    // startTime DatePicker
                    DatePicker(
                        selection: $startTime,
                        in: openingTime ... closingTime,
=======
                    VStack(spacing: 30) {
                        Text("회의 예약 시간")
                            .font(.title)
                            .fontWeight(.ultraLight)
                        
                        if isEndBeforeStart {
                            Text("회의 예약 시간 오류")
                                .fontWeight(.semibold)
                        } else if isMeetingMinuteTooShort {
                            Text("회의 시간은 최소한 30분 이상입니다")
                                .fontWeight(.light)
                        } else {
                        Text("\(startHourMinute.hour)시 \(startHourMinute.minute)분  ~  \(endHourMinute.hour)시 \(endHourMinute.minute)분 : \(meetingMinutes)분")
                                .fontWeight(.bold)
                        }
                    }
                    .font(.title3)

                    // startTime DatePicker
                    DatePicker(
                        selection: $startTime,
                        in: nineAMToSixPM,
>>>>>>> origin/main
                        displayedComponents: [.hourAndMinute]) {
                            Text("시작 시간")
                        }
                    // endTime DatePicker
                    DatePicker(
                        selection: $endTime,
<<<<<<< HEAD
                        in: openingTime ... closingTime,
=======
                        in: nineAMToSixPM,
>>>>>>> origin/main
                        displayedComponents: [.hourAndMinute]) {
                            Text("종료 시간")
                        }
                    
<<<<<<< HEAD
                }//: VStack
                .font(.headline)
                .padding()
                .padding(.horizontal, 50)
=======
                    Button(action: {
                        //cation
                        checkMeetingMinutes()
                    }, label: {
                        Text("예약")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal, 120)
                            .background(Color.blue.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    .alert(
                        "회의 시간 설정 오류",
                        isPresented: $isEndBeforeStart
                    ) {
                        Button {
                            // action
                            checkMeetingMinutes()
                        } label: {
                            Text("확인")
                        }
                    } message: {
                        Text("입력하신 회의 시간은 종료 시간이 시작 시간보다 \(abs(meetingMinutes))분 빠릅니다.")
                    }
                    
                    Spacer()
                }//: VStack
                .font(.headline)
                .padding()
                .padding(.horizontal, 30)
                .datePickerStyle(.automatic)

>>>>>>> origin/main

            }//: ZStack
            .navigationTitle("회의실 예약")
            .navigationBarTitleDisplayMode(.inline)
<<<<<<< HEAD
        }//: NavigationStack
    }// : body
=======

        }//: NavigationStack
    }// : body
    
    private func checkMeetingMinutes() {
        print("isStartBeforeEnd: \(isEndBeforeStart)")
        print("isMeetingMinuteTooShort: \(isMeetingMinuteTooShort)")
        isEndBeforeStart = meetingMinutes < 0
        isMeetingMinuteTooShort = meetingMinutes < 30 && meetingMinutes >= 0
    }
    
>>>>>>> origin/main
}

#Preview {
    ReservationSystem()
}
