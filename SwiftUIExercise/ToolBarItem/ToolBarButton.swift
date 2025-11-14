//
//  ToolBarButton.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/2/25.
//

import SwiftUI

struct ToolBarButton: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("여기에 메모를 작성하세요")
            }
            .navigationTitle("메모")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        print("메뉴 열림")
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.system(size: 20))
                            .foregroundStyle(.green)
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        print("공유")
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .buttonStyle(ToolbarButtonStyle(color: .yellow))
                    
                    Button {
                        print("추가")
                    } label: {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(ToolbarButtonStyle(color: .orange))
                }
            }
        }
    }
}

struct ToolbarButtonStyle: ButtonStyle {
    let color: Color
    
    init(color: Color = .white) {
        self.color = color
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .foregroundStyle(color)
    }
}

#Preview {
    ToolBarButton()
}
