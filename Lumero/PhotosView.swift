import SwiftUI

struct PhotosView: View {
    @EnvironmentObject private var scanner: PhotoLibraryScanner

    var body: some View {
        NavigationStack {
            ZStack {
                LumeroTheme.gradient.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Photos")
                            .font(.largeTitle.weight(.semibold))
                        Text("AI photo intelligence will live here. v0.1 includes the screen structure and live library totals.")
                            .foregroundStyle(LumeroTheme.textSecondary)

                        FeatureRow(title: "Best Shot Intelligence", subtitle: "Coming in v0.4 — compare sharpness, blur and exposure.", icon: "sparkles", value: "Planned")
                        FeatureRow(title: "Similar / Duplicate Photos", subtitle: "Coming in v0.2 — group visually similar images.", icon: "rectangle.stack.fill", value: "Next")
                        FeatureRow(title: "Blurry Photos", subtitle: "Coming in v0.3 — score images for focus and motion blur.", icon: "exclamationmark.triangle.fill", value: "Planned")
                        FeatureRow(title: "Screenshots", subtitle: "Currently detected from your library.", icon: "camera.viewfinder", value: "\(scanner.screenshotCount)")
                    }
                    .padding(18)
                }
            }
        }
    }
}

struct FeatureRow: View {
    let title: String
    let subtitle: String
    let icon: String
    let value: String

    var body: some View {
        LumeroCard {
            HStack(spacing: 14) {
                Image(systemName: icon)
                    .font(.title2)
                    .frame(width: 42, height: 42)
                    .background(LumeroTheme.blue.opacity(0.18))
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .foregroundStyle(LumeroTheme.blue)
                VStack(alignment: .leading, spacing: 4) {
                    Text(title).font(.headline)
                    Text(subtitle).font(.footnote).foregroundStyle(LumeroTheme.textSecondary)
                }
                Spacer()
                Text(value)
                    .font(.caption.weight(.bold))
                    .foregroundStyle(LumeroTheme.cyan)
            }
        }
    }
}
