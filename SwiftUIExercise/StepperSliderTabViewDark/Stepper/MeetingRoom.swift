//
//  MeetingRoom.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/23/25.
//

import SwiftUI


struct MeetingRoom: View {
    @State private var adults: Int = 2
    @State private var children: Int = 0
    @State private var showAlert: Bool = false
    
    private var capacity = 10
    
    private var isOverCapacity: Bool {
        return totalOccupancy >= capacity
    }
    
    private var totalOccupancy: Int {
        return adults + children
    }
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("회의실 예약")
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                    .fontWeight(.ultraLight)
                
                VStack(spacing: 20) {
                    Stepper(
                        "성인 \(adults)명",
                        value: $adults,
                        in: 1...20,
                        step: 1
                    )
                    Divider()
                    Stepper(
                        "어린이 \(children)명",
                        value: $children,
                        in: 0...20,
                        step: 1
                    )
                }
                .padding(10)
                .background(Color.yellow.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))

                HStack {
                    Text("총 인원")
                    Spacer()
                    Text("\(totalOccupancy)명")
                }
                .fontWeight(.bold)
                .padding(10)
                .background(Color.green.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }
            .font(.headline)
            .foregroundStyle(isOverCapacity ? .red : .primary)
            .onChange(of: totalOccupancy, { oldValue, newValue in
                if newValue >= capacity && oldValue < capacity {
                    showAlert = true
                }
            })
            .padding()
            .padding(.horizontal, 50)
            .alert(
                "총인원 초과",
                isPresented: $showAlert
            ) {
                //action
                Button {
                    //action
                    print("\(totalOccupancy)명 - 정원 초과")
                } label: {
                    Text("확인")
                }
            } message: {
                Text("이 회의실의 수용 가능 인원은 \(capacity)명 미만입니다")
            }
        }//:ZStack
    }//:body
}

#Preview {
    MeetingRoom()
}
