//
//  TabViewPageStyle.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 12/9/25.
//

import SwiftUI

//extension UIWindow {
//    static var currentWin: UIWindow? {
//        UIApplication.shared.connectedScenes
//            .compactMap { $0 as? UIWindowScene }
//            .flatMap { $0.windows }
//            .first { $0.isKeyWindow }
//    }
//}
//
//struct ScreenSize {
//    static var width: CGFloat {
//        UIWindow.currentWin?.bounds.width ?? 375
//    }
//    
//    static var height: CGFloat {
//        UIWindow.currentWin?.bounds.height ?? 667
//    }
//}


struct TabViewPageStyle: View {
    let imageNames: [String] = ["star.fill", "heart.fill", "photo", "pencil", "eraser", "scribble", "trash", "folder"]
    var body: some View {
        GroupBox {
            GeometryReader { geometry in
                TabView {
                    ForEach(imageNames, id: \.self) { imageString in
                        Image(systemName: imageString)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width - 30)
                    }//:Loop
                }// TabView
                .background(Color.orange)
                .tabViewStyle(.page)
            }//: GeometryReader
        } //: GroupBox
        .navigationTitle("이미지 슬라이더")
        .navigationBarTitleDisplayMode(.inline)
    }//:body
}

#Preview {
    TabViewPageStyle()
}
