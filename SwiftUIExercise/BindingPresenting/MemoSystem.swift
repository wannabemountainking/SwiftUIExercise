//
//  MemoSystem.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/10/25.
//

import SwiftUI

struct MemoSystem: View {
    @State private var messages: [Message] = [
        Message(from: "Jinnie", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac eros aliquam, tincidunt sem ut, faucibus purus. Integer pharetra tortor non ex porta auctor. Aenean nunc nisi, porta in vestibulum.", isRead: true),
        Message(from: "Yannie", content: "Nam placerat dapibus diam, at varius massa sollicitudin non. Proin justo lectus, iaculis in enim nec, vehicula fermentum orci. Maecenas accumsan bibendum bibendum. Duis rutrum neque ac ultricies gravida. Nulla.", isRead: false),
        Message(from: "Johnnie", content: "Integer ac erat eget nunc consequat rutrum. Suspendisse vulputate, justo et mollis pellentesque, eros lectus feugiat neque, et cursus elit metus eu dui. Fusce eget ipsum ligula. Ut quam justo.", isRead: true),
        Message(from: "Eunnie", content: "Aenean suscipit vel erat in dignissim. Integer sit amet varius turpis, nec posuere velit. In hac habitasse platea dictumst. Donec quis est pretium, tristique quam at, dapibus neque. Donec lacinia.", isRead: false)
    ]
    @State private var selectedMessageId: UUID?
    private var selectedMessage: Message? {
        guard let id = selectedMessageId else {return nil}
        return messages.first { $0.id == id }
    }
    
    struct Message: Identifiable {
        let id = UUID()
        var from: String
        var content: String
        var isRead: Bool
    }
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            List {
                ForEach(messages, id: \.id) { message in
                    HStack(spacing: 20) {
                        let preview = message.content.prefix(15)
                        if message.isRead {
                            Text("\(message.from) • \(preview)")
                        } else {
                            Text("\(message.from) • \(preview)")
                                .fontWeight(.bold)
                        }
                    }
                    .onTapGesture {
                        selectedMessageId = message.id
                    }
                }
            }
            .alert("\(selectedMessage?.from ?? "Anonymous")님의 쪽지",
                   isPresented: Binding(
                    get: { selectedMessageId != nil },
                    set: { if !$0 { selectedMessageId = nil }}
                   ),
                   presenting: selectedMessage
            ) { message in
                Button("확인", role: .confirm) {
                    markAsRead()
                }
                Button("답장하기", role: .confirm) {
                    replyToMessage()
                }
            } message: { message in
                Text(selectedMessage?.content ?? "")
            }

        }
       
    }
    
    private func markAsRead() {
        guard let id = selectedMessageId,
              let index = messages.firstIndex(where: { $0.id == id }) else {return}
        messages[index].isRead = true
        selectedMessageId = nil
    }
    
    private func replyToMessage() {
        if let message = selectedMessage {
            print("\(message.from)에게 답장 중...")
        }
        selectedMessageId = nil
    }

}

#Preview {
    MemoSystem()
}
