//
//  SwiftUIView.swift
//  SwiftUIExercise
//
//  Created by yoonie on 12/10/25.
//

import SwiftUI

struct ImageGalleryApp: View {
    @State private var currentPage: Int = 0
    let systemImages: [String] = [
        "star.fill", "heart.fill", "photo.fill", "leaf.fill", "sun.max.fill",
            "moon.fill", "cloud.fill", "bolt.fill", "drop.fill", "wind"
    ]
    
    var body: some View {
        GroupBox {
            VStack(spacing: 20) {
                Text("\(currentPage + 1) / \(systemImages.count)")
                    .font(.largeTitle)
                
                TabView(selection: $currentPage) {
                    ForEach(0 ..< systemImages.count, id: \.self) { index in
                        GeometryReader { geometry in
                            Image(systemName: systemImages[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width - 20, height: geometry.size.width - 20)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }//: GeometryReader
                        .tag(index)
                    }//: LOOP
                }//: TabView
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                HStack(spacing: 30) {
                    Button {
                        //action
                        if currentPage > 0 {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                currentPage -= 1
                            }
                        }
                    } label: {
                        Text("이전")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, minHeight: 35)
                            .background(currentPage == 0 ? Color.accentColor.opacity(0.3) : .accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .disabled(currentPage == 0)

                    Button {
                        //action
                        if currentPage < systemImages.count - 1 {
                            withAnimation(.easeInOut(duration: 0.6)) {
                                currentPage += 1
                            }
                        }
                    } label: {
                        Text("다음")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, minHeight: 35)
                            .background(currentPage == systemImages.count - 1 ? Color.accentColor.opacity(0.3) : .accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .disabled(currentPage == systemImages.count - 1)
                }//:HStack
                .padding()
            }//: HStack
        }//: GroupBox
    }//: body
}


#Preview {
    ImageGalleryApp()
}
