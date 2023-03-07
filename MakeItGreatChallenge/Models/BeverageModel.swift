import Foundation

struct Options: Codable {
    let beverages: [Beverage]
}

struct Beverage: Codable, Equatable {
    var name, image: String
    var caffeineLevel: Int
    var mililiters: Int
    var quantity: Int

    var caffeineIngested: Int = 0

    enum CodingKeys: CodingKey {
        case name
        case image
        case caffeineLevel
        case mililiters
        case quantity
    }
}
