//
//  DDays.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/17/25.
//

import SwiftUI

struct DDays: View {
    @State private var targetDate: Date = Date()
    let components: DateComponents = Calendar.current.dateComponents([.day], from: Date(), to: targetDate)
    let daysLeft = components.day ?? 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DDays()
}
