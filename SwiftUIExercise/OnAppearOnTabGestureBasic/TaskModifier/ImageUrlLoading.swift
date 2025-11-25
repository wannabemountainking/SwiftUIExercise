//
//  ImageUrlLoading.swift
//  SwiftUIExercise
//
//  Created by yoonie on 11/25/25.
//

import SwiftUI

struct DownloadedImage: Identifiable {
    let id = UUID()
    let urlString: String
    let image: Image
}

struct ImageUrlLoading: View {
    @State private var downloadedImages: [DownloadedImage] = []
    private let imageURLs = [
        "https://picsum.photos/200/300?random=1",
        "https://picsum.photos/200/300?random=2",
        "https://picsum.photos/200/300?random=3",
        "https://picsum.photos/200/300?random=4",
        "https://picsum.photos/200/300?random=5"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(downloadedImages, id: \.id) { image in
                    image.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                }//:ForEach
            }//: List
            .navigationTitle("Image URL")
            .navigationBarTitleDisplayMode(.inline)
        } //: NavigationStack
        .task {
            for url in imageURLs {
                do {
                    let image = try await fetchImage(urlString: url)
                    let downloadedImage = DownloadedImage(urlString: url, image: image)
                    withAnimation(.spring(duration: 1.0)) {
                        downloadedImages.append(downloadedImage)
                    }
                } catch is CancellationError {
                    print("작업이 취소되었습니다")
                } catch {
                    print("에러발생: \(error.localizedDescription)")
                }
            }
        }
    }//: body

    private func fetchImage(urlString: String) async throws -> Image {
        guard let url = URL(string: urlString) else {
            return Image(systemName: "photo.trianglebadge.exclamationmark.fill")
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let uiImage = UIImage(data: data) else {
            return Image(systemName: "photo.trianglebadge.exclamationmark.fill")
        }
        return Image(uiImage: uiImage)
    }
}

#Preview {
    ImageUrlLoading()
}
