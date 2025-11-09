//
//  ExamScoreInput.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/10/25.
//

import SwiftUI



struct ExamScoreInput: View {
    @State private var mathScore: String = ""
    @State private var englishScore: String = ""
    @State private var scienceScore: String = ""
    @State private var examScores: ExamScores?
    
    struct ExamScores: Identifiable {
        let id = UUID()
        var su
        
        var meanScore: Int {
            let total = Double(math + english + science)
            return Int(total / 3.0)
        }
        
        var grade: String {
            switch meanScore {
            case 90 ... 100: return "A"
            case 80 ..< 90: return "B"
            case 70 ..< 80: return "C"
            case 0 ..< 70: return "D"
            default: return "F"
            }
        }
        
    }
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack(spacing: 30) {
                ForEach([mathScore, englishScore, scienceScore], id: \.self) { score in
                    HStack {
                        Text("")
                    }
                }
            }//: VStack
        }
    }
}

#Preview {
    ExamScoreInput()
}
