//
//  TabViewStandard.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 12/9/25.
//

import SwiftUI

struct TabInfoItem: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let text: String
}

struct TabViewStandard: View {
    private let tabInfoItems = [
        TabInfoItem(name: "Home", icon: "house.fill", text: "홈 화면"),
        TabInfoItem(name: "Search", icon: "magnifyingglass", text: "검색 화면"),
        TabInfoItem(name: "Settings", icon: "gear", text: "설정 화면")
    ]
//    var body: some View {
//        TabView {
//            ForEach(tabInfoItems) { item in
//                Tab(item.name, systemImage: item.icon) {
//                    subTabView(text: item.text)
//                }// Tab
//            }//: ForEach
//        }//: TabView
//    }//: body
    
    var body: some View {
        TabView {
            ForEach(tabInfoItems) { item in
                SubTabView(text: item.text)
                    .tabItem {
                        Image(systemName: item.icon)
                        Text(item.name)
                    }
            }
        }
    }
}

struct SubTabView: View {
    let text: String
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 60))
                .foregroundStyle(.yellow)
            
            Text(text)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
        }
    }
}


#Preview {
    TabViewStandard()
}
