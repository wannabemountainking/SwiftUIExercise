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
<<<<<<< HEAD
    @State private var result: String = ""
    
    enum BasicOperator: Identifiable {
=======
    @State private var result: String?
    @State private var basic: BasicOperator?
    
    enum BasicOperator: Identifiable, CaseIterable {
>>>>>>> origin/main
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
<<<<<<< HEAD
        
    }
=======
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack(spacing: 20) {
                Spacer()
                
                VStack(spacing: 20) {
                    TextField("첫 번째 숫자", text: $firstNumber)
                    TextField("두 번째 숫자", text: $secondNumber)
                        
                }// VStack
                .font(.headline)
                .padding(10)
                .padding(.horizontal, 10)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                HStack(spacing: 20) {
                    ForEach(BasicOperator.allCases, id: \.id) { basicOperator in
                        Button {
                            //action
                            basic = basicOperator
                            
                        } label: {
                            Text(basicOperator.symbol)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .frame(
                                    width: (UIScreen.main.bounds.width - 100) / 4,
                                    height: (UIScreen.main.bounds.width - 100) / 4
                                )
                                .background(Color.blue)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 5)
                                )
                        }
                    }//: foreach
                }//: HStack
                
                VStack(spacing: 20) {
                    Button {
                        //action
                        
                    } label: {
                        <#code#>
                    }

                }
                Spacer()
            }//: VStack
        }//: ZStack
    }//: body
>>>>>>> origin/main
    
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
