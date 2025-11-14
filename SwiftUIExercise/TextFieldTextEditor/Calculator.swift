//
//  Calculator.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/15/25.
//

import SwiftUI



struct Calculator: View {
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    @State private var result: String = ""
    
    enum BasicOperator: Identifiable {
        case addition
        case subtraction
        case multiplication
        case division
        
        var id: String {
            switch self {
            case .addition: return "addtion"
            case .subtraction: return "subtraction"
            case .multiplication: return "multiplication"
            case .division: return "division"
            }
        }
        
        var symbol: String {
            switch self {
            case .addition: return "+"
            case .subtraction: return "−"
            case .multiplication: return "×"
            case .division: return "÷"
            }
        }
    }
    
    var body: some View {
        
    }
    
    private func calculateBasicOperation(basicOp: BasicOperator) -> String {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else { return "숫자를 입력하세요" }
        var doubleResult: Double = 0
        
        switch basicOp {
            case .addition: doubleResult = first + second
            case .subtraction: doubleResult = first - second
            case .multiplication: doubleResult = first * second
            case .division: doubleResult = first / second
        }
        
        return doubleResult.formatted(.number.precision(.fractionLength(2)))
    }
}

#Preview {
    Calculator()
}
