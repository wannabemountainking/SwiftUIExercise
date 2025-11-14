//
//  PhotoEditor.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/13/25.
//

import SwiftUI

struct PhotoEditor: View {
    
    private let actions: [String] = ["필터", "자르기", "회전"]
    
    @State private var showActionSheet: Bool = false
    @State private var editAction = "작업 내용"
    
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 50) {
                    Text(editAction)
                        .font(.title)
                    Image(systemName: "photo")
                        .font(.system(size: 150))
                        .foregroundStyle(.secondary)
                    Button {
                        //action
                        showActionSheet = true
                    } label: {
                        Text("편집")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .padding(15)
                            .padding(.horizontal, 30)
                            .background(Color.blue)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }
                }
                Spacer()
            }//: VStack
            .actionSheet(isPresented: $showActionSheet) {
                selectEditor()
            }
        } //: ZStack
    }//: body
    
    private func selectEditor() -> ActionSheet {
        var buttons: [ActionSheet.Button] = actions.map { action in
                .default(
                    Text(action)) {
                        editAction = "\(action) 적용 중..."
                    }
        }
        buttons.append(.destructive(
            Text("삭제"),
            action: {
                editAction = "삭제 중..."
            }))
        buttons.append(.cancel())
        
        return ActionSheet(
            title: Text("편집 옵션"),
            buttons: buttons
        )
    }
}

#Preview {
    PhotoEditor()
}
