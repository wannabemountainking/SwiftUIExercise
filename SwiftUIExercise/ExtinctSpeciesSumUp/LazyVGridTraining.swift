//
//  LazyVGridTraining.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 12/9/25.
//

import SwiftUI

struct LazyVGridTraining: View {
    let photos: [Int] = Array(repeating: 0, count: 48).enumerated().map { $0.offset }
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(photos, id: \.self) { photo in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("\(photo)")
                        }
                }// : Loop
            }//: LazyVGrid
        }//: ScrollView
    }//: body
}

#Preview {
    LazyVGridTraining()
}
