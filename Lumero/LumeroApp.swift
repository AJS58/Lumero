import SwiftUI

@main
struct LumeroApp: App {
    @StateObject private var scanner = PhotoLibraryScanner()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(scanner)
                .preferredColorScheme(.dark)
        }
    }
}
