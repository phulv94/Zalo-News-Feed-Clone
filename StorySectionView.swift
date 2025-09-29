import SwiftUI

struct Story: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let avatar: String
    let thumbnail: String
}

struct StorySectionView: View {
    let stories: [Story]
    var onStoryTap: (Story) -> Void = { _ in }

    var body: some View {
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

struct StoryCell: View {
    let story: Story
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .bottomLeading) {
                Image(story.thumbnail)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [.black.opacity(0.6), .clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    )

                VStack(alignment: .leading, spacing: 8) {
                    Image(story.avatar)
                        .resizable()
                        .scaledToFill()
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

struct StorySectionView_Previews: PreviewProvider {
    static let demoStories: [Story] = [
        Story(name: "Zalo Official", avatar: "avatar1", thumbnail: "thumb1"),
        Story(name: "SwiftUI Lover", avatar: "avatar2", thumbnail: "thumb2"),
        Story(name: "iOS Dev", avatar: "avatar3", thumbnail: "thumb3"),
        Story(name: "Design Team", avatar: "avatar4", thumbnail: "thumb4")
    ]

    static var previews: some View {
        StorySectionView(stories: demoStories)
            .padding(.vertical)
            .previewLayout(.sizeThatFits)
            .background(Color(.systemBackground))
    }
}
