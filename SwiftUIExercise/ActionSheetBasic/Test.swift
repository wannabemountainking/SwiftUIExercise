//
//  Test.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/14/25.
//

import SwiftUI

struct Test: View {
    @State private var show = false
    @State private var result = ""
    
    var body: some View {
        VStack {
            Text(result)
            Button("열기") { show = true }
        }
        .confirmationDialog("테스트", isPresented: $show) {
            Button("옵션") { result = "옵션 선택" }
            Button("취소", role: .cancel) { result = "취소 버튼 클릭!" }
        }
        .onChange(of: show) { _, newValue in
            if !newValue && result.isEmpty {
                result = "외부 탭으로 닫힘"
            }
        }
    }
}

#Preview {
    Test()
}
