import Foundation

final class APIService {
    
    public static let shared = APIService()
    private let baseURLString = "https://qiita.com/api/v2/items?"
    
    public func fetchArticles() async throws -> [Article] {
        let totalURLString = baseURLString + "per_page=100"
        let url = URL(string:  totalURLString)
        guard let url = url else { return [] }
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let fetchedArticles = try decoder.decode([Article].self, from: data)
        return fetchedArticles
    }
}
