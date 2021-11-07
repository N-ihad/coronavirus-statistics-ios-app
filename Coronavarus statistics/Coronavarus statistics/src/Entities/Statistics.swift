//
//  Statistics.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import Foundation

struct StatisticsResponse: Codable {

    let message: String
    let global: Global
    let countries: [Country]

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case global = "Global"
        case countries = "Countries"
    }
}

struct Country: Codable {

    let country, countryCode, slug: String
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int
    let newRecovered, totalRecovered: Int

    var titleFirstLetter: String {
        String(country[country.startIndex]).uppercased()
    }

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}

struct Global: Codable {

    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int
    let newRecovered, totalRecovered: Int

    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}
