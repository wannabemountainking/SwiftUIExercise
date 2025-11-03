//
//  MyTask.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/3/25.
//

import SwiftUI

struct MyTask: View {
    @State private var tasks = ["운동하기", "책 읽기", "코딩연습"]
    @State private var isMenuClicked = false
    @State private var showAddTaskSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach($tasks, id: \.self) { task in
                        NavigationLink {
                            //destination
                            TaskDetailView(taskName: task.wrappedValue)
                        } label: {
                            Text(task.wrappedValue)
                        }
                    }
                    .listRowBackground(Color.purple)
                    .font(.headline)
                    .foregroundStyle(.white)
                } header: {
                    Text("할 일 목록")
                        .font(.title3)
                        .foregroundStyle(.brown)
                }
                
            }
            .navigationTitle("할 일")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation(.easeInOut(duration: 1)) {
                            isMenuClicked.toggle()
                        }
                    } label: {
                        if isMenuClicked {
                            Image(systemName: "pointer.arrow.click")
                        } else {
                            Image(systemName: "line.3.horizontal")
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //action
                        showAddTaskSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showAddTaskSheet) {
                        AddTaskView(tasks: $tasks)
                    }
                }
            }
        }
    }
}

#Preview {
    MyTask()
}
