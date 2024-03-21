import SwiftUI
import SwiftfulRouting

struct HomeView: View {
    var router: AnyRouter
    
    var body: some View {
        Text("S")
    }
}

#Preview {
    RouterView { router in
        HomeView(router: router)
    }
}
