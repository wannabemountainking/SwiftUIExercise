//
//  TodoDelete.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/6/25.
//

import SwiftUI

struct TodoDelete: View {

    @State private var todos: [String] = ["운동하기", "공부하기", "장보기"]
    @State private var soonToDelete: String?
    
    var showAlert: Binding<Bool> {
        Binding(
            get: { soonToDelete != nil },
            set: { if !$0 { soonToDelete = nil} }
        )
    }
    
    var body: some View {
        ZStack {
            Color.teal
                .ignoresSafeArea()

            List {
                ForEach(todos, id: \.self) { todo in
                    HStack {
                        Text(todo)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(5)
                        Spacer()
                        Button {
                            //action
                            soonToDelete = todo
                        } label: {
                            Text("삭제")
                                .font(.headline)
                                .foregroundStyle(.red)
                        }
                        .padding(5)
                    }
                    .padding(5)
                }
                .listRowBackground(Color.indigo)
            }// : list
            .alert("삭제 확인", isPresented: showAlert, presenting: soonToDelete) { todo in
                Button("확인", role: .destructive) {
                    todos.removeAll { $0 == todo }
                    soonToDelete = nil
                }
                Button("취소", role: .cancel) {}
            } message: { todo in
                Text("[\(String(describing: todo))]을(를) 삭제하시겠습니까?")
            }
        } //: ZStack
    }
}

#Preview {
    TodoDelete()
}
