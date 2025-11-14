//
//  ToolBarBasic.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/2/25.
//

import SwiftUI

struct ToolBarBasic: View {
    @State private var showAddSheet: Bool = false
    
    
    var body: some View {
        NavigationStack {
            
            NavigationLink {
                //destination
                PhotoDetailView()
            } label: {
                Text("사진 보기")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                    )
                    .padding()
            }
            
            Button {
                //action
                showAddSheet.toggle()
            } label: {
                Text("사진 추가")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                    )
                    .padding()
            }
            .sheet(isPresented: $showAddSheet) {
                AddPhotoView()
            }
        }
    }
}

#Preview {
    ToolBarBasic()
}
