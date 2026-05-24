import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            LumeroTheme.gradient.ignoresSafeArea()
            VStack(spacing: 24) {
                Spacer()
                ZStack {
                    Circle()
                        .stroke(LumeroTheme.blue.opacity(0.35), lineWidth: 16)
                        .frame(width: 170, height: 170)
                        .blur(radius: 2)
                    Circle()
                        .trim(from: 0.05, to: 0.88)
                        .stroke(AngularGradient(colors: [.blue, LumeroTheme.cyan, .blue], center: .center), style: StrokeStyle(lineWidth: 13, lineCap: .round))
                        .frame(width: 170, height: 170)
                        .rotationEffect(.degrees(-30))
                    Text("L")
                        .font(.system(size: 92, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .shadow(color: LumeroTheme.blue.opacity(0.7), radius: 18)
                }
                Text("Lumero")
                    .font(.system(size: 52, weight: .light, design: .rounded))
                Text("UNDERSTAND. OPTIMISE. PRESERVE.")
                    .font(.caption.weight(.semibold))
                    .tracking(3)
                    .foregroundStyle(LumeroTheme.cyan)
                HStack(spacing: 24) {
                    SplashFeature(icon: "photo", title: "Smart Photos")
                    SplashFeature(icon: "shield.checkered", title: "Device Health")
                    SplashFeature(icon: "chart.pie", title: "Storage Insights")
                }
                .padding(.top, 28)
                Spacer()
                Text("Your iPhone. Smarter. Cleaner. Safer.\nAll analysis happens on your device.")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(LumeroTheme.textSecondary)
                    .padding(.bottom, 36)
            }
            .padding(28)
        }
    }
}

struct SplashFeature: View {
    let icon: String
    let title: String
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(LumeroTheme.blue)
            Text(title)
                .font(.caption2.weight(.semibold))
                .multilineTextAlignment(.center)
                .foregroundStyle(.white.opacity(0.85))
        }
        .frame(width: 86)
    }
}
