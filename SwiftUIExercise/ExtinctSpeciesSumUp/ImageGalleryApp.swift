//
//  SwiftUIView.swift
//  SwiftUIExercise
//
//  Created by yoonie on 12/10/25.
//

import SwiftUI

struct ImageGalleryApp: View {
    @State private var currentPage: Int = 9
    private let systemImages: [String] = [
        "star.fill", "heart.fill", "photo.fill", "leaf.fill", "sun.max.fill",
            "moon.fill", "cloud.fill", "bolt.fill", "drop.fill", "wind"
    ]
    
    var body: some View {

        VStack(spacing: 50) {
            Text("\(currentPage + 1) / \(systemImages.count)")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .fontWidth(.expanded)
            
            TabView(selection: $currentPage) {
                ForEach(0 ..< systemImages.count, id: \.self) { index in
                    Image(systemName: systemImages[index])
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .tag(index)
                }//:Loop
                
            }//:TabView
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            HStack(spacing: 20) {
                makeButton(
                    title: "이전",
                    isEnabled: currentPage > 0) {
                        //action
                        currentPage -= 1
                    }
                makeButton(
                    title: "다음",
                    isEnabled: currentPage < systemImages.count - 1) {
                        //action
                        currentPage += 1
                    }
            }//: HStack
            .padding()
        }//: VStack

    }//: body
    
    private func makeButton(title: String, isEnabled: Bool, pageAction: @escaping () -> Void) -> some View {
        HStack(spacing: 20) {
            Button {
                //action
                withAnimation(.easeInOut(duration: 0.5)) {
                    pageAction()
                }
            } label: {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .fontWidth(.expanded)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(isEnabled ? Color.accentColor : Color.accentColor.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }//: Button
            .disabled(!isEnabled)
        }//: HStack
    }//: function: button
}


#Preview {
    ImageGalleryApp()
}
