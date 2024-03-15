import Foundation
import Alamofire

final class APIService {
    
    public static let shared = APIService()
    
    public func fetchArticles() async throws -> [Article] {
        let baseUrlString = "https://qiita.com/api/v2/items?"
        let searchPath = "per_page=100"
        let urlString = baseUrlString + searchPath
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dataTask = AF.request(urlString).serializingDecodable([Article].self, decoder: decoder)
        let value = try await dataTask.value
        return value
    }
}
