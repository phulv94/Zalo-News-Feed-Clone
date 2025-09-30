import SwiftUI

struct CreateMyStoryView: View {
    var avatarImage: String
    var placeholder: String = "What do you think"
    var onImagesTap: () -> Void = {}
    var onVideoTap: () -> Void = {}
    var onAlbumTap: () -> Void = {}

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                Image(avatarImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())

                Text(placeholder)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color(.systemGray6))
                    )
            }

            Divider()

            HStack {
                CreateStoryActionButton(
                    title: "Images",
                    systemImage: "photo.on.rectangle",
                    tint: .blue,
                    action: onImagesTap
                )

                Spacer(minLength: 0)

                CreateStoryActionButton(
                    title: "Video",
                    systemImage: "video.fill",
                    tint: .red,
                    action: onVideoTap
                )

                Spacer(minLength: 0)

                CreateStoryActionButton(
                    title: "Album",
                    systemImage: "square.stack",
                    tint: .green,
                    action: onAlbumTap
                )
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.04), radius: 12, x: 0, y: 4)
        )
        .padding(.horizontal)
    }
}

private struct CreateStoryActionButton: View {
    let title: String
    let systemImage: String
    let tint: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: systemImage)
                Text(title)
            }
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundStyle(tint)
        }
        .frame(maxWidth: .infinity)
        .buttonStyle(.plain)
    }
}

struct CreateMyStoryView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMyStoryView(avatarImage: "avatar1")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color(.systemGroupedBackground))
    }
}
