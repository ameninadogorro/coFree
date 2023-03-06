import Foundation

struct Options: Codable {
    let beverages: [Beverage]
}

struct Beverage: Codable {
    let name, image: String
    let caffeineLevel: Int
    let mililiters: Int

    var caffeineIngested: Int = 0

    enum CodingKeys: CodingKey {
        case name
        case image
        case caffeineLevel
        case mililiters
    }
}
