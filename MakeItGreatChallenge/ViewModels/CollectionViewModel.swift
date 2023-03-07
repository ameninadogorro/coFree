import Foundation

class CollectionViewModel {
    var bevs: [Beverage] = []
    var drunks: [Beverage] = []

    var consume: ConsumoDia?

    func beverages() -> [Beverage] {
        if let localData = readLocalFile(name: "beverage"), let options = parseJSON(jsonData: localData) {
            self.bevs = options.beverages
            return bevs
        } else {
            return bevs
        }
    }

    func readLocalFile(name: String) -> Data? {
        do {
            print("doing read")
            guard let filePath = Bundle.main.path(forResource: name, ofType: "json") else { return nil }
            let jsonData = try String(contentsOfFile: filePath).data(using: .utf8)
            return jsonData

        } catch {
            print(error)
        }
        return nil
    }

    func parseJSON(jsonData: Data) -> Options?  {
        print("doin parse")
        do {
            let decodedData = try JSONDecoder().decode(Options.self, from: jsonData)
            return decodedData

        } catch {
            print(error)
        }
        return nil
    }

    func caffeineSum() -> Int {
        var value = 0
        for index in drunks {
            value += index.caffeineLevel
        }
        return value
    }

    func quantitySum(_ beverage: inout Beverage) {
        beverage.quantity += 1
    }

    func quantityDec(_ beverage: inout Beverage) {
        beverage.quantity -= 1
    }
}
