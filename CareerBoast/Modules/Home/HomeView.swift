import SwiftUI
import SwiftfulRouting

struct HomeView: View {
    var router: AnyRouter
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RouterView { router in
        HomeView(router: router)
    }
}
