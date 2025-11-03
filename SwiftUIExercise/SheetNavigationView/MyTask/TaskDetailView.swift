//
//  TaskDetailView.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/3/25.
//

import SwiftUI

struct TaskDetailView: View {
    
    let taskName: String
    @Environment(\.dismiss) var dismiss
    
    init(taskName: String = "") {
        self.taskName = taskName
    }
    
    var body: some View {
        ZStack {
            Color.indigo.opacity(0.8)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("\(taskName)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                
                Button {
                    //action
                    dismiss()
                } label: {
                    Text("완료")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(10)
                        .padding(.horizontal, 15)
                        .background(Color.blue)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10)
                        )
                }

                Spacer()
                
                Text("네비게이션으로 표시됨")
                    .foregroundStyle(.white)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    TaskDetailView()
}
