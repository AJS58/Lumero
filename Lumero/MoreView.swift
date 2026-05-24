import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LumeroTheme.gradient.ignoresSafeArea()
                List {
                    Section("Settings") {
                        Label("Scan Preferences", systemImage: "magnifyingglass")
                        Label("Privacy", systemImage: "lock.shield")
                        Label("Notifications", systemImage: "bell")
                    }
                    Section("Account") {
                        Label("Lumero Premium", systemImage: "sparkles")
                        Label("Family Sharing", systemImage: "person.2")
                    }
                    Section("Support") {
                        Label("Help Centre", systemImage: "questionmark.circle")
                        Label("Send Feedback", systemImage: "paperplane")
                        Label("About Lumero v0.1", systemImage: "info.circle")
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("More")
        }
    }
}
