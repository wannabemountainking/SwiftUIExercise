//
//  MusicPlayer.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/13/25.
//

import SwiftUI

struct MusicPlayer: View {
    private let songs = ["Dynamite", "Butter", "Permission to Dance"]
    private let actions = ["재생", "재생목록에 추가", "좋아요"]
    @State private var showActionSheet: Bool = false
    @State private var selectedSong: String?
    @State private var currentStatus = "음악을 선택하세요"
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                Spacer()
                VStack(spacing: 40) {
                    Text(currentStatus)
                        .font(.title)
                    List {
                        ForEach(songs, id: \.self) { song in
                            Button {
                                //action
                                showActionSheet = true
                                selectedSong = song
                            } label: {
                                Text(song)
                                    .font(.headline)
                            }
                        }
                    }
                }
                Spacer()
            }//: VStack
            .scrollContentBackground(.hidden)
            .actionSheet(isPresented: $showActionSheet) {
                selectSong()
            }
        }//: ZStack
    }//: body
    
    private func selectSong() -> ActionSheet {
        
        guard let song = selectedSong else {
            return ActionSheet(
                title: Text("오류"),
                buttons: [.cancel()]
            )
        }
        
        var buttons: [ActionSheet.Button] = actions.map { action in
            .default(
                Text(action)) {
                    currentStatus = "현재 재생 중: \(song) - \(action)"
                }
        }
        buttons.append(.cancel())
        return ActionSheet(
            title: Text("음악"),
            buttons: buttons
        )
    }
}

#Preview {
    MusicPlayer()
}
