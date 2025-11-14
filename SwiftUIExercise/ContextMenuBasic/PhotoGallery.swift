//
//  PhotoGallery.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/12/25.
//

import SwiftUI

struct NameOfAction: Identifiable {
    let id = UUID()
    var title: String
    var imageTitle: String
}

struct PhotoGallery: View {
    private var colors: [Color] = [
        .red, .blue, .green, .yellow, .brown, .orange, .pink, .purple, .cyan, .gray, .indigo, .mint, .teal, .white
    ]
    let columns = [
        GridItem(.flexible(minimum: 70, maximum: 200), spacing: 6, alignment: .topLeading),
        GridItem(.flexible(minimum: 100, maximum: 300), spacing: 6, alignment: .topLeading)
    ]
    @State private var showAlert: Bool = false
    @State private var nameOfActions: [NameOfAction] = [
        NameOfAction(title: "공유", imageTitle: "square.and.arrow.up"),
        NameOfAction(title: "즐겨찾기", imageTitle: "star"),
        NameOfAction(title: "삭제", imageTitle: "trash")
    ]
    @State private var selectedColor: Color?
    @State private var actionName: NameOfAction?
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .leading,
                spacing: 6,
                pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(colors, id: \.self) { color in
                            Rectangle()
                                .fill(color)
                                .frame(width: 190, height: 190)
                                .contextMenu {
                                    ForEach(nameOfActions, id: \.id) { action in
                                        Button(action.title, systemImage: action.imageTitle) {
                                            actionName = action
                                            selectedColor = color
                                            showAlert = true
                                        }
                                    }
                                }
                        }
                    } header: {
                        Text("Section1")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)
                            .background(Color(UIColor.systemBackground))
                    }
                }
                .padding(.horizontal)
            }
            .alert("알림", isPresented: $showAlert, presenting: actionName) { actionName in
                Button("확인", role: .confirm) {
                    print("\(selectedColor?.description ?? "색상")에 \(actionName.title) 실행")
                }
                Button("취소", role: .cancel) { }
            } message: { actionName in
                if let color = selectedColor {
                    Text("\(color.description) 사진에 '\(actionName.title)' 액선을 수행하시겠습니까?")
                }
            }
    }
}

#Preview {
    PhotoGallery()
}
