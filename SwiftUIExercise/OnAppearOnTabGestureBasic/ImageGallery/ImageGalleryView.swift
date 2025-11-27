//
//  ImageGalleryView.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/27/25.
//

//

import SwiftUI


enum ImageURL {
    static let imageUrls: [String] = [
        "https://picsum.photos/400/300?random=1",
        "https://picsum.photos/400/300?random=2",
        "https://picsum.photos/400/300?random=3",
        "https://picsum.photos/400/300?random=4",
        "https://picsum.photos/400/300?random=5",
        "https://picsum.photos/400/300?random=6",
        "https://picsum.photos/400/300?random=7",
        "https://picsum.photos/400/300?random=8",
        "https://picsum.photos/400/300?random=9",
        "https://picsum.photos/400/300?random=10",
        "https://picsum.photos/400/300?random=11",
        "https://picsum.photos/400/300?random=12",
        "https://picsum.photos/400/300?random=13",
        "https://picsum.photos/400/300?random=14",
        "https://picsum.photos/400/300?random=15",
        "https://picsum.photos/400/300?random=16",
        "https://picsum.photos/400/300?random=17",
        "https://picsum.photos/400/300?random=18",
        "https://picsum.photos/400/300?random=19",
        "https://picsum.photos/400/300?random=20",
        "https://picsum.photos/400/300?random=21",
        "https://picsum.photos/400/300?random=22",
        "https://picsum.photos/400/300?random=23",
        "https://picsum.photos/400/300?random=24",
        "https://picsum.photos/400/300?random=25",
        "https://picsum.photos/400/300?random=26",
        "https://picsum.photos/400/300?random=27",
        "https://picsum.photos/400/300?random=28",
        "https://picsum.photos/400/300?random=29",
        "https://picsum.photos/400/300?random=30"
    ]
}

struct Photo: Identifiable {
    let id = UUID()
    var imageUrl: String
    var likeCount: Int = 0
    var isLikedByUser: Bool = false
    var title: String? {
        let urlArray = imageUrl.components(separatedBy: "random=")
        return urlArray.last
    }
    var isCounted: Bool = false
}

struct ImageGalleryView: View {
    @State private var photos: [Photo] = []
    @State private var selectedPhoto: Photo?
    @State private var photosLoaded: Int = 0
    
    var body: some View {

        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]) {
                    ForEach($photos, id: \.id) { $photo in
                        photoCell(for: photo)
                    }//: ForEach
                }//: LazyVGrid
                .task {
                    photos = ImageURL.imageUrls.map {
                        Photo(imageUrl: $0)
                    }
                }
                .padding(20)
            }
            .navigationTitle("로드된 사진 수: \(photosLoaded)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }//: body
    
    @ViewBuilder
    private func photoCell(for photo: Photo) -> some View {
        
        if let url = URL(string: photo.imageUrl) {
            AsyncImage(
                url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .controlSize(.extraLarge)
                    case .success(let image):
                        VStack {
                            image
                                .resizable()
                                .scaledToFit()
                            Text("❤️  \(photo.likeCount)")
                                .font(.headline)
                        }
                        .padding(.vertical, 10)
                        .onAppear {
                            if !photo.isCounted {
                                photosLoaded += 1
                                if let index = photos.firstIndex(where: { $0.id == photo.id }) {
                                    photos[index].isCounted = true
                                }
                            }
                        }
                     case .failure:
                        Image(systemName: "photo.fill")
                            .foregroundStyle(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
        } else {
            Color.gray.opacity(0.7)
        }
        
    }
}



#Preview {
    ImageGalleryView()
}

