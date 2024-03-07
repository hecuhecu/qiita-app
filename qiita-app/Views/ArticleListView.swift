import SwiftUI

struct ArticleListView: View {
    @ObservedObject var viewmodel = ArticleListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewmodel.articles) { article in
                NavigationLink(destination: 
                                ArticleDetailView(article: article)) {
                    ArticleRowView(article: article)
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewmodel.fetchArticles()
            }
        }
    }
}

#Preview {
    ArticleListView()
}
