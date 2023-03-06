import Foundation

class CollectionViewModel {
    var bevs: [Beverage] = []

    func readLocalFile(name: String) -> Data? {
        do {
            guard let filePath = Bundle.main.path(forResource: name, ofType: "json") else { return nil }
            let jsonData = try String(contentsOfFile: filePath).data(using: .utf8)
            return jsonData

        } catch {
            print(error)
        }
        return nil
    }

    func parseJSON(jsonData: Data) -> Options?  {
        do {
            let decodedData = try JSONDecoder().decode(Options.self, from: jsonData)
            return decodedData

        } catch {
            print(error)
        }
        return nil
    }

    func loadJson(fromURLString urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }

                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }

    func beverages() -> [Beverage] {
        if bevs.isEmpty, let localData = readLocalFile(name: "beverage"), let options = parseJSON(jsonData: localData) {
            bevs = options.beverages
            return options.beverages
        } else {
            return bevs
        }
    }
}
