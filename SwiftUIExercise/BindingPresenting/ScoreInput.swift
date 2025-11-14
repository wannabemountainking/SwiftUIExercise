//
//  ScoreInput.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/10/25.
//

import SwiftUI

struct ScoreInput: View {
    
    @State private var mathScore: String = ""
    @State private var englishScore: String = ""
    @State private var scienceScore: String = ""
    @State private var alertData: AlertData?
    
    struct AlertData: Identifiable {
        let id = UUID()
        let type: AlertType
        
        enum AlertType {
            case emptyTextField(subjects: Set<String>)
            case invalidScore
            case outOfRange
            case result(math: Double, english: Double, science: Double, average: Double, grade: String)
        }
        
        var title: String {
            switch type {
            case .emptyTextField: return "입력 필요"
            case .invalidScore: return "입력 오류"
            case .outOfRange: return "범위 오류"
            case .result: return "성적 결과"
            }
        }
        
        var message: String {
            switch type {
            case .emptyTextField(let subjects):
                return "\(subjects.joined(separator: ", ")) 점수를 입력하세요"
            case .invalidScore:
                return "올바른 숫자를 입력하세요"
            case .outOfRange:
                return "점수는 0 ~ 100 사이여야 합니다"
            case .result(let math, let english, let science, let average, let grade):
                return """
                    수학: \(Int(math))점
                    영어: \(Int(english))점
                    과학: \(Int(science))점
                    평균: \(String(format: "%.1f", average))점
                    등급: \(grade)
                    """
            }
        }
    }

    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    Text("수학")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: 60, alignment: .leading)
                    TextField("수학", text: $mathScore, prompt: Text("성적을 입력하세요"))
                }
                HStack(spacing: 20) {
                    Text("영어")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: 60, alignment: .leading)
                    TextField("영어", text: $englishScore, prompt: Text("성적을 입력하세요"))
                }
                HStack(spacing: 20) {
                    Text("과학")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: 60, alignment: .leading)
                    TextField("과학", text: $scienceScore, prompt: Text("성적을 입력하세요"))
                }
                
                Button {
                    //action
                    calculateAlertData()
                } label: {
                    Text("성적표 보기")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(10)
                        .padding(.horizontal, 30)
                        .background(Color.blue)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10)
                        )
                }

            }
            .padding(10)
            .padding(.horizontal, 10)
            .textFieldStyle(.roundedBorder)
            .alert(
                alertData?.title ?? "알림",
                isPresented: Binding(
                    get: { alertData != nil },
                    set: { if !$0 { alertData = nil } }
                ),
                presenting: alertData) { data in
                    Button("확인", role: .confirm) { }
                } message: { data in
                    Text(data.message)
                }

        }
        
        
    }
    
    func calculateAlertData() {
        
        // 1. 빈문자열 체크
        var subjectsSet: Set<String> = []
        if mathScore.isEmpty { subjectsSet.insert("수학") }
        if englishScore.isEmpty { subjectsSet.insert("영어") }
        if scienceScore.isEmpty { subjectsSet.insert("과학") }
        guard subjectsSet.isEmpty else {
            alertData = AlertData(type: .emptyTextField(subjects: subjectsSet))
            return
        }
        
        // 2. String -> Double 전환
        guard let math = Double(mathScore),
              let english = Double(englishScore),
              let science = Double(scienceScore) else {
            alertData = AlertData(type: .invalidScore)
            return
        }
        
        // 3. 범위 체크
        guard (0...100).contains(math),
              (0...100).contains(english),
              (0...100).contains(science) else {
            alertData = AlertData(type: .outOfRange)
            return
        }
        
        // 4. 평균 등급 계산
        
        let average = (math + english + science) / 3.0
        
        let grade: String
        
        switch average {
            case 90...100: grade = "A"
            case 80..<90: grade = "B"
            case 70..<80: grade = "C"
            case 0..<70: grade = "D"
            default: grade = "out of range"
        }
        
        // 5. 결과 표시
        alertData = AlertData(
            type: .result(
                math: math,
                english: english,
                science: science,
                average: average,
                grade: grade
            )
        )
    }
}

#Preview {
    ScoreInput()
}
