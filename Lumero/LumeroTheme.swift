import SwiftUI

enum LumeroTheme {
    static let background = Color(red: 0.015, green: 0.035, blue: 0.070)
    static let card = Color(red: 0.035, green: 0.075, blue: 0.130)
    static let card2 = Color(red: 0.025, green: 0.055, blue: 0.105)
    static let blue = Color(red: 0.070, green: 0.420, blue: 1.000)
    static let cyan = Color(red: 0.160, green: 0.800, blue: 1.000)
    static let green = Color(red: 0.350, green: 0.900, blue: 0.420)
    static let amber = Color(red: 1.000, green: 0.720, blue: 0.180)
    static let textSecondary = Color.white.opacity(0.70)

    static let gradient = LinearGradient(
        colors: [background, Color(red: 0.000, green: 0.090, blue: 0.180)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct LumeroCard<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) { self.content = content() }

    var body: some View {
        content
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(LumeroTheme.card.opacity(0.92))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .stroke(Color.white.opacity(0.08), lineWidth: 1)
                    )
            )
    }
}
