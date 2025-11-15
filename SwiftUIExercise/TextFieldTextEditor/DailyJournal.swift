//
//  DailyJournal.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/15/25.
//

import SwiftUI


struct Diary: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var contentPreview: String {
        let lines = content.split(separator: "\n")
        let lineCount = min(lines.count, 3)
        let firstLines = lines[0..<lineCount]
        let string = firstLines.joined(separator: "\n")
        return string
    }
}

struct DailyJournal: View {
    
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var diaries: [Diary] = []
    @State private var isDiarySaved: Bool = false
    @State private var currentDiary: Diary?
    
    private var isFormValid: Bool {
        !title.trimmingCharacters(in: .whitespaces).isEmpty && content.count >= 10
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack {
                    TextField("제목을 입력하세요", text: $title)
                        .font(.largeTitle)
                        .fontWeight(.ultraLight)
                        .padding(20)
                    
                    ZStack(alignment: .topLeading) {
                        // placeholder
                        if content.isEmpty {
                            Text("오늘 있었던 일을 적어보세요...")
                                .foregroundStyle(Color(uiColor: .darkGray))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 20)
                        }
                        
                        //textEditor
                        TextEditor(text: $content)
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(width: geometry.size.width - 40 , height: 300)
                    }
                    .colorMultiply(.yellow.opacity(0.3))
                    .padding(.vertical, 20)
                    
                    Text("\(content.count) 자")
                        .font(.headline)
                    
                    // save button
                    Button {
                        // action
                        
                        if isFormValid {
                            isDiarySaved = true
                            currentDiary = makeDiary()
                            if let diary = currentDiary {
                                diaries.append(diary)
                                if diaries.count == 3 {
                                    diaries.removeFirst()
                                }
                                print(diaries)
                                
                                //입력 필드 초기화
                                title = ""
                                content = ""
                            }
                        }
                    } label: {
                        Text("저장")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.vertical, 15)
                            .frame(maxWidth: geometry.size.width - 40)
                            .background(Color.cyan)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    if isDiarySaved {
                        showDiary()
                    }
                    Spacer()
                }//: VStack
            }//: ZStack
        }//: geometry
    }//: body
    
    private func makeDiary() -> Diary {
        return Diary(title: title, content: content)
    }
    
    private func showDiary() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            if let diary = currentDiary {
                Text(diary.title)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(diary.contentPreview)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.gray.opacity(0.1))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    DailyJournal()
}
