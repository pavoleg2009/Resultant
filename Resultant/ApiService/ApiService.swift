import Foundation

typealias FetchCompletion = (ResponseModel) -> Void

protocol ApiService {
    func fetchRates(completion: FetchCompletion?)
}

final class ApiServiceImpl: ApiService {
    
    static let apiURLString = "http://phisix-api3.appspot.com/stocks.json"
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchRates(completion: FetchCompletion?) {
        
        guard let apiUrl = URL(string: ApiServiceImpl.apiURLString) else {
            print("Could not create URL from string: \(ApiServiceImpl.apiURLString)")
            return
        }
        
        let dataTask = session.dataTask(with: apiUrl) { (data, response, error) in
            
            if let error = error,
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 {
                print("==== Error: Could not fetch data from API: \(error.localizedDescription)")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let responseModel = try jsonDecoder.decode(ResponseModel.self, from: data!)
                print("=== JSON Parsed successfully. Objects count:\(responseModel.stock?.count ?? 0)")
                DispatchQueue.main.async {
                    completion?(responseModel)
                }
                
            } catch {
                print("==== Error: Could not parse JSON: \(error.localizedDescription)")
            }
            
        }
        dataTask.resume()
    }
}
