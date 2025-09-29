import SwiftUI

struct VideoItem: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let avatarImageName: String
    let thumbnailImageName: String
}

struct VideoTabView: View {
    private let videos: [VideoItem] = [
        .init(title: "Design Trends 2024", author: "Mai Nguyen", avatarImageName: "avatar1", thumbnailImageName: "thumb1"),
        .init(title: "SwiftUI Animations", author: "Tran Le", avatarImageName: "avatar2", thumbnailImageName: "thumb2"),
        .init(title: "Combine in Practice", author: "Anh Pham", avatarImageName: "avatar3", thumbnailImageName: "thumb3"),
        .init(title: "Modern iOS Architecture", author: "Linh Tran", avatarImageName: "avatar4", thumbnailImageName: "thumb4"),
        .init(title: "Debugging Tips", author: "Khoa Vo", avatarImageName: "avatar5", thumbnailImageName: "thumb5"),
        .init(title: "Design Systems", author: "My Dang", avatarImageName: "avatar6", thumbnailImageName: "thumb6")
    ]

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                Text("Videos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                    ForEach(videos) { video in
                        VideoCardView(video: video)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
}

private struct VideoCardView: View {
    let video: VideoItem

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VideoThumbnail(imageName: video.thumbnailImageName)
                .frame(height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

            Text(video.title)
                .font(.headline)
                .foregroundStyle(Color.primary)
                .lineLimit(2)

            HStack(spacing: 12) {
                Image(video.avatarImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())

                Text(video.author)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Spacer(minLength: 0)
            }
        }
    }
}

private struct VideoThumbnail: View {
    let imageName: String

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()

            Circle()
                .fill(Color.black.opacity(0.45))
                .frame(width: 52, height: 52)
                .overlay(
                    Image(systemName: "play.fill")
                        .foregroundStyle(.white)
                        .font(.title2)
                )
        }
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(.systemGray5))
        )
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct VideoTabView_Previews: PreviewProvider {
    static var previews: some View {
        VideoTabView()
            .previewDisplayName("Video Tab")
    }
}
