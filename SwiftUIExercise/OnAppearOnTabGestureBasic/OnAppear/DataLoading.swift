//
//  DataLoading.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/25/25.
//

import SwiftUI

struct DataLoading: View {
    @State private var isLoading: Bool = true
    @State private var username: String = "yoonie"
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .controlSize(.extraLarge)
                    .padding(10)
            }
            Text(isLoading ? "데이터 로딩 중 ..." : "\(username)님 환영합니다")
                .font(.title)
                .foregroundStyle(isLoading ? Color.secondary : Color.accentColor)
        }
        .task {
            do {
                try await Task.sleep(for: .seconds(3))
                withAnimation(.spring(duration: 1.0)) {
                    isLoading = false
                }
            } catch is CancellationError {
                print("작업이 취소되었습니다")
            } catch {
                print("에러 발생: \(error.localizedDescription)")
                isLoading = false
            }
        }
    }
}

#Preview {
    DataLoading()
}
