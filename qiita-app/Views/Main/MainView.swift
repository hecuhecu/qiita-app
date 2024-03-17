import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewmodel: ArticleListViewModel

    var body: some View {
        TabView {
            ArticleListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ArticleListViewModel())
}
