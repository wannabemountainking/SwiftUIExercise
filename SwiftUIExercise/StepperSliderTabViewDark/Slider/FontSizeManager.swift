//
//  FontSizeManager.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/22/25.
//

import SwiftUI

struct FontSizeManager: View {
    @State private var fontSize: CGFloat = 20.0
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack(spacing: 29) {
                Text("안녕하세요")
                    .font(Font.system(size: fontSize))
                Text("글자 크기: \(fontSize.formatted())px")
                Slider(value: $fontSize, in: 10 ... 50, step: 1.0) {
                    //Label
                    Text("font size")
                } minimumValueLabel: {
                    Text("10")
                } maximumValueLabel: {
                    Text("50")
                }
                .padding(.horizontal, 30)
            }//: VStack
        }//: ZStack
    }//: body
}

#Preview {
    FontSizeManager()
}
