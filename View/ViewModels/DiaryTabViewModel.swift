import Foundation

final class DiaryTabViewModel: ObservableObject {
    @Published var currentUserAvatarURL: URL?
    @Published var storyPlaceholder: String
    @Published var featuredStories: [Story]
    @Published var activities: [UserActivity]
    @Published var adsPost: AdsPost
    @Published var suggestedStories: [SuggestStory]

    init() {
        currentUserAvatarURL = URL(string: "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?w=200")
        storyPlaceholder = "What do you think"
        featuredStories = [
            Story(
                name: "Zalo Official",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=120&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1545239351-1141bd82e8a6?auto=format&fit=crop&w=400&q=80")!
            ),
            Story(
                name: "SwiftUI Lover",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=120&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=400&q=80")!
            ),
            Story(
                name: "iOS Dev",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=120&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=400&q=80")!
            ),
            Story(
                name: "Design Team",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1527980965255-d3b416303d12?auto=format&fit=crop&w=120&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=400&q=80")!
            )
        ]

        activities = [
            UserActivity(
                userName: "Linh Tran",
                userAvatarURL: URL(string: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=200"),
                activeCount: 4,
                posts: [
                    Post(
                        createdAt: "1 hour ago",
                        contentText: "Exploring SwiftUI layout techniques for our next release.",
                        imageURL: URL(string: "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200"),
                        videoThumbnailURL: nil,
                        linkPreview: nil,
                        hashtags: ["SwiftUI", "iOS"],
                        mentions: ["team.design"]
                    ),
                    Post(
                        createdAt: "Yesterday",
                        contentText: "New design tokens landed in our system today!",
                        imageURL: nil,
                        videoThumbnailURL: URL(string: "https://images.unsplash.com/photo-1489515217757-5fd1be406fef?w=1200"),
                        linkPreview: nil,
                        hashtags: ["Design"],
                        mentions: []
                    )
                ]
            ),
            UserActivity(
                userName: "Hoang Nguyen",
                userAvatarURL: URL(string: "https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?w=200"),
                activeCount: 3,
                posts: [
                    Post(
                        createdAt: "2 days ago",
                        contentText: "Check out this insightful article about async/await in Swift.",
                        imageURL: nil,
                        videoThumbnailURL: nil,
                        linkPreview: LinkPreview(
                            title: "Mastering Async/Await",
                            description: "A deep dive into structured concurrency in Swift.",
                            url: "https://example.com/articles/async-await",
                            imageURL: URL(string: "https://images.unsplash.com/photo-1556157382-97eda2d62296?w=800")
                        ),
                        hashtags: ["Swift", "Concurrency"],
                        mentions: ["swiftlang"]
                    )
                ]
            )
        ]

        adsPost = AdsPost(
            advertiserName: "Swift Academy",
            advertiserAvatarURL: URL(string: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200"),
            contentText: "Join our intensive SwiftUI bootcamp and ship beautiful apps faster.",
            imageURL: URL(string: "https://images.unsplash.com/photo-1521737604893-d14cc237f11d?w=1200"),
            actionTitle: "Learn More"
        )

        suggestedStories = [
            SuggestStory(thumbnail: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600"),
            SuggestStory(thumbnail: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=601"),
            SuggestStory(thumbnail: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=602"),
            SuggestStory(thumbnail: "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=603")
        ]
    }
}
