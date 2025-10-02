import SwiftUI

struct Main: View {
    var body: some View {
        TabView {
            CreateMyStoryView(avatarImage: "avatar1")
                .tabItem {
                    Label("Story", systemImage: "book.fill")
                }

            VideoTabView()
                .tabItem {
                    Label("Video", systemImage: "play.rectangle.fill")
                }
        }
    }
}

#Preview {
    Main()
}
