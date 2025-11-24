//
//  SettingsScreenBasic.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/24/25.
//

import SwiftUI

struct SettingsScreenBasic: View {
    @State private var volume: Double = 50
    @State private var saveInterval: Int = 10
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house.fill", value: 0) {
                Home(volume: volume, saveInterval: saveInterval)
            }
            Tab("Settings", systemImage: "gearshape.fill", value: 1) {
                PreferenceView(volume: $volume, saveInterval: $saveInterval)
            }
        }
    }
}

struct Home: View {
    let volume: Double
    let saveInterval: Int
    var body: some View {
        ZStack {
            Color.orange.opacity(0.5).ignoresSafeArea()
            VStack(spacing: 20) {
                Text("현재 설정")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                
                VStack(spacing: 20) {
                    HStack {
                        Text("볼륨")
                        Spacer()
                        Text(volume.formatted(.number.precision(.fractionLength(1))))
                    }//: HStack
                    HStack {
                        Text("저장 간격")
                        Spacer()
                        Text("\(saveInterval)초")
                    }//: HStack
                    Text("설정 탭에서 값을 변경할 수 있습니다")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }//: VStack
                .font(.title2)
                .padding()
                .padding(.horizontal, 90)
            }//:VStack
        }//:ZStack
    }
}

struct PreferenceView: View {
    @Binding var volume: Double
    @Binding var saveInterval: Int
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Form {
            Section("음량 설정") {
                VStack(spacing: 20) {
                    Text("현재 음량: \(volume.formatted(.number.precision(.fractionLength(1))))")
                    Slider(
                        value: $volume,
                        in: 0 ... 100
                    )
                }//: VStack
            }//: Section1
            Section("자동 저장 간격") {
                Stepper(
                    "\(saveInterval)초",
                    value: $saveInterval,
                    in: 5 ... 60,
                    step: 5
                )
            }
            Section("테마") {
                Text("현재 테마 : \(colorScheme == .dark ? "다크" : "라이트") 모드")
            }
        }//: Form
    }//: body
}

#Preview {
    SettingsScreenBasic()
}
