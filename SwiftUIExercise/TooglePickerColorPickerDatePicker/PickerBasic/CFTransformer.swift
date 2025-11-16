//
//  CFTransformer.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/16/25.
//

import SwiftUI


enum Temperature: Identifiable, CaseIterable {
    case celsius
    case fahrenheit
    
    var id: String {
        switch self {
        case .celsius: return "섭씨(°C)"
        case .fahrenheit: return "화씨(°F)"
        }
    }
    
    var convertedUnit: (String, String) {
        switch self {
        case .celsius: return ("화씨", "°F")
        case .fahrenheit: return ("섭씨", "°C")
        }
    }
    
    func convertTo(degree: Double) -> String {
        let result: Double
        switch self {
            case .celsius:
                result = (degree * 9 / 5) + 32
            case .fahrenheit:
                result = (degree - 32) * 5 / 9
        }
        let resultString = result.formatted(.number.precision(.fractionLength(1)))
        return "\(self.convertedUnit.0) \(resultString)\(self.convertedUnit.1)"
    }
}

struct CFTransformer: View {
    @State private var degree: String = ""
    @State private var temperature: Temperature?
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Picker("온도 단위", selection: $temperature) {
                        ForEach(Temperature.allCases) { temp in
                            Text(temp.id).tag(temp as Temperature?)
                        }//: foreach
                    }//: picker
                    .pickerStyle(.segmented)
                
                    TextField("온도를 입력하세요", text: $degree)
                        .keyboardType(.decimalPad)
                        .focused($isTextFieldFocused)
                        .onChange(of: degree) { (_, newValue) in
                            let filtered = newValue.filter { "1234567890.-".contains($0) }
                            if filtered != newValue {
                                degree = filtered
                            }
                        }
                        .padding()
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                    
                    Spacer()
                    
                    if let temperature, !degree.isEmpty {
                        Text(temperature.convertTo(degree: Double(degree) ?? 0))
                            .font(.largeTitle)
                            .fontWeight(.light)
                            .foregroundStyle(.white)
                    } else {
                        Text("")
                    }

                    Spacer()
                }//: VStack
                .font(.headline)
                .fontWeight(.bold)
                .navigationTitle("온도 단위 변환기")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("완료") {
                            isTextFieldFocused = false
                        }
                    }
                }
            }//: ZStack
        }//: NavigationStack
    }//: Body
}

#Preview {
    CFTransformer()
}
