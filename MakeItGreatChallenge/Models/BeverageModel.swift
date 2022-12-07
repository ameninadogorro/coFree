//
//  BeverageModel.swift
//  MakeItGreatChallenge
//
//  Created by Luciana Adrião on 28/11/22.
//

import Foundation


//MARK: Options
struct Options: Codable {
    let beverages: [Beverage]
}

//MARK: Beverage
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
