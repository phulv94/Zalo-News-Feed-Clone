import SwiftUI

struct SearchBarView: View {
    @State private var searchText: String = ""

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.white)

            ZStack(alignment: .leading) {
                if searchText.isEmpty {
                    Text("Search")
                        .foregroundStyle(.white.opacity(0.7))
                }

                TextField("", text: $searchText)
                    .textFieldStyle(.plain)
                    .textInputAutocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundStyle(.white.opacity(0.8))
            }

            Spacer(minLength: 0)

            Image(systemName: "square.and.pencil")
                .foregroundStyle(.white)

            Image(systemName: "bell")
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .padding(.horizontal)
    }
}
