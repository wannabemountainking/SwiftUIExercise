//
//  AgeCalculator.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/17/25.
//

import SwiftUI

struct AgeCalculator: View {
    @State private var birthdate: Date = Date()
    
    var body: some View {
        let ageComponents = Calendar.current.dateComponents([.year, .month, .day], from: birthdate, to: Date())
        let age = ageComponents.year ?? 0
        let month = ageComponents.month ?? 0
        let day = ageComponents.day ?? 0
        let isBirthday: Bool = (age > 0) && (month == 0) && (day == 0 )
        let isBirthdayPassed: Bool = (age > 0) && (month >= 0) && (day > 0)
        let ageString = "만 \(age)세"
        
        ZStack {
            Color.orange.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 50) {
                <#code#>
            }
        }
    }
}

#Preview {
    AgeCalculator()
}
