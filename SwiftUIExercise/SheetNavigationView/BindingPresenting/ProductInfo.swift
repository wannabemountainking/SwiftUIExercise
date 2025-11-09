//
//  ProductInfo.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/8/25.
//

import SwiftUI

struct ProductInfo: View {
    @State private var products: [Product] = [
        Product(name: "lotion", price: 40000, stock: 100),
        Product(name: "coffee bean", price: 3000, stock: 300),
        Product(name: "cake", price: 20000, stock: 50)
    ]
<<<<<<< HEAD
    @State private var selectedItem: Product?
    @State private var toBuy: Bool = false
=======
    @State private var alertData: AlertData?
>>>>>>> origin/main
    
    struct Product: Identifiable {
        let id = UUID()
        var name: String
        var price: Int
        var stock: Int
    }
    
<<<<<<< HEAD
=======
    struct AlertData: Identifiable {
        let id = UUID()
        let type: AlertType
        var product: Product
        
        enum AlertType {
            case outOfStock(item: String)
            case purchaseConfirm(item: String, price: Int, stock: Int)
        }
        
        var title: String {
            switch self.type {
            case .outOfStock: return "품절"
            case .purchaseConfirm: return "구매 확인"
            }
        }
        
        var message: String {
            switch self.type {
            case .outOfStock(let item): return "\(item)은 품절입니다"
            case .purchaseConfirm(let item, let price, let stock): return "\(item)\n가격: \(price)원\n재고: \(stock)개\n구매하시겠습니까?"
            }
        }
    }
    
>>>>>>> origin/main
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                List {
                    Section {
                        //content
<<<<<<< HEAD
                        ForEach($products) { product in
                            selectedItem = Product(
                                name: product.name.wrappedValue,
                                price: product.price.wrappedValue,
                                stock: product.stock.wrappedValue
                            )
                            HStack {
                                Text("\(product.name) (\(product.price)원, \(product.stock)개 남음)")
                                    .font(.headline)
                                    .foregroundStyle(.purple)
                                Spacer()
                                Button {
                                    //action
                                    
                                } label: {
                                    <#code#>
                                }

=======
                        ForEach(products, id: \.self.id) { product in
                            HStack {
                                Text("\(product.name) (\(product.price)원, \(product.stock)개 남음)")
                                    .font(.title3)
                                    .foregroundStyle(.indigo)
                                Spacer()
                                Button {
                                    //action
                                    alertData = AlertData(
                                        type: product.stock == 0 ? .outOfStock(item: product.name) : .purchaseConfirm(item: product.name, price: product.price, stock: product.stock),
                                        product: product
                                        )
                                } label: {
                                    Text("구매")
                                        .font(.headline)
                                        .foregroundStyle(.blue)
                                }
>>>>>>> origin/main
                            }
                        }
                    } header: {
                        Text("상품 정보")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundStyle(.pink)
                    }
<<<<<<< HEAD

                }//: list
=======
                }//: list
                .alert(
                    alertData?.title ?? "상품 구매",
                    isPresented: Binding(
                        get: { alertData != nil },
                        set: { if !$0 { alertData = nil } }
                    ),
                    presenting: alertData
                ) { alertData in
                    switch alertData.type {
                    case .outOfStock:
                        Button("확인", role: .confirm) {}
                    case .purchaseConfirm:
                        Button("구매", role: .confirm) {
                            if let index = products.firstIndex(where: { $0.name == alertData.product.name }) {
                                products[index].stock -= 1
                            }
                            let theSameProduct = products.first(where: { $0.id == alertData.product.id })
                            print("\(alertData.product.name) 구매 완료! 남은 재고: \(theSameProduct?.stock ?? 0)")
                        }
                        Button("취소", role: .cancel) {}
                    }
                } message: { alertData in
                    Text(alertData.message)
                }

>>>>>>> origin/main
            }//: VStack
        }//: ZStack
    }
}

#Preview {
    ProductInfo()
}
