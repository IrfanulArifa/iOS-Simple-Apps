//
//  NetworkService.swift
//  Portal Game
//
//  Created by Irfanul Arifa on 11/05/23.
//

import Foundation

class NetworkService {
  func getMovies() async throws -> [Game] {
    let components = URLComponents(string: "https://rawg-mirror.vercel.app/api/games")!
    //      components.queryItems = [
    //          URLQueryItem(name: "api_key", value: apiKey),
    //          URLQueryItem(name: "language", value: language),
    //          URLQueryItem(name: "page", value: page)
    //      ]
    let request = URLRequest(url: components.url!)
    let (data, response) = try await URLSession.shared.data(for: request)
    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
      fatalError("Error: Can't fetching data.")
    }
    let decoder = JSONDecoder()
    let result = try decoder.decode(Welcome.self, from: data)
    return movieMapper(input: result.results)
  }
}
extension NetworkService {
  fileprivate func movieMapper( input movieResponses: [Result]) -> [Game] {
    return movieResponses.map { result in
      return Game(
        id : result.id,
        slug : result.slug,
        name : result.name,
        released : result.released,
        backgroundImage : result.backgroundImage,
        rating : result.rating,
        descriptionRaw : result.descriptionRaw
      )
    }
  }
}
