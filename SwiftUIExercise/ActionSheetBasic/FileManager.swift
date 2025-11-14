//
//  FileManager.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/13/25.
//

import SwiftUI

struct FileManager: View {
    @State private var files: [String] = ["보고서.pdf", "사진.jpg", "메모.txt"]
    @State private var selectedFile: String?
    @State private var actionResult: String = "선택하세요"
    @State private var showActionSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Spacer()
                Text(actionResult)
                    .font(.largeTitle)
                Spacer()
                List {
                    ForEach(files, id: \.self) { file in
                        Button {
                            //action
                            showActionSheet = true
                            selectedFile = file
                        } label: {
                            Text(file)
                                .font(.headline)
                                .padding(5)
                                .padding(.horizontal, 5)
                        }
                    }//: foreach
                }// : list
            }//: Vstack
            .scrollContentBackground(.hidden)
            .actionSheet(isPresented: $showActionSheet) {
                chooseFileAction(file: selectedFile ?? "")
            }
        }//: zstack
    }//: body
    
    private func chooseFileAction(file: String) -> ActionSheet {
        let openButton: ActionSheet.Button = .default(
            Text("열기")) {
                actionResult = "\(file)을/를 열었습니다"
            }
        let shareButton: ActionSheet.Button = .default(
            Text("공유")) {
                actionResult = "\(file)을/를 공유했습니다"
            }
        let deleteButton: ActionSheet.Button = .destructive(
            Text("삭제")) {
                actionResult = "\(file)을/를 삭제했습니다"
                deleteFile(item: file)
            }
        let cancelButton: ActionSheet.Button = .cancel()
        
        return ActionSheet(
            title: Text("파일을 어떻게 하시겠습니까?"),
            buttons: [openButton, shareButton, deleteButton, cancelButton]
        )
    }
    
    private func deleteFile(item: String) {
        files.removeAll { $0 == item }
    }
}

#Preview {
    FileManager()
}
