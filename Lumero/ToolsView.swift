import SwiftUI

struct ToolsView: View {
    @EnvironmentObject private var scanner: PhotoLibraryScanner

    var body: some View {
        NavigationStack {
            ZStack {
                LumeroTheme.gradient.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Tools")
                            .font(.largeTitle.weight(.semibold))
                        LumeroCard {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Image(systemName: "bolt.circle.fill").font(.largeTitle).foregroundStyle(LumeroTheme.blue)
                                    VStack(alignment: .leading) {
                                        Text("Emergency Space Recovery").font(.headline)
                                        Text("One tap. Big impact.").foregroundStyle(LumeroTheme.textSecondary)
                                    }
                                }
                                Text(String(format: "%.1f GB can potentially be reviewed", scanner.estimatedRecoverableGB))
                                    .font(.title3.bold())
                                Button("Scan Now") { Task { await scanner.requestAccessAndScan() } }
                                    .buttonStyle(.borderedProminent)
                                    .tint(LumeroTheme.blue)
                            }
                        }
                        FeatureRow(title: "Large Videos", subtitle: "Find space-heavy videos", icon: "video.fill", value: "v0.2")
                        FeatureRow(title: "Compress Videos", subtitle: "Reduce storage safely", icon: "arrow.down.circle.fill", value: "Later")
                        FeatureRow(title: "Archive Suggestions", subtitle: "Move old items before deleting", icon: "archivebox.fill", value: "Later")
                    }
                    .padding(18)
                }
            }
        }
    }
}
