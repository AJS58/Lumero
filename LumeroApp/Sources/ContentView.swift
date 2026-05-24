import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView().tabItem { Label("Dashboard", systemImage: "house.fill") }
            PhotosView().tabItem { Label("Photos", systemImage: "photo.on.rectangle") }
            ReportsView().tabItem { Label("Reports", systemImage: "doc.text.fill") }
            ToolsView().tabItem { Label("Tools", systemImage: "bolt.fill") }
            MoreView().tabItem { Label("More", systemImage: "ellipsis.circle") }
        }.tint(.blue)
    }
}

struct Card<Content: View>: View { let content: Content; init(@ViewBuilder content: () -> Content){ self.content = content() }
    var body: some View { content.padding().background(Color(red:0.04, green:0.09, blue:0.16)).clipShape(RoundedRectangle(cornerRadius: 22)) }
}
struct DashboardView: View { var body: some View { NavigationStack { ScrollView { VStack(spacing:16){ Image("LumeroLogo").resizable().scaledToFit().frame(height:70); Card{ Text("Overall Health Score").foregroundStyle(.secondary); Text("85/100").font(.largeTitle).bold(); Text("Your iPhone is in great shape.") }; Card{ Text("Smart Scan").font(.title2).bold(); Text("Photo access and scanning engine ready for v0.2.") } }.padding() }.background(Color.black).navigationTitle("Dashboard") } } }
struct PhotosView: View { var body: some View { NavigationStack { List { Text("Best Shot Intelligence"); Text("Similar / Duplicate Photos"); Text("Blurry Photos"); Text("Screenshots") }.navigationTitle("Photos") } } }
struct ReportsView: View { var body: some View { NavigationStack { List { Text("Device Health Report"); Text("Photo Intelligence Report"); Text("Storage Report"); Text("Ageing Report") }.navigationTitle("Reports") } } }
struct ToolsView: View { var body: some View { NavigationStack { List { Text("Emergency Space Recovery"); Text("Large Video Finder"); Text("Archive Suggestions") }.navigationTitle("Tools") } } }
struct MoreView: View { var body: some View { NavigationStack { List { Text("Privacy First"); Text("Scan Preferences"); Text("About Lumero v0.1") }.navigationTitle("More") } } }
