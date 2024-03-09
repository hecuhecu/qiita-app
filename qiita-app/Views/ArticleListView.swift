import SwiftUI

struct ArticleListView: View {
    @ObservedObject var viewmodel = ArticleListViewModel()
    
    var body: some View {
        Group {
            switch viewmodel.dataState {
            case .idle, .loading:
                EmptyView()
            case .loaded(.success(let articles)):
                NavigationStack {
                    List(articles) { article in
                        NavigationLink(destination:
                                        ArticleDetailView(article: article)) {
                            ArticleRowView(article: article)
                        }
                    }
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                }
            case .loaded(.failure):
                ErrorStateView {
                    viewmodel.fetchArticles()
                }
            }
        }
        .overlay {
            if viewmodel.dataState.isLoading {
                ProgressView()
            }
        }
        .onAppear {
            viewmodel.fetchArticles()
        }
    }
}

#Preview {
    ArticleListView()
}
