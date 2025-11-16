//
//  TextColorPicker.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/16/25.
//

import SwiftUI


struct HSBColorNamer {
    static func getColorName(hue: Double, saturation: Double, brightness: Double) -> String {
        // 채도 saturation이 매우 낮으면 무채색( 명도에 따라 검정 -> 회색)
        if saturation < 0.15 {
            switch brightness {
            case 0..<0.25: return "검정"
            case 0.25..<0.5: 
                return "어두운 회색"
            case 0.5..<0.85: return "밝은 회색"
            case 0.85...1.0: return "하얀색"
            default: return "알 수 없음"
            }
        }
        
        // 명도가 매우 낮으면
        if brightness < 0.2 {
            return "검은색에 가까운 색"
        }
        
        // 명도가 낮은 경우 "어두운 .."
        let isDark = brightness < 0.5
        let prefix = isDark ? "어두운 " : ""
        
        // 일반 색은 Hue값으로 구분
        let baseName: String
        switch hue {
        case 0.0..<0.03, 0.97...1.0:
            baseName = "빨강"
        case 0.03..<0.08:
            baseName = "주황"
        case 0.08..<0.17:
            baseName = "노랑"
        case 0.17..<0.25:
            baseName = "연두"
        case 0.25..<0.4:
            baseName = "초록"
        case 0.4..<0.5:
            baseName = "청록"
        case 0.5..<0.55:
            baseName = "하늘"
        case 0.55..<0.65:
            baseName = "파랑"
        case 0.65..<0.72:
            baseName = "남색"
        case 0.72..<0.8:
            baseName = "보라"
        case 0.8..<0.9:
            baseName = "자주"
        case 0.9..<0.97:
            baseName = "분홍"
        default:
            baseName = "알 수 없음"
        }
        
        return "\(prefix) \(baseName)"
    }
}

struct TextColorPicker: View {
    @State private var textColor: Color = .black
    
    private var colorInfo: (name: String, hsb: String) {
        let uiColor = UIColor(textColor)
        
        // HSB 값
        var h: CGFloat = 0, s: CGFloat = 0, br: CGFloat = 0, a: CGFloat = 0
        uiColor.getHue(
            &h,
            saturation: &s,
            brightness: &br,
            alpha: &a
        )
        // name
        let name = HSBColorNamer.getColorName(
            hue: Double(h),
            saturation: Double(s),
            brightness: Double(br)
        )
        let hsb = "HSB(\(Int(h * 360))º, \(Int(s * 100))%, \(Int(br * 100))%)"
        return (name, hsb)
    }
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 50) {
                    VStack(spacing: 20) {
                        Text("안녕하세요, SwiftUI")
                        Text("현재 색상: \(colorInfo.name)")
                        Text("\(colorInfo.hsb)")
                    }
                    .font(.title)
                    .fontWeight(.ultraLight)
                    .fontDesign(.serif)
                    .foregroundStyle(textColor)
                    
                    ColorPicker(selection: $textColor, supportsOpacity: true) {
                        Text("색상 선택")
                            .font(.title2)
                            .foregroundStyle(textColor)
                    }
                    .padding(.horizontal, 50)
                }//: VStack
                .padding()
                .padding(.horizontal)
                Spacer()
            }//: VStack
        }//: ZStack
    }//: body
}

#Preview {
    TextColorPicker()
}
