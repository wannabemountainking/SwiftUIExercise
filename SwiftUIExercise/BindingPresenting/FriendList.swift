//
//  FriendList.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/8/25.
//

import SwiftUI

struct FriendList: View {
    @State private var friends: [String] = ["민수", "영희", "철수"]
    @State private var receiver: String?

    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                List {
                    Section {
                        //content
                        ForEach(friends, id: \.self) { friend in
                            HStack {
                                Text(friend)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.blue)
                                Spacer()
                                Button("전화", systemImage: "phone.fill") {
                                    receiver = friend
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.green)
                            }
                            .padding(3)
                            .padding(.horizontal, 10)
                        }
                    } header: {
                        Text("친구 목록")
                            .font(.title)
                            .fontWeight(.ultraLight)
                            .foregroundStyle(.purple)
                    }
                }//: list
            }//: VStack
            .alert("전화 걸기",
                   isPresented: Binding(
                    get: {receiver != nil},
                    set: {if !$0 {receiver = nil}}
                   ),
                   presenting: receiver
            ) { bud in
                Button("확인", role: .confirm) {
                    print("\(bud)에게 전화 중 ... ")
                }
                Button("취소", role: .cancel) {
                    print("\(bud)에게 전화를 걸지 않습니다")
                }
            } message: { bud in
                Text("\(bud)에게 전화를 거시겠습니까?")
            }

        }//: ZStack
    }
}

#Preview {
    FriendList()
}
