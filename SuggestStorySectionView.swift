import SwiftUI

struct SuggestStory: Identifiable, Hashable {
    let id = UUID()
    let thumbnail: String
}

struct SuggestStorySectionView: View {
    let stories: [SuggestStory]
    var onStoryTap: (SuggestStory) -> Void = { _ in }
    var onHeaderAction: () -> Void = {}

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(stories) { story in
                        SuggestStoryCell(story: story) {
                            onStoryTap(story)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical, 8)
    }

    private var header: some View {
        HStack(spacing: 12) {
            Image(systemName: "play.rectangle.fill")
                .font(.title3)
                .foregroundStyle(.blue)
                .frame(width: 36, height: 36)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color.blue.opacity(0.12))
                )

            Text("Suggest Video")
                .font(.headline)
                .foregroundStyle(Color.primary)

            Spacer(minLength: 0)

            Button(action: onHeaderAction) {
                HStack(spacing: 4) {
                    Text("See all")
                    Image(systemName: "chevron.right")
                        .font(.footnote)
                }
                .font(.subheadline)
                .foregroundStyle(.blue)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
    }
}

struct SuggestStoryCell: View {
    let story: SuggestStory
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Image(story.thumbnail)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.12), radius: 8, x: 0, y: 6)
        }
        .buttonStyle(.plain)
    }
}

struct SuggestStorySectionView_Previews: PreviewProvider {
    static let sampleStories: [SuggestStory] = [
        SuggestStory(thumbnail: "thumb1"),
        SuggestStory(thumbnail: "thumb2"),
        SuggestStory(thumbnail: "thumb3"),
        SuggestStory(thumbnail: "thumb4"),
        SuggestStory(thumbnail: "thumb5")
    ]

    static var previews: some View {
        SuggestStorySectionView(stories: sampleStories)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
