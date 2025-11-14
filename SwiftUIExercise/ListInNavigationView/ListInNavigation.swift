//
//  ListInNavigation.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/2/25.
//

import SwiftUI

struct ListInNavigation: View {
    
    @State private var fruits: [String] = [
        "apple", "banana", "orange"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink {
                            // destination
                            FruitDetailView(fruitName: fruit)
                        } label: {
                            Text(fruit)
                                .font(.title2)
                                .foregroundStyle(.white)
                        }
                    }
                    .listRowBackground(Color.purple)
                    .navigationTitle("Fruit List")
                } header: {
                    Text("Favorite")
                        .font(.headline)
                        .foregroundStyle(.brown)
                }

            }
        }
    }
}

#Preview {
    ListInNavigation()
}
