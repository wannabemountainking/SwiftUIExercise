//
//  OnBoardingScreen.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 12/13/25.
//

import SwiftUI
    
struct Page: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let text: String
    let backgroundColor: Color
}

struct OnBoardingScreen: View {
    private var pages: [Page] = [
        Page(iconName: "hand.wave.fill", title: "환영합니다", text: "이 앱은 여러분의 일상을 더 편리하게 만들어드립니다.\n간단한 조작만으로 모든 기능을 이용하실 수 있습니다.", backgroundColor: Color(uiColor: .systemBlue)),
        Page(iconName: "sparkles", title: "간편한 사용", text: "직관적인 인터페이스로 누구나 쉽게 사용할 수 있습니다.\n복잡한 설정 없이 바로 시작하세요", backgroundColor: Color(uiColor: .systemPurple)),
        Page(iconName: "checkmark.circle.fill", title: "준비 완료!", text: "이제 모든 준비가 끝났습니다.\n아래 버튼을 눌러 시작해보세요!", backgroundColor: Color(uiColor: .systemGreen))
    ]
    
    @State private var currentMainColor: Color = Color(uiColor: .systemBlue)
    @AppStorage("isOnBoardingComplete") private var isOnBoardingComplete: Bool = false
    
    private var progress: CGFloat {
        guard let index = pages.firstIndex(where: { $0.backgroundColor == currentMainColor }) else { return 33 }
        return CGFloat(Int(((CGFloat(index) + 1.0) / CGFloat(pages.count)) * 100))
    }
    
    var body: some View {
        Group {
            if isOnBoardingComplete {
                MyMainPage()
            } else {
                onboardingView
                    
            }
        }
        .onChange(of: isOnBoardingComplete) { oldValue, newValue in
            if newValue == false {
                currentMainColor = pages.first!.backgroundColor
            }
        }
    }//: body

    private var onboardingView: some View {
        NavigationStack {
            ZStack {
                currentMainColor.ignoresSafeArea()
                VStack {
                    TabView(selection: $currentMainColor) {
                        ForEach(pages) { page in
                            OnboardPage(page: page)
                                .tag(page.backgroundColor)
                        }//: Loop
                    }//: TabView
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    ProgressView(value: progress, total: 100.0) {
                        Text("진행율: \(Int(progress))%")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }
                    .tint(.yellow)
                    .padding(30)
                    
                    if currentMainColor != pages.last!.backgroundColor {
                        Button {
                            //action
                            if let index = pages.firstIndex(where: { $0.backgroundColor == currentMainColor }) {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    currentMainColor = pages[index + 1].backgroundColor
                                }
                            }
                        } label: {
                            Text("다음")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, maxHeight: 35)
                                .background((currentMainColor == Color(uiColor: .systemBlue)) ? Color(uiColor: .systemRed): Color(uiColor: .systemBlue))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.horizontal, 30)
                        }
                    } else {
                        Button {
                            //action
                            withAnimation(.easeOut(duration: 0.5)) {
                                isOnBoardingComplete = true
                            }
                        } label: {
                            Text("시작하기")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, maxHeight: 35)
                                .background(Color(uiColor: .systemBlue))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.horizontal, 30)
                        }
                    }
                    Spacer()
                }//: VStack
            }//: ZStack
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if currentMainColor != pages.last!.backgroundColor {
                        Button("건너뛰기") {
                            withAnimation(.bouncy) {
                                isOnBoardingComplete = true
                            }
                        }//: Button
                    }//: conditional
                }//: ToolbarItem
            }//: toolbar
        }// NavigationStack
    }
}

struct MyMainPage: View {
    @AppStorage("isOnBoardingComplete") private var isOnBoardingComplete = true
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("안녕하세요")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .foregroundStyle(.blue)
                Text("메인 화면입니다")
                    .font(.title)
                
                //onboarding 다시보기 버튼
                Button {
                    withAnimation {
                        isOnBoardingComplete = false
                    }
                } label: {
                    Text("Onboarding 다시 보기")
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }//: VStack
            .navigationTitle("홈")
        }//: NavigationStack
    }//: body
}

struct OnboardPage: View {
    var page: Page
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: page.iconName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .foregroundStyle(Color.secondary)
            
            Spacer()
            
            Text(page.title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
            
            Text(page.text)
                .font(.title3)
                .lineLimit(2)
            
            Spacer()
        }
    }
}

#Preview {
    // ✅ 프리뷰 시작 전에 UserDefaults 설정
    let _ = UserDefaults.standard.set(true, forKey: "isOnBoardingComplete")
    return OnBoardingScreen()
}
