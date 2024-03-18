import SwiftUI

struct ArticleListView: View {
    @EnvironmentObject var viewmodel: ArticleListViewModel
    @State var isInitialOnAppear = true
    
    var body: some View {
        Group {
            switch viewmodel.dataState {
            case .idle, .loading:
                ProgressView()
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
                    Task {
                        await viewmodel.fetchArticles()
                    }
                }
            }
        }
        .onAppear() {
            if isInitialOnAppear {
                Task {
                    await viewmodel.fetchArticles()
                }
                
                isInitialOnAppear = false
            }
        }
    }
}

#Preview {
    ArticleListView()
        .environmentObject(ArticleListViewModel())
}
