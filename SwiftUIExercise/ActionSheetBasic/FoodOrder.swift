//
//  FoodOrder.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/13/25.
//

import SwiftUI

struct FoodOrder: View {
    @State private var showActionSheet: Bool = false
    @State private var selectedPizza: String = "피자를 선택하세요"
    private let pizzas: [String : Int] = [
        "페퍼로니": 18000,
        "치즈": 15000,
        "하와이안": 23000,
        "마르게리타": 19000
    ]
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
                VStack {
                    Spacer()
                    Text(selectedPizza)
                        .font(.largeTitle)
                    Spacer()
                    Button {
                        //action
                        showActionSheet.toggle()
                    } label: {
                        Text("주문하기")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal, 10)
                            .background(Color.blue)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }
                    .actionSheet(isPresented: $showActionSheet) {
                        selectPizza()
                    }
                Spacer()
            }//: VStack
        }//:ZStack
    }//: body
    
    private func selectPizza() -> ActionSheet {
        var buttons: [ActionSheet.Button] = pizzas.map { (pizza, price) in
                .default(Text(pizza)) {
                    selectedPizza = "\(pizza) 피자를 주문했습니다 (\(price.formatted(.number))원)"
                }
        }
        
        buttons.append(.cancel())
        return ActionSheet(
            title: Text("피자를 선택하세요"),
            buttons: buttons
        )
    }
}

#Preview {
    FoodOrder()
}
