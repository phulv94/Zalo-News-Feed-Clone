import Foundation

final class VideoTabViewModel: ObservableObject {
    @Published var videos: [VideoItem]

    init() {
        videos = [
            VideoItem(
                title: "Design Trends 2024",
                author: "Mai Nguyen",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=200&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?auto=format&fit=crop&w=800&q=80")!
            ),
            VideoItem(
                title: "SwiftUI Animations",
                author: "Tran Le",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=200&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1556157382-97eda2d62296?auto=format&fit=crop&w=800&q=80")!
            ),
            VideoItem(
                title: "Combine in Practice",
                author: "Anh Pham",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?auto=format&fit=crop&w=200&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&w=800&q=80")!
            ),
            VideoItem(
                title: "Modern iOS Architecture",
                author: "Linh Tran",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1545239351-1141bd82e8a6?auto=format&fit=crop&w=800&q=80")!
            ),
            VideoItem(
                title: "Debugging Tips",
                author: "Khoa Vo",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1517430816045-df4b7de11d1d?auto=format&fit=crop&w=800&q=80")!
            ),
            VideoItem(
                title: "Design Systems",
                author: "My Dang",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=200&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=800&q=80")!
            ),
            VideoItem(
                title: "Mastering AsyncImage",
                author: "Tu Nguyen",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=200&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80")!
            ),
            VideoItem(
                title: "WidgetKit Essentials",
                author: "Dat Bui",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1545239351-1141bd82e8a6?auto=format&fit=crop&w=200&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1545239350-55e4641c1fc5?auto=format&fit=crop&w=800&q=80")!
            ),
            VideoItem(
                title: "Concurrency Deep Dive",
                author: "Quynh Ly",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?auto=format&fit=crop&w=200&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1523475472560-d2df97ec485c?auto=format&fit=crop&w=800&q=80")!
            ),
            VideoItem(
                title: "ARKit in Production",
                author: "Bao Ha",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=200&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=800&q=80")!
            ),
            VideoItem(
                title: "CI/CD for Swift Projects",
                author: "Son Truong",
                avatarURL: URL(string: "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=80")!,
                thumbnailURL: URL(string: "https://images.unsplash.com/photo-1517430816045-df4b7de11d1d?auto=format&fit=crop&w=800&q=80")!
            )
        ]
    }
}
