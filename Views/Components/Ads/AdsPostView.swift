import SwiftUI

struct AdsPostView: View {
    let post: AdsPost
    var action: () -> Void = {}

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            content
            footer
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 10, x: 0, y: 4)
        )
    }

    private var header: some View {
        HStack(spacing: 12) {
        AsyncImage(url: post.advertiserAvatarURL, transaction: Transaction(animation: .easeInOut)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .empty:
                    ProgressView()
                        .tint(.secondary)
                case .failure:
                    Image(systemName: "briefcase.circle")
                        .resizable()
                        .scaledToFit()
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.secondary)
                @unknown default:
                    EmptyView()
                }
        }
        .frame(width: 48, height: 48)
        .background(Color.systemGray5)
        .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(post.advertiserName)
                    .font(.headline)
                    .foregroundStyle(Color.primary)

                Text("Sponsored")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
    }

    private var content: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let imageURL = post.imageURL {
                RemoteAdMediaView(url: imageURL, height: 220, cornerRadius: 16)
            }

            Text(post.contentText)
                .font(.body)
                .foregroundStyle(Color.primary)
        }
    }

    private var footer: some View {
        Button(action: action) {
            Text(post.actionTitle)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color.blue)
                )
        }
        .buttonStyle(.plain)
    }
}

private struct RemoteAdMediaView: View {
    let url: URL
    var height: CGFloat?
    var cornerRadius: CGFloat = 0

    var body: some View {
        AsyncImage(url: url, transaction: Transaction(animation: .easeInOut)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .empty:
                placeholderView(symbolName: "photo")
            case .failure:
                placeholderView(symbolName: "exclamationmark.triangle")
            @unknown default:
                placeholderView(symbolName: "photo")
            }
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .clipped()
    }

    @ViewBuilder
    private func placeholderView(symbolName: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(Color.systemGray6)

            Image(systemName: symbolName)
                .font(.title2)
                .foregroundStyle(.secondary)
        }
    }
}
