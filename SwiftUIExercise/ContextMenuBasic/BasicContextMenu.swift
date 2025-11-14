//
//  BasicContextMenu.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/12/25.
//

import SwiftUI

struct Todo: Identifiable {
    let id = UUID()
    let title: String
    var isDone: Bool = false
}

struct TodoContextMenuModifier: ViewModifier {
    let todo: Todo
    let onToggle: () -> Void
    let onDelete: () -> Void
    
    func body(content: Content) -> some View {
        content.contextMenu {
            Button {
                //action
                onToggle()
            } label: {
                Label(
                    todo.isDone ? "미완료로 변경" : "완료",
                    systemImage: todo.isDone ? "arrow.uturn.backward" : "checkmark"
                )
            }
            
            Divider()
            
            Button(role: .destructive) {
                //action
                onDelete()
            } label: {
                Label("삭제", systemImage: "trash")
            }

        }
    }
}

extension View {
    func todoContextMenu(
        todo: Todo,
        onToggle: @escaping () -> Void,
        onDelete: @escaping () -> Void
    ) -> some View {
        modifier(TodoContextMenuModifier(
            todo: todo,
            onToggle: onToggle,
            onDelete: onDelete))
    }
}

struct BasicContextMenu: View {
    @State private var todos: [Todo] = [
        Todo(title: "SwiftUI 익히기"),
        Todo(title: "UIKit 익히기"),
        Todo(title: "운동하기"),
        Todo(title: "책 읽기")
    ]
    
    var body: some View {
        
        ZStack {
            Color.orange.opacity(0.8).ignoresSafeArea()
            
            VStack {
                List {
                    ForEach(todos, id: \.id) { todo in
                        todoRow(todo: todo)
                            .todoContextMenu(
                                todo: todo) {
                                // onToggle
                                    toggleTodo(id: todo.id)
                                } onDelete: {
                                    deleteTodo(id: todo.id)
                                }
                        
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
        
    private func toggleTodo(id: UUID) {
        withAnimation {
            guard let index = todos.firstIndex(where: { $0.id == id }) else {return}
            todos[index].isDone.toggle()
        }
    }
    
    private func deleteTodo(id: UUID) {
        withAnimation {
            todos.removeAll { $0.id == id }
        }
    }
    
    
    private func todoRow(todo: Todo) -> some View {
        HStack {
            Text(todo.title)
                .font(todo.isDone ? .subheadline : .headline)
                .fontWeight(todo.isDone ? .ultraLight : .bold)
                .foregroundStyle(todo.isDone ? .gray : .brown)
                .strikethrough(todo.isDone, color: .red)
                .padding(5)
                .padding(.horizontal, 10)
            Spacer()
            if todo.isDone {
                Image(systemName: "checkmark.circle.fill")
                    .font(.headline)
                    .foregroundStyle(.green)
            }
        }
    }
    
}

#Preview {
    BasicContextMenu()
}
