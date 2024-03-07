import Foundation

class ArticleListViewModel: ObservableObject {
    @Published var articles: [Article] = []

    func fetchArticles() {
        APIService.shared.fetchArticles { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let fetchedArticles):
                    self.articles = fetchedArticles
                case .failure(let error):
                    print("error: \(error.localizedDescription)")
                }
            }
        }
    }
}
