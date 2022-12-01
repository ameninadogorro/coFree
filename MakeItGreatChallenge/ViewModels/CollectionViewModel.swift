//
//  CollectionViewModel.swift
//  MakeItGreatChallenge
//
//  Created by Luciana Adrião on 29/11/22.
//

import Foundation

class CollectionViewModel {

    // MARK: FOR LOCAL JSON
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

    // MARK: FOR HOSTED JSON
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
        if let localData = readLocalFile(name: "beverage") {
            if let options = parseJSON(jsonData: localData){
                return options.beverages
            }
        }
        return []
    }
}
