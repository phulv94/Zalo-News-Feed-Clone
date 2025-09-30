import SwiftUI

struct HeaderTabsView: View {
    private enum Tab: String, CaseIterable, Identifiable {
        case story = "Story"
        case video = "Video"

        var id: String { rawValue }
    }

    @State private var selectedTab: Tab = .story

    private let stories: [Story] = [
        Story(name: "Zalo Official", avatar: "avatar1", thumbnail: "thumb1"),
        Story(name: "SwiftUI Lover", avatar: "avatar2", thumbnail: "thumb2"),
        Story(name: "iOS Dev", avatar: "avatar3", thumbnail: "thumb3"),
        Story(name: "Design Team", avatar: "avatar4", thumbnail: "thumb4")
    ]

    var body: some View {
        VStack(spacing: 16) {
            header

            switch selectedTab {
            case .story:
                StorySectionView(stories: stories)
            case .video:
                VideoTabView()
            }
        }
        .animation(.easeInOut, value: selectedTab)
        .padding(.top, 16)
    }

    private var header: some View {
        HStack(spacing: 24) {
            ForEach(Tab.allCases) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    Text(tab.rawValue)
                        .font(.headline)
                        .foregroundStyle(tab == selectedTab ? .primary : .secondary)
                        .underline(tab == selectedTab, color: .primary)
                }
                .buttonStyle(.plain)
            }

            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    HeaderTabsView()
        .background(Color(.systemGroupedBackground))
}
