//
//  Settings.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/2/25.
//

import SwiftUI

struct Settings: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            //background
            Color.pink.opacity(0.5)
                .ignoresSafeArea()
        
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                    .padding(12)
                    .background(
                        Circle()
                            .fill(Color.black.opacity(0.3))
                    )
            }
            .padding()
        }
    }
}

#Preview {
    Settings()
}
