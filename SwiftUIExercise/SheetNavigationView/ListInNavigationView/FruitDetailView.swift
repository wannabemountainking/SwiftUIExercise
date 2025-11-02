//
//  FruitDetailView.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/2/25.
//

import SwiftUI

struct FruitDetailView: View {
    
    let fruitName: String
    @Environment(\.dismiss) var dismiss
    
    init(fruitName: String = "") {
        self.fruitName = fruitName
    }
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.7)
                .ignoresSafeArea()
            Text(fruitName)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                Button {
                    //action
                    dismiss()
                } label: {
                    Text("이전으로")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 12)
                }

            }
        }
    }
}

#Preview {
    FruitDetailView()
}
