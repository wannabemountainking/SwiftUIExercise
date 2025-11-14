//
//  ContextWithPreview.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/12/25.
//

import SwiftUI

struct Memo: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    var isPinned: Bool
}

struct MemoPreview: View {
    
    let memo: Memo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack {
                HStack {
                    if memo.isPinned {
                        Image(systemName: "pin.fill")
                            .foregroundStyle(.red)
                    }
                    Text(memo.title)
                        .font(.headline)
                }
                Divider()
                Text(memo.content)
                    .font(.body)
                    .foregroundStyle(.secondary)
                Spacer()
            }
            .padding()
            .frame(width: 250, height: 200)
            .background(Color(UIColor.systemBackground))
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
        }
    }
}

struct ContextWithPreview: View {
    @State private var memos: [Memo] = [
        Memo(title: "coding", content: "iOS coding Practice", isPinned: true),
        Memo(title: "walk", content: "walk around the hospital", isPinned: true),
        Memo(title: "reading", content: "listen to novel", isPinned: false)
    ]
    
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                List {
                    ForEach($memos, id: \.id) { $memo in
                        HStack {
                            if memo.isPinned {
                                Image(systemName: "pin.fill")
                                    .foregroundStyle(.red)
                            }
                            Text(memo.title)
                                .font(.headline)
                        }
                        .contextMenu {
                            Button(
                                memo.isPinned ? "고정 해제" : "고정",
                                systemImage: memo.isPinned ? "pin" : "pin.slash") {
                                    memo.isPinned.toggle()
                                    print(memo.isPinned ? "메모가 고정되었습니다" : "메모고정이 해제되었습니다.")
                                }
                            Button(
                                "편집",
                                systemImage: "pencil"
                                ) {
                                    editMemo(memo: memo)
                                }
                            Button(
                                "공유",
                                systemImage: "square.and.arrow.up"
                                ) {
                                    shareMemo(memo: memo)
                                }
                            Button("삭제", systemImage: "trash", role: .destructive) {
                                deleteMemo(memo)
                            }

                        } preview: {
                            MemoPreview(memo: memo)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                //action
                                deleteMemo(memo)
                            } label: {
                                Label("삭제", systemImage: "trash")
                            }

                        }
                    } //: forEach
                } //: list
                .scrollContentBackground(.hidden)
            } //: VStack
        }//: ZStack
    }//: body
    
    private func editMemo(memo: Memo) {
        print("'\(memo.title)' 편집 중...")
    }
    private func shareMemo(memo: Memo) {
        print("'\(memo.title)' 공유")
    }
    
    private func deleteMemo(_ memo: Memo) {
        withAnimation {
            memos.removeAll { $0.id == memo.id }
        }
        print("'\(memo.title)' 삭제됨")
    }
}

#Preview {
    ContextWithPreview()
}
