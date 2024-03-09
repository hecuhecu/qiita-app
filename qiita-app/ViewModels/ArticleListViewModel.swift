import Foundation

enum DataState {
    case idle
    case loading
    case loaded(Result<[Article], Error>)
    
    var isLoading: Bool {
        if case .loading = self {
            return true
        }
        
        return false
    }
}

class ArticleListViewModel: ObservableObject {
    @Published var dataState: DataState = .idle

    func fetchArticles() {
        if dataState.isLoading { return }
        dataState = .loading
        
        APIService.shared.fetchArticles { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let fetchedArticles):
                    self.dataState = .loaded(.success(fetchedArticles))
                case .failure(let error):
                    self.dataState = .loaded(.failure(error))
                }
            }
        }
    }
}
