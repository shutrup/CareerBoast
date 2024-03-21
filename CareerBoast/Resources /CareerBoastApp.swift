import SwiftUI
import SwiftfulRouting

@main
struct CareerBoastApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { router in
                HomeView(router: router)
            }
        }
    }
}
