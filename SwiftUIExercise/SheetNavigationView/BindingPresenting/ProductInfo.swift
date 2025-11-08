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
    @State private var selectedItem: Product?
    @State private var toBuy: Bool = false
    
    struct Product: Identifiable {
        let id = UUID()
        var name: String
        var price: Int
        var stock: Int
    }
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                List {
                    Section {
                        //content
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

                            }
                        }
                    } header: {
                        Text("상품 정보")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundStyle(.pink)
                    }

                }//: list
            }//: VStack
        }//: ZStack
    }
}

#Preview {
    ProductInfo()
}
