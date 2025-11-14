//
//  DynamicContextMenu.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/12/25.
//

import SwiftUI

struct Song: Identifiable {
    let id = UUID()
    let title: String
    var isFavorite: Bool
    var isDownloaded: Bool
}

struct DynamicContextMenu: View {
    @State private var songs: [Song] = [
        Song(title: "Chic to chic", isFavorite: false, isDownloaded: true),
        Song(title: "Fly to the moon", isFavorite: true, isDownloaded: false),
        Song(title: "Over the rainbow", isFavorite: false, isDownloaded: true),
        Song(title: "Dancing queen", isFavorite: true, isDownloaded: false)
    ]
    @State private var songId: UUID?
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                List {
                    ForEach($songs, id: \.id) { $song in
                        HStack {
                            Text(song.title)
                                .font(.headline)
                            
                            Spacer()
                            
                            if song.isFavorite {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                            }
                            if song.isDownloaded {
                                Image(systemName: "arrow.down.circle.fill")
                                    .foregroundStyle(.blue)
                            }
                        }//: HStack
                        .padding(.horizontal, 10)
                        .contextMenu {
                            Section {
                                // 즐겨찾기
                                Button(
                                    song.isFavorite ? "즐겨찾기 해제": "즐겨찾기 추가",
                                    systemImage: song.isFavorite ? "star.fill" : "star"
                                ) {
                                    song.isFavorite.toggle()
                                }
                                // 다운로드
                                Button(
                                    song.isDownloaded ? "다운로드 삭제" : "다운로드",
                                    systemImage: song.isDownloaded ? "trash" : "square.and.arrow.down"
                                ) {
                                    song.isDownloaded.toggle()
                                }
                            }
                            Section {
                                Button("재생목록에 추가", systemImage: "music.note.list") {
                                    print("재생목록에 추가")
                                }
                                Button("공유", systemImage: "person.3") {
                                    print("공유")
                                }
                            }
                        }
                    }//: ForEach
                }//: List
                .scrollContentBackground(.hidden)
            }//: VStack
        }//: ZStack
    }//: body
}

#Preview {
    DynamicContextMenu()
}
