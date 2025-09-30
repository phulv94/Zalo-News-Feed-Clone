import SwiftUI

struct HeaderTabsView: View {
    private enum Tab: String, CaseIterable, Identifiable {
        case diary = "Diary"
        case video = "Video"

        var id: String { rawValue }
    }

    @State private var selectedTab: Tab = .diary

    var body: some View {
        VStack(spacing: 16) {
            header
            switch selectedTab {
            case .diary:
                DiaryTabView()
            case .video:
                VideoTabView()
            }
        }
        .animation(.easeInOut, value: selectedTab)
        .padding(.top,0)
    }

    private var header: some View {
        HStack(spacing: 0) {
                    ForEach(Tab.allCases) { tab in
                        Button {
                            selectedTab = tab
                        } label: {
                            Text(tab.rawValue)
                                .font(.headline)
                                .foregroundStyle(tab == selectedTab ? .primary : .secondary)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .overlay(alignment: .bottom) {
                                    Rectangle()
                                        .fill(tab == selectedTab ? Color.primary : Color.clear)
                                        .frame(height: 2)
                                }
                        }
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.plain)
                    }
                }
                .frame(maxWidth: .infinity)
    }
}

struct HeaderTabsView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTabsView()
    }
}
