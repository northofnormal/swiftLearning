//
//  HTTP.swift
//  SwitfLearnings
//
//  Created by Anne Cahalan on 8/25/24.
//

import Foundation

struct API {
    static let shared = API()

    let urlString = "https://api.openweathermap.org/data/3.0/onecall"
    let urlParams = "?lat=33.44&lon=-94.04&exclude=hourly,daily&appid=018b75dfb550180a719e8889eb7617a8"

    public func fetchWeather() async throws -> Weather? {
        guard let url = URL(string: urlString + urlParams) else {
            print("String -> URL conversion error")
            return nil
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let weather = try decoder.decode(Weather.self, from: data)
        print(weather)
        return weather
    }
}
