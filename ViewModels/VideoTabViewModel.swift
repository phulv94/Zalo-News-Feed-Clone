import Foundation

final class VideoTabViewModel: ObservableObject {
    @Published var videos: [VideoItem]

    private let dataManager: FeedDataManager

    init(dataManager: FeedDataManager = .shared) {
        self.dataManager = dataManager
        loadVideos()
    }

    private func loadVideos() {
        videos = dataManager.videoItems
    }
}
