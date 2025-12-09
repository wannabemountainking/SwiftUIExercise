//
//  TabViewPageStyle.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 12/9/25.
//

import SwiftUI

struct TabViewPageStyle: View {
    let imageNames: [String] = ["star.fill", "heart.fill", "photo", "pencil", "eraser", "scribble", "trash", "folder"]
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                TabView {
                    ForEach(imageNames, id: \.self) { imageString in
                        Image(systemName: imageString)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                            .scaledToFill()
                    }
                }
                .tabViewStyle(.page)
            }//: ScrollView
            .navigationTitle("이미지 슬라이더")
            .navigationBarTitleDisplayMode(.inline)
        } //: NavigationStack
    }//:body
}

#Preview {
    TabViewPageStyle()
}
