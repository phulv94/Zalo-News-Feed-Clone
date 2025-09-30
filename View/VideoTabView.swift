import SwiftUI

struct VideoItem: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let avatarURL: URL
    let thumbnailURL: URL
}

struct VideoTabView: View {
    private let videos: [VideoItem] = [
        .init(
            title: "Design Trends 2024",
            author: "Mai Nguyen",
            avatarURL: URL(string: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=200&q=80")!,
            thumbnailURL: URL(string: "https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?auto=format&fit=crop&w=800&q=80")!
        ),
        .init(
            title: "SwiftUI Animations",
            author: "Tran Le",
            avatarURL: URL(string: "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=200&q=80")!,
            thumbnailURL: URL(string: "https://images.unsplash.com/photo-1556157382-97eda2d62296?auto=format&fit=crop&w=800&q=80")!
        ),
        .init(
            title: "Combine in Practice",
            author: "Anh Pham",
            avatarURL: URL(string: "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?auto=format&fit=crop&w=200&q=80")!,
            thumbnailURL: URL(string: "https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&w=800&q=80")!
        ),
        .init(
            title: "Modern iOS Architecture",
            author: "Linh Tran",
            avatarURL: URL(string: "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=80")!,
            thumbnailURL: URL(string: "https://images.unsplash.com/photo-1545239351-1141bd82e8a6?auto=format&fit=crop&w=800&q=80")!
        ),
        .init(
            title: "Debugging Tips",
            author: "Khoa Vo",
            avatarURL: URL(string: "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=80")!,
            thumbnailURL: URL(string: "https://images.unsplash.com/photo-1517430816045-df4b7de11d1d?auto=format&fit=crop&w=800&q=80")!
        ),
        .init(
            title: "Design Systems",
            author: "My Dang",
            avatarURL: URL(string: "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=200&q=80")!,
            thumbnailURL: URL(string: "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=800&q=80")!
        ),
        .init(
            title: "Mastering AsyncImage",
            author: "Tu Nguyen",
            avatarURL: URL(string: "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=200&q=80")!,
            thumbnailURL: URL(string: "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80")!
        ),
        .init(
            title: "WidgetKit Essentials",
            author: "Dat Bui",
            avatarURL: URL(string: "https://images.unsplash.com/photo-1545239351-1141bd82e8a6?auto=format&fit=crop&w=200&q=80")!,
            thumbnailURL: URL(string: "https://images.unsplash.com/photo-1545239350-55e4641c1fc5?auto=format&fit=crop&w=800&q=80")!
        ),
        .init(
            title: "Concurrency Deep Dive",
            author: "Quynh Ly",
            avatarURL: URL(string: "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?auto=format&fit=crop&w=200&q=80")!,
            thumbnailURL: URL(string: "https://images.unsplash.com/photo-1523475472560-d2df97ec485c?auto=format&fit=crop&w=800&q=80")!
        ),
        .init(
            title: "ARKit in Production",
            author: "Bao Ha",
            avatarURL: URL(string: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=200&q=80")!,
            thumbnailURL: URL(string: "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=800&q=80")!
        ),
        .init(
            title: "CI/CD for Swift Projects",
            author: "Son Truong",
            avatarURL: URL(string: "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=80")!,
            thumbnailURL: URL(string: "https://images.unsplash.com/photo-1517430816045-df4b7de11d1d?auto=format&fit=crop&w=800&q=80")!
        )
    ]

    private let columns = [
        GridItem(.flexible(), spacing: 16, alignment: .leading),
        GridItem(.flexible(), spacing: 16, alignment: .topLeading)
    ]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                Text("Videos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                    ForEach(videos) { video in
                        VideoCardView(video: video)
                    }
                }
                .padding()
            }
            .padding(.vertical)
        }
    }
}

private struct VideoCardView: View {
    let video: VideoItem

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VideoThumbnail(url: video.thumbnailURL)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

            Text(video.title)
                .font(.headline)
                .foregroundStyle(Color.primary)
                .lineLimit(2)

            HStack(spacing: 12) {
                AsyncImage(url: video.avatarURL) { phase in
                    switch phase {
                    case .empty:
                        Circle()
                            .fill(Color(.systemGray5))
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        Circle()
                            .fill(Color(.systemGray5))
                            .overlay(
                                Image(systemName: "person.fill")
                                    .foregroundStyle(.secondary)
                            )
                    @unknown default:
                        Circle()
                            .fill(Color(.systemGray5))
                    }
                }
                .frame(width: 36, height: 36)
                .clipShape(Circle())

                Text(video.author)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Spacer(minLength: 0)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct VideoThumbnail: View {
    let url: URL

    var body: some View {
        ZStack {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    Color(.systemGray5)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Color(.systemGray5)
                        .overlay(
                            Image(systemName: "photo")
                                .font(.title3)
                                .foregroundStyle(.secondary)
                        )
                @unknown default:
                    Color(.systemGray5)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 160)
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
