import SwiftUI
import Presentation

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: setAppareance)
        }
    }
}

private extension MoviesApp {
    func setAppareance() {
        let attrs = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]
        UINavigationBar.appearance().largeTitleTextAttributes = attrs
    }
}
