import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let userName: String
    let userAvatar: String
    let activeCount: Int
    let createdAt: String
    let contentText: String?
    let imageName: String?
    let videoThumbnail: String?
    let linkPreview: LinkPreview?
    let hashtags: [String]
    let mentions: [String]
}

struct LinkPreview: Hashable {
    let title: String
    let description: String
    let url: String
    let imageName: String
}

struct PostCell: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ActiveHeaderView(userName: post.userName, activeCount: post.activeCount)

            VStack(alignment: .leading, spacing: 12) {
                PostCellHeader(userName: post.userName, userAvatar: post.userAvatar, createdAt: post.createdAt)

                PostCellContent(post: post)

                PostCellFooter()
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.04), radius: 12, x: 0, y: 4)
            )
        }
        .padding(.horizontal)
    }
}

private struct ActiveHeaderView: View {
    let userName: String
    let activeCount: Int

    var body: some View {
        HStack {
            Text("\(userName) recently has \(activeCount) actives.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding(.horizontal, 4)
    }
}

private struct PostCellHeader: View {
    let userName: String
    let userAvatar: String
    let createdAt: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(userAvatar)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(userName)
                    .font(.headline)

                Text(createdAt)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .foregroundStyle(.secondary)
                    .padding(6)
            }
            .buttonStyle(.plain)
        }
    }
}

private struct PostCellContent: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let text = post.contentText, !text.isEmpty {
                contentText(text)
                    .font(.body)
                    .foregroundStyle(Color.primary)
            }

            if !post.hashtags.isEmpty {
                Text(post.hashtags.map { "#\($0)" }.joined(separator: " "))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.blue)
            }

            if !post.mentions.isEmpty {
                Text(post.mentions.map { "@\($0)" }.joined(separator: " "))
                    .font(.subheadline)
                    .foregroundStyle(Color.blue)
            }

            if let imageName = post.imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .clipped()
            }

            if let videoThumbnail = post.videoThumbnail {
                VideoThumbnailView(imageName: videoThumbnail)
            }

            if let linkPreview = post.linkPreview {
                LinkPreviewView(preview: linkPreview)
            }
        }
    }

    private func contentText(_ text: String) -> some View {
        Text(text)
    }
}

private struct VideoThumbnailView: View {
    let imageName: String

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 220)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .clipped()

            Circle()
                .fill(Color.black.opacity(0.6))
                .frame(width: 56, height: 56)
                .overlay(
                    Image(systemName: "play.fill")
                        .foregroundStyle(.white)
                        .font(.title2)
                )
        }
    }
}

private struct LinkPreviewView: View {
    let preview: LinkPreview

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(preview.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 160)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .clipped()

            VStack(alignment: .leading, spacing: 4) {
                Text(preview.title)
                    .font(.headline)
                    .foregroundStyle(Color.primary)

                Text(preview.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)

                Text(preview.url)
                    .font(.caption)
                    .foregroundStyle(Color.blue)
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(.systemGray6))
        )
    }
}

private struct PostCellFooter: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                HStack(spacing: 6) {
                    Image(systemName: "hand.thumbsup")
                    Text("Like")
                }
            }
            .buttonStyle(.plain)

            Spacer()

            Button(action: {}) {
                HStack(spacing: 6) {
                    Image(systemName: "bubble.right")
                    Text("Comment")
                }
            }
            .buttonStyle(.plain)
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
    }
}

struct PostCell_Previews: PreviewProvider {
    static let demoPost = Post(
        userName: "Linh Nguyen",
        userAvatar: "avatar1",
        activeCount: 4,
        createdAt: "5m ago",
        contentText: "Check out our latest design updates for the Zalo news feed clone!",
        imageName: "thumb2",
        videoThumbnail: "thumb3",
        linkPreview: LinkPreview(
            title: "SwiftUI Components",
            description: "Build reusable SwiftUI components that feel right at home on iOS.",
            url: "design.dev/swiftui-components",
            imageName: "thumb4"
        ),
        hashtags: ["SwiftUI", "iOSDev"],
        mentions: ["ZaloTeam", "DesignCrew"]
    )

    static var previews: some View {
        PostCell(post: demoPost)
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
            .background(Color(.systemGroupedBackground))
    }
}
