//
//  AutoSlideBanner.swift
//  SwiftUIExercise
//
//  Created by yoonie on 12/13/25.
//

import SwiftUI
import Combine

struct Banner: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let backgroundColor: Color
}

struct AutoSlideBanner: View {
    @State private var currentBannerIndex: Int = 0
    @State private var timer: Publishers.Autoconnect<Timer.TimerPublisher> = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    @State private var bannerIsRunning: Bool = true
    
    let totalTabs = 4
    private let banners: [Banner] = [
        Banner(title: "맥북 세일", description: "특별할인 진행 중", backgroundColor: .gray.opacity(0.5)),
        Banner(title: "리디북스 세일", description: "블랙 프라이데이 대 세일", backgroundColor: .green),
        Banner(title: "로지택 가격 파괴", description: "첫 구매자 한정 세일", backgroundColor: .blue),
        Banner(title: "아수스 신학기 세일", description: "신 학기 한정 대 세일", backgroundColor: .yellow)
    ]
    
    var body: some View {
        
        VStack {
            TabView(selection: $currentBannerIndex) {
                ForEach(Array(banners.enumerated()), id: \.offset) { index, banner in
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(banner.backgroundColor)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .padding(20)
                        .overlay {
                            VStack(spacing: 10) {
                                Text(banner.title)
                                    .font(.largeTitle)
                                    .fontWeight(.ultraLight)
                                Text(banner.description)
                            }
                        }
                        .tag(index)
                }//: Loop
            }//: TabView
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxHeight: 250)
            .onReceive(timer) { _ in
                withAnimation {
                    currentBannerIndex = (currentBannerIndex + 1) % totalTabs
                }//: withAnimation
            }//: onReceive
            .onChange(of: currentBannerIndex) { oldValue, newValue in
                // 그냥 사용자가 수동으로 페이지를 넘기면(이게 index값이 바로 변하는 순간에 작동하는 모디화이어) 작동
                resetTimer()
            }
            
            NumberIndicator(currentPage: currentBannerIndex + 1, totalPages: banners.count)
            
            Button {
                //action
                if bannerIsRunning {
                    timer.upstream.connect().cancel()
                    bannerIsRunning = false
                } else {
                    timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
                    bannerIsRunning = true
                }
            } label: {
                Image(systemName: bannerIsRunning ? "pause.fill" : "play.fill")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(10)
                    .padding(.horizontal, 40)
                    .background(bannerIsRunning ? Color.accentColor : .red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

        }//: VStack
    }//: body
    
    //timer 리셋함수
    private func resetTimer() {
        timer.upstream.connect().cancel()
        timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    }
}

// 1/4 방식의 숫자 인디케이터 뷰 구조체
struct NumberIndicator: View {
    let currentPage: Int
    let totalPages: Int
    
    var body: some View {
        Text("\(currentPage) / \(totalPages)")
            .font(.headline)
            .padding(8)
            .background(Material.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        ProgressView("", value: Float(currentPage), total: Float(totalPages))
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
    }
}

#Preview {
    AutoSlideBanner()
}
