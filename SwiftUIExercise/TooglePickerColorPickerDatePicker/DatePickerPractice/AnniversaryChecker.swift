//
//  AniversaryChecker.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/19/25.
//

import SwiftUI

struct Anniversary: Identifiable {
    let id = UUID()
    var title: String
    var today: Date = Date()
    var anniversaryDate: Date

    var dateString: String {
        let calendar = Calendar.current
        let anniCompo: DateComponents = calendar.dateComponents([.month, .day], from: anniversaryDate)
        
        
        guard let nextAnniversary = calendar.nextDate(
                after: today,
                matching: anniCompo,
                matchingPolicy: .nextTime
        ) else {
            return "날짜 오류"
        }
        
        let nextAnniYear = calendar.dateComponents([.year], from: nextAnniversary)
        let thisYear = calendar.dateComponents([.year], from: today)
        let isPassed = nextAnniYear != thisYear
        
        let daysLeft = calendar.dateComponents([.day], from: today, to: nextAnniversary).day ?? 0
        return isPassed ? "내년까지 \(daysLeft)일" : "남은 일수 \(daysLeft)일"
    }
}

struct AnniversaryChecker: View {
    @State private var anniversaries: [Anniversary] = []
    @State private var annualEvent: String = ""
    @State private var annualEventDate: Date = Date()
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    TextField("기념 제목을 적고 기념일을 체크", text: $annualEvent)
                        .textFieldStyle(.roundedBorder)
                        .font(.headline)
                    Spacer()
                    List {
                        ForEach($anniversaries) { $anniversary in
                            HStack {
                                Text(anniversary.title)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(anniversary.dateString)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    
                    Spacer()
                    
                    DatePicker("기념일",
                               selection: $annualEventDate,
                               in: ...Date(),
                               displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    
                    Button {
                        //action
                        addAnniversary()
                    } label: {
                        Label("기념일 추가", systemImage: "plus")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .disabled(annualEvent.isEmpty)

                    Spacer()
                }//: VStack
                .navigationTitle("기념일 관리")
                .navigationBarTitleDisplayMode(.inline)
                .padding()
                .padding(.horizontal)
            }//: ZStack
        }//: NavitationStack
    }//: body
    
    private func addAnniversary() {
        
        guard !annualEvent.isEmpty else {return}
        
        let anni = Anniversary(
            title: annualEvent,
            anniversaryDate: annualEventDate
        )
        anniversaries.append(anni)
        
        // 다음 기념일이 빠른 순으로 정렬
        anniversaries.sort { (anni1, anni2) in
            let calendar = Calendar.current
            let anniCompo1 = calendar.dateComponents(
                [.month, .day],
                from: anni1.anniversaryDate
            )
            let anniCompo2 = calendar.dateComponents(
                [.month, .day],
                from: anni2.anniversaryDate
            )
            let next1 = calendar.nextDate(
                after: Date(),
                matching: anniCompo1,
                matchingPolicy: .nextTime
            ) ?? Date()
            
            let next2 = calendar.nextDate(
                after: Date(),
                matching: anniCompo2,
                matchingPolicy: .nextTime
            ) ?? Date()
            
            return next1 < next2
        }
        
        // 입력필드 초기화
        annualEvent = ""
        annualEventDate = Date()
    }
    
    private func deleteAnniversary(at offsets: IndexSet) {
        anniversaries.remove(atOffsets:  offsets)
    }
}

#Preview {
    AnniversaryChecker()
}
