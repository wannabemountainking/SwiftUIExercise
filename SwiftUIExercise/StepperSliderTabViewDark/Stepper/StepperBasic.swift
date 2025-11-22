//
//  StepperBasic.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/22/25.
//

import SwiftUI

struct StepperBasic: View {
    @State private var cupsOfCoffee: Int = 1
    private let pricePerCup: Int = 4500
    private var totalPrice: String {
        let total = cupsOfCoffee * pricePerCup
        return total.formatted(
            .number
            .grouping(.automatic)
        )
    }
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack(spacing: 30) {
                Text("☕️ 아메리카노")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Stepper(value: $cupsOfCoffee, in: 1 ... 10) {
                    // label
                    Text("\(cupsOfCoffee) 잔 주문")
                        .font(.title2)
                }
                .padding()
                .background(Color.white.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 15))

                VStack(spacing: 15) {
                    HStack {
                        Text("한 잔 가격")
                        Spacer()
                        Text("\(pricePerCup)원")
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("총 금액")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(totalPrice)원")
                            .fontWeight(.bold)
                            .foregroundStyle(.purple)
                            .animation(.spring(), value: totalPrice)
                    }
                }
                .font(.title3)
                .padding()
                .background(Color.white.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Button {
                    //action
                    print("아메리카노 \(cupsOfCoffee)잔, 총 \(totalPrice)원 주문")
                } label: {
                    Text("주문하기")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }

            }//: VStack
            .padding(30)
        }//: ZStack
    }//: body
}

#Preview {
    StepperBasic()
}
