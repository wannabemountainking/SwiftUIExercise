//
//  RGBMixer.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/22/25.
//

import SwiftUI

struct ColorSlider: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
    var value: Double = 128
}

struct RGBMixer: View {
    @State private var sliders: [ColorSlider] = [
        ColorSlider(name: "red", color: .red),
        ColorSlider(name: "green", color: .green),
        ColorSlider(name: "blue", color: .blue)
    ]
    
    private var colorGenerated: Color {
        return Color(
            red: sliders[0].value/255,
            green: sliders[1].value/255,
            blue: sliders[2].value/255
        )
    }
    
    private var hexColor: String {
        let rgb = sliders.map { Int($0.value) }
        let hex = "#" + rgb.map { String(format: "%02X", $0) }.joined()
        return hex
    }

    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                VStack(spacing: 20) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 300)
                        .foregroundStyle(colorGenerated)
                    
                    ForEach(sliders.indices, id: \.self) { index in
                        sliderRow(for: index)
                    }
                    
                    Text(hexColor)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()

                } // : VStack
                .padding()
                .padding(.horizontal, 20)
                
                Spacer()
            }//: VStack
        }//: ZStack
    }//: body
    
    @ViewBuilder
    private func sliderRow(for index: Int) -> some View {
        HStack(spacing: 10) {
            Slider(value: $sliders[index].value, in: 0...255, step: 10) {
                // label
                Text("\(sliders[index].name) 설정")
            } minimumValueLabel: {
                Text("0")
                    .font(.footnote)
            } maximumValueLabel: {
                Text("255")
                    .font(.footnote)
            }
            Spacer()
            Text("\(sliders[index].value.formatted(.number.precision(.fractionLength(0))))")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(sliders[index].color)
                .padding(5)
                .padding(.horizontal, 5)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}



#Preview {
    RGBMixer()
}
