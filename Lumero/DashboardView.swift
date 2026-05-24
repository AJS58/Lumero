import SwiftUI
import Photos

struct DashboardView: View {
    @EnvironmentObject private var scanner: PhotoLibraryScanner

    var body: some View {
        NavigationStack {
            ZStack {
                LumeroTheme.gradient.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        header
                        healthCard
                        scoreGrid
                        scanButton
                        insights
                    }
                    .padding(18)
                }
            }
            .navigationBarHidden(true)
            .task { await scanner.scanLibrary() }
        }
    }

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Lumero")
                    .font(.largeTitle.weight(.semibold))
                Text("Understand. Optimise. Preserve.")
                    .font(.subheadline)
                    .foregroundStyle(LumeroTheme.cyan)
            }
            Spacer()
            Image(systemName: "gearshape.fill")
                .font(.title3)
                .foregroundStyle(.white.opacity(0.8))
        }
    }

    private var healthCard: some View {
        LumeroCard {
            HStack(spacing: 18) {
                Gauge(value: 85, in: 0...100) {
                    Text("Health")
                } currentValueLabel: {
                    Text("85")
                        .font(.title.bold())
                }
                .gaugeStyle(.accessoryCircularCapacity)
                .tint(LumeroTheme.green)
                .scaleEffect(1.8)
                .frame(width: 132, height: 132)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Overall Health Score")
                        .font(.headline)
                    Text("85/100")
                        .font(.system(size: 38, weight: .bold))
                    Text("Your iPhone is in good shape. Keep it up.")
                        .font(.footnote)
                        .foregroundStyle(LumeroTheme.textSecondary)
                }
            }
        }
    }

    private var scoreGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            StatCard(title: "Photos", value: "\(scanner.totalAssets)", subtitle: "Assets found", icon: "photo.fill", tint: LumeroTheme.blue)
            StatCard(title: "Screenshots", value: "\(scanner.screenshotCount)", subtitle: "Review suggested", icon: "camera.viewfinder", tint: LumeroTheme.amber)
            StatCard(title: "Videos", value: "\(scanner.videoCount)", subtitle: "Potential large files", icon: "video.fill", tint: LumeroTheme.cyan)
            StatCard(title: "Recoverable", value: String(format: "%.1f GB", scanner.estimatedRecoverableGB), subtitle: "Estimated", icon: "bolt.fill", tint: LumeroTheme.green)
        }
    }

    private var scanButton: some View {
        Button {
            Task { await scanner.requestAccessAndScan() }
        } label: {
            HStack {
                if scanner.isScanning { ProgressView().tint(.white) }
                Text(scanner.status == .authorized || scanner.status == .limited ? "Smart Scan" : "Allow Photo Access")
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(LinearGradient(colors: [LumeroTheme.blue, .blue], startPoint: .leading, endPoint: .trailing))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
    }

    private var insights: some View {
        LumeroCard {
            VStack(alignment: .leading, spacing: 10) {
                Text("Today’s Insight")
                    .font(.headline)
                Text("Lumero v0.1 is reading your Photos library totals and preparing the structure for duplicate, blur and best-shot analysis in later versions.")
                    .font(.subheadline)
                    .foregroundStyle(LumeroTheme.textSecondary)
            }
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let subtitle: String
    let icon: String
    let tint: Color

    var body: some View {
        LumeroCard {
            VStack(alignment: .leading, spacing: 10) {
                Image(systemName: icon)
                    .foregroundStyle(tint)
                Text(title)
                    .font(.caption)
                    .foregroundStyle(LumeroTheme.textSecondary)
                Text(value)
                    .font(.title2.bold())
                Text(subtitle)
                    .font(.caption2)
                    .foregroundStyle(LumeroTheme.textSecondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
