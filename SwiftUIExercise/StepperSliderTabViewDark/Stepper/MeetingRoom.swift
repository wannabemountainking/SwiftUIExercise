//
//  MeetingRoom.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/23/25.
//

import SwiftUI


struct MeetingRoom: View {
    @State private var grownUps: Int = 2
    @State private var children: Int = 0
    @State private var underTen: Bool = false
    
    private var occupancy: Int {
        return grownUps + children
    }
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("회의실 예약")
                    .font(.largeTitle)
                    .fontWeight(.light)
                Stepper(
                    "성인 \(grownUps)명",
                    value: $grownUps,
                    in: 1...20,
                    step: 1
                )
                Stepper(
                    "어린이 \(children)명",
                    value: $children,
                    in: 1...20,
                    step: 1
                )
            }
            .padding()
            .padding(.horizontal, 70)
            .alert("인원 초과", isPresented: $underTen) {
                // action
                Text("총인원 10명 이상")
            } message: {
                Text("회의실 참석인원은 10명 미만이어야 한다.")
            }

        }
    }
}

#Preview {
    MeetingRoom()
}
