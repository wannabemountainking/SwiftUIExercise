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
                Button {
                    //action
                    if currentPage > 0 {
                        withAnimation(.bouncy) {
                            currentPage -= 1
                        }
                    }
                } label: {
                    Text("이전")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .fontWidth(.expanded)
                        .foregroundStyle(.white)
                        .frame(height: 35)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(currentPage == 0 ? Color.accentColor.opacity(0.2) : .accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .disabled(currentPage == 0)
                
                Button {
                    //action
                } label: {
                    Text("이전")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .fontWidth(.expanded)
                        .foregroundStyle(.white)
                        .frame(height: 35)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }//: HStack
            .padding()
        }//: VStack

    }//: body            HStack(spacing: 20) {
    Button {
        //action
        if currentPage > 0 {
            withAnimation(.bouncy) {
                currentPage -= 1
            }
        }
    } label: {
        Text("이전")
            .font(.title3)
            .fontWeight(.semibold)
            .fontWidth(.expanded)
            .foregroundStyle(.white)
            .frame(height: 35)
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(currentPage == 0 ? Color.accentColor.opacity(0.2) : .accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    .disabled(currentPage == 0)
    
    private func makeButton(title: String ) -> some View {
        HStack(spacing: 20) {
            Button {
                //action
                if currentPage > 0 {
                    withAnimation(.bouncy) {
                        currentPage -= 1
                    }
                }
            } label: {
                Text("이전")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .fontWidth(.expanded)
                    .foregroundStyle(.white)
                    .frame(height: 35)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(currentPage == 0 ? Color.accentColor.opacity(0.2) : .accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .disabled(currentPage == 0)
    }
    
    
}


#Preview {
    ImageGalleryApp()
}
