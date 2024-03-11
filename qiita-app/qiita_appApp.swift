import SwiftUI

@main
struct qiita_appApp: App {
    var body: some Scene {
        WindowGroup {
            ArticleListView(viewmodel: ArticleListViewModel())
        }
    }
}
