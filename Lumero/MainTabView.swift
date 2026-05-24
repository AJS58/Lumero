import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem { Label("Dashboard", systemImage: "house.fill") }
            PhotosView()
                .tabItem { Label("Photos", systemImage: "photo.on.rectangle.angled") }
            ReportsView()
                .tabItem { Label("Reports", systemImage: "doc.text.fill") }
            ToolsView()
                .tabItem { Label("Tools", systemImage: "bolt.fill") }
            MoreView()
                .tabItem { Label("More", systemImage: "ellipsis.circle.fill") }
        }
        .tint(LumeroTheme.blue)
    }
}
