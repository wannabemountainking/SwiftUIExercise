//
//  MarkApp.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/4/25.
//

import SwiftUI

struct MarkApp: View {
    @State private var fruits: [String] = ["사과", "오렌지", "바나나", "수박"]
    @State private var meats: [String] = ["소고기", "돼지고기", "닭고기"]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                            .font(.body)
                            .foregroundStyle(.white)
                            .padding(.vertical, 10)
                            .listRowBackground(Color.blue)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                } header: {
                    Text("과일 종류")
                        .font(.headline)
                        .foregroundStyle(.red)
                }
                
                Section {
                    ForEach(meats, id: \.self) { meat in
                        Text(meat)
                    }
                } header: {
                    Text("고기 종류")
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            }
            .navigationTitle("우리 동네 마트")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        fruits.append("딸기")
                    } label: {
                        Text("Add")
                    }

                }
            }
        }
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
}

#Preview {
    MarkApp()
}
