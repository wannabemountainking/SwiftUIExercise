//
//  ShoppingCart.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/6/25.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    var name: String
    var price: Int
}

struct ShoppingCart: View {
    
    @State private var inCart: [Product] = []
    @State private var showAlert: Bool = false
    @State private var products: [Product] = [
        Product(name: "apple", price: 1000),
        Product(name: "watermelon", price: 15000),
        Product(name: "strawberry", price: 10000)
    ]
    @State private var alertType: AlertType?
    
    enum AlertType: Identifiable {
        
        var id: UUID { UUID() }
        
        case highend(product: Product)
        case regular(product: Product)
        
        var title: String {
            switch self {
            case .highend: return "고가 상품 확인"
            case .regular: return "장바구니 담기"
            }
        }
        
        var message: String {
            switch self {
            case .highend(let product): return "이 상품은 \(product.price)원입니다. 장바구니에 담으시겠습니까?"
            case .regular(let product): return "\(product.name)을 장바구니에 바로 담았습니다!"
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            List {
                ForEach(products, id: \.id) { product in
                    
                    HStack {
                        Text(product.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Spacer(minLength: 10)
                        
                        Text("\(product.price)원")
                            .font(.caption)
                            .fontWeight(.ultraLight)
                        
                        Spacer(minLength: 10)
                        
                        Button {
                            //action
                            showAlert = true
                            
                            if product.price >= 5000 {
                                alertType = .highend(product: product)
                            } else {
                                alertType = .regular(product: product)
                            }
                        } label: {
                            Image(systemName: "cart")
                                .font(.headline)
                                .foregroundStyle(.orange)
                        }
                        
                    } // : HStack
                } //: ForEach
                
                Divider()
                
                Text("총액: \(inCart.map { $0.price }.reduce(0) {$0 + $1})")
            } // : list
            .alert(
                alertType?.title ?? "알림",
                isPresented: $showAlert,
                presenting: alertType
            ) { type in
                switch type {
                case .regular(let product):
                    Button(role: .confirm) {
                        inCart.append(product)
                        showAlert = false
                        print("현재 장바구니: \(inCart)")
                        
                    } label: {
                        Text("확인")
                            .font(.headline)
                    }
                case .highend(let product):
                    Button(role: .confirm) {
                        //action
                        inCart.append(product)
                        showAlert = false
                        print("현재 장바구니: \(inCart)")
                    } label: {
                        Text("담기")
                            .font(.headline)
                    }
                    
                    Button(role: .cancel) {
                        showAlert = false
                        print("현재 장바구니: \(inCart)")
                    } label: {
                        Text("취소")
                            .font(.headline)
                    }
                }
            } message: { type in
                Text(type.message)
            }
        }
    }
}

#Preview {
    ShoppingCart()
}
