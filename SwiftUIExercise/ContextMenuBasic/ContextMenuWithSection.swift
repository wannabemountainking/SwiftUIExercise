//
//  ContextMenuWithSection.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/12/25.
//

import SwiftUI

struct ContextMenuWithSection: View {
    @State private var fileData: [String] = ["문서1.txt", "이미지.png", "영상.mp4"]
    var body: some View {
        ZStack {
            Color.orange.opacity(0.8).ignoresSafeArea()
            
            VStack {
                List {
                    ForEach(fileData, id: \.self) { file in
                        Text(file)
                            .contextMenu {
                                Section {
                                    Button("열기") {
                                        print("열기")
                                    }
                                    Button("미리보기") {
                                        print("미리보기")
                                    }
                                }
                                
                                Section {
                                    Button("이름변경") {
                                        print("이름변경")
                                    }
                                    Button("복사") {
                                        print("복사")
                                    }
                                }
                                
                                Section {
                                    Button("삭제") {
                                        print("삭제")
                                    }
                                }
                            }
                    } //: ForEach
                    .onDelete(perform: deleteItems)
                }//: list
                .scrollContentBackground(.hidden)
            }//: VStack
        }//: ZStack
        
    }//: body
    
    private func deleteItems(at offsets: IndexSet) {
        fileData.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContextMenuWithSection()
}
