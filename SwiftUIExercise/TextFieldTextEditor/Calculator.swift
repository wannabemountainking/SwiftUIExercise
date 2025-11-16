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
    @State private var basic: BasicOperator = .addition
    
    enum BasicOperator: Identifiable, CaseIterable {
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
        GeometryReader { geometry in
            ZStack {
                Color.orange.ignoresSafeArea()
                VStack(spacing: 20) {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        TextField("첫 번째 숫자", text: $firstNumber)
                            .onChange(of: firstNumber) { (_, newValue) in
                                firstNumber = newValue.filter { "0123456789.".contains($0) }
                            }
                        TextField("두 번째 숫자", text: $secondNumber)
                            .onChange(of: secondNumber) { (_, newValue) in
                                secondNumber = newValue.filter { "0123456789.".contains($0) }
                            }
                    }// VStack
                    .font(.headline)
                    .padding(10)
                    .padding(.horizontal, 10)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                    HStack(spacing: 20) {
                        ForEach(BasicOperator.allCases, id: \.id) { basicOperator in
                            Button {
                                //action
                                basic = basicOperator
                                
                            } label: {
                                Text(basicOperator.symbol)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .frame(
                                        width: (geometry.size.width - 100) / 4,
                                        height: (geometry.size.width - 100) / 4
                                    )
                                    .background(basic == basicOperator ? Color.green : Color.blue)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 5)
                                    )
                            }
                        }//: foreach
                    }//: HStack
                    
                    VStack(spacing: 20) {
                        Button {
                            //action
                                result = calculateBasicOperation(basicOp: basic)
                        } label: {
                            Text("Calculate".uppercased())
                                .font(.title2)
                                .frame(maxWidth: geometry.size.width - 40)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .padding(.vertical, 10)
                                .background(Color.indigo)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                            Text(result)
                                .font(.largeTitle)

                    }
                    Spacer()
                }//: VStack
            }//: ZStack
        }//: geometry
    }//: body
    
    private func calculateBasicOperation(basicOp: BasicOperator) -> String {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else { return "숫자를 입력하세요" }
        //0으로 나누지 않도록
        if basicOp == .division && second == 0 {
            return "0으로 나눌 수 없습니다"
        }
        
        var doubleResult: Double = 0
        
        switch basicOp {
            case .addition: doubleResult = first + second
            case .subtraction: doubleResult = first - second
            case .multiplication: doubleResult = first * second
            case .division: doubleResult = first / second
        }
        
        let result = doubleResult.formatted(.number.precision(.fractionLength(2)))
        
        return "\(firstNumber) \(basic.symbol) \(secondNumber) = \(String(describing: result))"
    }
}

#Preview {
    Calculator()
}
