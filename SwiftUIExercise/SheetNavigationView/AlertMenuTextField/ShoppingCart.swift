//
//  ShoppingCart.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/6/25.
//

import SwiftUI

struct Product {
    let name: String
    var price: Int
}

struct ShoppingCart: View {
    
    @State private var products: [Product] = [
        Product(name: "apple", price: 1000),
        Product(name: "watermelon", price: 15000),
        Product(name: "strawberry", price: 10000)
    ]
    @State private var alertType: AlertType?
    
    @State private var soonToDelete: String?
    @State private var soonToAdd: String?
    private var showDelete: Binding<Bool> {
        Binding(
            get: { soonToDelete != nil },
            set: { if !$0 { soonToDelete = nil } }
        )
    }
    
    private var showAdd: Binding<Bool> {
        Binding(
            get: { soonToAdd != nil },
            set: { if !$0 { soonToAdd = nil } }
        )
    }
    
    enum AlertType: Identifiable {
        var id: Self { self }
        
        case highend
        case ordinary
        case adding
        case deleting
        
        var title: String {
            switch self {
            case .highend: return "고가 상품 확인"
            case .deleting: return "장바구니 비우기"
            case .adding: return "장바구니에 넣기"
            }
        }
        
        var message: String {
            switch self {
            case .highend: return "고가 상품입니다. 다시 한 번 확인해 주세요"
            case .deleting: return "장바구니에서 해당 상품을 비웁니다"
            case .adding: return "이 상품은 \()"
            }
        }
    }
    
    var body: some View {
        
    }
}

#Preview {
    ShoppingCart()
}
