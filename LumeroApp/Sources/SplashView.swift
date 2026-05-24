import SwiftUI

struct SplashView: View {
    @State private var showMain = false
    var body: some View {
        Group {
            if showMain { ContentView() } else {
                ZStack {
                    LinearGradient(colors: [Color(red:0.02, green:0.05, blue:0.12), Color.black], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    VStack(spacing: 20) {
                        Image("LaunchLogo").resizable().scaledToFit().frame(width: 190, height: 190)
                        Text("Lumero").font(.system(size: 56, weight: .light)).foregroundStyle(.white)
                        Text("UNDERSTAND.  OPTIMISE.  PRESERVE.").font(.caption).foregroundStyle(.blue)
                    }
                }.onAppear { DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { showMain = true } }
            }
        }
    }
}
