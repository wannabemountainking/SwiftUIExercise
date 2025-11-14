//
//  AddTaskView.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/3/25.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var task: String = ""
    @Binding var tasks: [String]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.orange
                    .ignoresSafeArea()
    
                VStack {
                    Spacer()
    
                    TextField("할 일을 입력하세요", text: $task)
                        .padding()
                        .textFieldStyle(.roundedBorder)
    
                    Spacer()
    
                    Text("모달로 표시됨")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            //action
                            dismiss()
                        } label: {
                            Text("취소")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                    } // : ToolbarItem
    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            //action
                            tasks.append(task)
                            dismiss()
                        } label: {
                            Text("저장")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                    } // : ToolbarItem
                } // : VStack (toolbar)
                .ignoresSafeArea()
            } //: ZStack
        } // : NavigationStack
    }
}

#Preview {
    AddTaskView(tasks: .constant(["미리 보기 택스트"]))
}
