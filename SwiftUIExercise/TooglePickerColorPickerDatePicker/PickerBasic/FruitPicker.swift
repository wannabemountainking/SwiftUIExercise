//
//  FruitPicker.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/16/25.
//

import SwiftUI


struct Fruit: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let image: String
}

struct FruitPicker: View {
    private var fruits: [Fruit] = [
        Fruit(name: "사과", image: "🍎"),
        Fruit(name: "바나나", image: "🍌"),
        Fruit(name: "포도", image: "🍇"),
        Fruit(name: "딸기", image: "🍓"),
        Fruit(name: "수박", image: "🍉"),
    ]
    @State private var selectedFruit: Fruit?
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack(spacing: 50) {
                Picker("과일 선택", selection: $selectedFruit) {
                    ForEach(fruits) { fruit in
                        Text(fruit.name).tag(fruit as Fruit?)
                    }
                    //: ForEach
                }//: Picker
                .pickerStyle(.wheel)
                if let selectedFruit {
                    Text("당신이 선택한 과일은 \(selectedFruit.image) \(selectedFruit.name)입니다")
                } else { Text("") }
            }//: VStack
        }//: ZStack
    }//: body

}

#Preview {
    FruitPicker()
}
