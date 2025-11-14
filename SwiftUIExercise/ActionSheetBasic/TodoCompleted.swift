//
//  TodoCompleted.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/14/25.
//

import SwiftUI

struct TodoCompleted: View {
    
    @State private var todos = ["workout", "reading books", "practice coding"]
    @State private var selectedTodo: String?
    @State private var resultAction: String = "할 일은 완료하셨나요?"
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Spacer()
                    Text(resultAction)
                        .font(.title)
                    List {
                        ForEach(todos, id: \.self) { todo in
                            Button {
                                //action
                                selectedTodo = todo
                            } label: {
                                Text(todo)
                                    .font(.title3)
                                    .foregroundStyle(.black)
                            }// Button
                        }//: foreach
                    }//: list
                }//: VStack
                
                Spacer()
            }//: VStack
            .scrollContentBackground(.hidden)
            .confirmationDialog(
                "할 일 상태",
                isPresented: Binding(
                    get: { selectedTodo != nil },
                    set: { if !$0 { selectedTodo = nil } }
                ),
                titleVisibility: .visible,
                presenting: selectedTodo) { todo in
                    //완료
                    Button("완료 표시 ✅") {
                        //action
                        resultAction = "\(todo)을/를 완료했습니다"
                    }
                       
                    // 삭제
                    Button("삭제하기 🗑️", role: .destructive) {
                        //action
                        resultAction = "\(todo)을/를 삭제했습니다"
                        todos.removeAll { $0 == todo }
                    }
                    
                    // 취소
                    Button("취소", role: .cancel) {  }
                } message: { todo in
                    Text("'\(todo)'을/를 어떻게 하시겠습니까")
                }
        }//: ZStack
    }//: body
}

#Preview {
    TodoCompleted()
}
