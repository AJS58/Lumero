import SwiftUI

struct ReportsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LumeroTheme.gradient.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Reports")
                            .font(.largeTitle.weight(.semibold))
                        ReportCard(title: "Device Health Report", score: 85, subtitle: "Dashboard, storage and battery summary")
                        ReportCard(title: "Photo Intelligence Report", score: 78, subtitle: "Duplicates, blur, screenshots and best shots")
                        ReportCard(title: "Storage Report", score: 82, subtitle: "What is taking space over time")
                        ReportCard(title: "Ageing Report", score: 79, subtitle: "Battery and usage trends")
                    }
                    .padding(18)
                }
            }
        }
    }
}

struct ReportCard: View {
    let title: String
    let score: Int
    let subtitle: String

    var body: some View {
        LumeroCard {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(title).font(.headline)
                    Text(subtitle).font(.footnote).foregroundStyle(LumeroTheme.textSecondary)
                    Text("PDF export planned for v0.5")
                        .font(.caption2.weight(.semibold))
                        .foregroundStyle(LumeroTheme.cyan)
                }
                Spacer()
                ZStack {
                    Circle().stroke(.white.opacity(0.12), lineWidth: 8)
                    Circle().trim(from: 0, to: CGFloat(score) / 100).stroke(LumeroTheme.green, style: StrokeStyle(lineWidth: 8, lineCap: .round)).rotationEffect(.degrees(-90))
                    Text("\(score)").font(.headline.bold())
                }
                .frame(width: 58, height: 58)
            }
        }
    }
}
