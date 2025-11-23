//
//  ThreeTab.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/23/25.
//

import SwiftUI

enum TabType {
    case home
    case search
    case settings
}

struct TabItem: Identifiable {
    let id = UUID()
    var title: String
    var systemImage: String
    var tabType: TabType
}

struct ThreeTab: View {
    
    private let tabs = [
        TabItem(title: "Home", systemImage: "house.fill", tabType: TabType.home),
        TabItem(title: "Search", systemImage: "magnifyingglass", tabType: .search),
        TabItem(title: "Settings", systemImage: "gearshape.fill", tabType: .settings)
    ]
    
    var body: some View {
        TabView {
            ForEach(tabs) { tab in
                Tab(tab.title, systemImage: tab.systemImage) {
                    switch tab.tabType {
                    case .home: HomeView()
                    case .search: SearchView()
                    case .settings: SettingsView()
                    }
                }
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        ContentDisplayView(text: "홈 화면입니다")
    }
}

struct SearchView: View {
    var body: some View {
        ContentDisplayView(text: "검색 화면입니다")
    }
}

struct SettingsView: View {
    var body: some View {
        ContentDisplayView(text: "설정 화면입니다")
    }
}

// 재사용 가능한 뷰
struct ContentDisplayView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.ultraLight)
            .foregroundStyle(.white)
            .padding(30)
            .background(Color.secondary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ThreeTab()
}
