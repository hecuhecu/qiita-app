import Foundation

final class APIService {
    
    public static let shared = APIService()
    private let baseURLString = "https://qiita.com/api/v2/items?"
    
    public func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        let totalURLString = baseURLString + "per_page=100"
        let url = URL(string:  totalURLString)
        guard let url = url else { return }
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                completion(.failure(error))
            }

            guard let data = data else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let fetchedArticles = try decoder.decode([Article].self, from: data)
                completion(.success(fetchedArticles))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
