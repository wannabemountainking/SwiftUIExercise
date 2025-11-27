//
//  TodoExercise.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/26/25.
//

import SwiftUI

enum TodoList {
    static let todos: [WorkTodo] = [
        WorkTodo(title: "iOS Coding"),
        WorkTodo(title: "Workout"),
        WorkTodo(title: "Python Coding"),
        WorkTodo(title: "JavaScript Coding"),
        WorkTodo(title: "계약서 작성")
    ]
}

struct WorkTodo: Identifiable, Equatable {
    let id = UUID()
    let title: String
    var isDone: Bool = false
}

struct TodoExercise: View {
    
    @State private var newTodoString: String = ""
    @State private var newTodo: WorkTodo?
    @State private var worksTodo: [WorkTodo] = []
    @State private var selectedTodo: WorkTodo?
    @State private var hasTodoSelected: Bool = false
    var body: some View {
        VStack {
            List {
                Section("입력 섹션") {
                    HStack {
                        TextField("새로운 할 일을 입력하세요", text: $newTodoString)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .textFieldStyle(.roundedBorder)
                        Spacer()
                        Button {
                            //action
                            insertNewTodo(newTitle: newTodoString)
                        } label: {
                            Text("할 일 추가")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .padding(5)
                                .padding(.horizontal, 10)
                                .background(Color.accentColor)
                                .clipShape(RoundedRectangle(cornerRadius: 7))
                        }
                    }//: HStack
                    .padding()
                }// : SEction
                
                Section("목록 섹션") {
                    if worksTodo.isEmpty {
                        HStack {
                            Spacer()
                            ProgressView {
                                Text("Data loading...")
                                    .font(.title)
                                    .foregroundStyle(.gray)
                                    .padding()
                            }
                            .controlSize(.extraLarge)
                            .frame(width: 300, height: 300)
                            
                            Spacer()
                        }
                    } else {
                        ScrollView {
                            LazyVStack {
                                ForEach(worksTodo, id: \.id) { todo in
                                    HStack {
                                        Button {
                                            //action
                                            hasTodoSelected.toggle()
                                            update(todoId: todo.id, todoIsCompleted: hasTodoSelected)
                                        } label: {
                                            Text(hasTodoSelected ? "☑︎" : "◻︎")
                                                .font(.title)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(hasTodoSelected ? .green : .red)
                                        }
                                        
                                        Spacer()
                                        
                                        Text(todo.title)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .strikethrough(todo.isDone, color: .red)
                                        
                                        Spacer()
                                        
                                        Button("삭제", role: .destructive) {
                                            remove(todoId: todo.id)
                                        }
                                    } //: HStack
                                    .padding()
                                }//: foreach
                            }//: LazyVStack
                        }//: ScrollView
                    }
                }//: Section
            }// : List
        }//: VStack
        .task {
            try? await Task.sleep(for: .seconds(3))
            worksTodo = TodoList.todos
        }
    }//:body
    
    private func insertNewTodo(newTitle: String, ) {
        if !worksTodo.contains(where: { $0.title == newTitle }) {
            let todo = WorkTodo(title: newTitle)
            worksTodo.append(todo)
            newTodoString = ""
        }
    }
    
    private func getTodo(todoTitle: String) -> WorkTodo? {
        guard let index = worksTodo.firstIndex(where: { workTodo in
            workTodo.title == todoTitle
        }) else {return nil}
        return worksTodo[index]
    }
    
    private func update(todoId: UUID, todoIsCompleted: Bool) {
        guard let index = worksTodo.firstIndex(where: { workTodo in
            workTodo.id == todoId
        }) else {return}
        worksTodo[index].isDone = todoIsCompleted
    }
    
    private func remove(todoId: UUID) {
        worksTodo.removeAll { $0.id == todoId }
    }
}

#Preview {
    TodoExercise()
}
