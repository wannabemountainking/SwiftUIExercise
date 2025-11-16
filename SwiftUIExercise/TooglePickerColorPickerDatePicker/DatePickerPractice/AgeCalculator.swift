//
//  AgeCalculator.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/17/25.
//

import SwiftUI

struct AgeCalculator: View {
    @State private var birthdate: Date = Date()
    @State private var hasSetup: Bool = false
    let cal = Calendar.current
    let today = Date()

    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.orange.opacity(0.3).ignoresSafeArea()
                
                VStack(spacing: 50) {
                    
                    VStack(spacing: 20) {
                        Text(hasSetup ? age(birthdate: birthdate) : "생일을 설정해주세요")
                            .font(.largeTitle)
                            .fontWeight(.ultraLight)
                        Text(daysLeftNextBirthday())
                            .font(.headline)
                            .fontWeight(.bold)
                    }//: VStack
                    DatePicker(selection: $birthdate,
                               in: ...Date(),
                               displayedComponents: .date
                    ) {
                        Text("생일 설정")
                    }//: DatePicker
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black.opacity(0.5))
                    .datePickerStyle(.compact)
                    .padding(.horizontal, 70)
                    .onChange(of: birthdate) { (oldValue, newValue) in
                        if oldValue != newValue {
                            hasSetup = true
                        }
                    }
                    .labelsHidden()
                    
                    Spacer()
                }//:VStack
            } //: ZStack
            .navigationTitle("나이 계산")
            .navigationBarTitleDisplayMode(.inline)
        }//: navigationStack

    }//: body
    private func age(birthdate: Date) -> String {
        let birthCompo = cal.dateComponents([.year], from: birthdate, to: today)
        guard let age = birthCompo.year else {return ""}
        return "만 \(age)세"
    }
    
    private func daysLeftNextBirthday() -> String {
        // 다음 생일의 Date를 nextDate로 산출
        let birthCompo = cal.dateComponents([.month, .day], from: birthdate)
        guard let nextBirthday = cal.nextDate(
            after: today,
            matching: birthCompo,
            matchingPolicy: .nextTime
        ) else {
            return "생일을 입력해주세요"
        }
        // 다음 생일 Date와 지금 간의 DateComponents.day로 남은 날 계산
        guard let daysLeft = cal.dateComponents([.day], from: today, to: nextBirthday).day else {
            return "다음 생일까지 남은 날짜를 계산하지 못했습니다."
        }
        return "다음 생일까지 \(daysLeft)일 남았습니다"
    }
}

#Preview {
    AgeCalculator()
}
