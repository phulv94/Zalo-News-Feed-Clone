import Foundation

final class DiaryTabViewModel: ObservableObject {
    @Published var currentUserAvatarURL: URL?
    @Published var storyPlaceholder: String
    @Published var featuredStories: [Story]
    @Published var activities: [UserActivity]
    @Published var adsPost: AdsPost
    @Published var suggestedStories: [SuggestStory]

    private let dataManager: FeedDataManager

    init(dataManager: FeedDataManager = .shared) {
        self.dataManager = dataManager
        loadData()
    }

    private func loadData() {
        currentUserAvatarURL = dataManager.currentUserAvatarURL
        storyPlaceholder = dataManager.storyPlaceholder
        featuredStories = dataManager.featuredStories
        activities = dataManager.activities
        adsPost = dataManager.adsPost
        suggestedStories = dataManager.suggestedStories
    }
}
