import SwiftUI

struct StorySectionView: View {
    let stories: [Story]
    var onStoryTap: (Story) -> Void = { _ in }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Stories")
                .font(.headline)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(stories) { story in
                        StoryCell(story: story) {
                            onStoryTap(story)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

private struct StoryCell: View {
    let story: Story
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: story.thumbnailURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                    } else if phase.error != nil {
                        Color.gray.opacity(0.3)
                    } else {
                        Color.gray.opacity(0.1)
                    }
                }
                .frame(width: 110, height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.6), .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                )

                VStack(alignment: .leading, spacing: 8) {
                    AsyncImage(url: story.avatarURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                        } else if phase.error != nil {
                            Color.gray.opacity(0.3)
                        } else {
                            Color.gray.opacity(0.1)
                        }
                    }
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 3)
                    )

                    Text(story.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .lineLimit(2)
                        .shadow(radius: 6)
                }
                .padding(12)
            }
        }
        .buttonStyle(.plain)
    }
}
