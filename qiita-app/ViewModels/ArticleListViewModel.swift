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

@MainActor
class ArticleListViewModel: ObservableObject {
    @Published var dataState: DataState = .idle

    func fetchArticles() async {
        if dataState.isLoading { return }
        dataState = .loading
        
        do {
            dataState = .loaded(.success(try await APIService.shared.fetchArticles()))
        } catch {
            dataState = .loaded(.failure(error))
        }
    }
}
