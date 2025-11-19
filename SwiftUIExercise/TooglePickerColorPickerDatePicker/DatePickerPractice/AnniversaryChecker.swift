//
//  AniversaryChecker.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/19/25.
//

import SwiftUI

struct Anniversary: Identifiable {
    let calendar = Calendar.current
    let id = UUID()
    var title: String
    var today: Date = Date()
    var anniversaryDate: Date
    var nextAnniversary: Date {
        let anniCompo: DateComponents = calendar.dateComponents([.month, .day], from: anniversaryDate)
        let nextAnniversary: Date = calendar.nextDate(
            after: today,
            matching: anniCompo,
            matchingPolicy: .nextTime
        ) ?? today
    }
    var dateString: String {
        var isPassed: Bool {
            let nextAnniYear: Int = calendar.dateComponents([.year], from: nextAnniversary).year ?? 2000
            let thisYear: Int = calendar.dateComponents([.year], from: today).year ?? 2002
            return thisYear != nextAnniYear
        }
        
        let daysLeft: Int = calendar.dateComponents([.day], from: today, to: nextAnniversary).day ?? 0
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
                        ForEach($anniversaries, id: \.id) { $anniversary in
                            HStack {
                                Text(anniversary.title)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(anniversary.dateString)
                            }
                        }
                    }
                    .listRowBackground(Color.orange)
                    
                    Spacer()
                    
                    DatePicker("기념일",
                               selection: $annualEventDate,
                               in: ...Date(),
                               displayedComponents:
                                [.date]
                    )
                    .datePickerStyle(.wheel)
                    
                    Button {
                        //action
                        addAnniversary()
                    } label: {
                        Button("기념일 추가", systemImage: "plus") {
                            addAnniversary()
                        }
                    }
                    
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
        let anni = Anniversary(title: annualEvent, anniversaryDate: annualEventDate)
        anniversaries.append(anni)
        
    }
}

#Preview {
    AnniversaryChecker()
}
