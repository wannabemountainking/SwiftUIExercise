//
//  AddPhotoView.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/3/25.
//

import SwiftUI

struct AddPhotoView: View {
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                VStack {
                    Text("사진 추가")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Text("isPresented: \(isPresented.description)")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                } //: VStack
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            //action
                            dismiss()
                        } label: {
                            Text("완료")
                                .font(.headline)
                                .fontWeight(.light)
                        }
                        
                    }
                }
            } // : Zstack
        } // : navigationStack
    }
}

#Preview {
    AddPhotoView()
}
