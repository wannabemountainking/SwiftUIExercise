//
//  PhotoDetailView.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/3/25.
//

import SwiftUI

struct PhotoDetailView: View {
    
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                Text("상세 사진 정보")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Text("isPresented: \(isPresented.description)")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        //action
                        dismiss()
                    } label: {
                        Text("이전으로")
                            .font(.headline)
                            .fontWeight(.light)
                    }

                }
            }
        }
    }
}

#Preview {
    PhotoDetailView()
}
