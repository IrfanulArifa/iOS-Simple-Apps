//
//  GameModel.swift
//  Planet Game
//
//  Created by Irfanul Arifa on 12/05/23.
//

import Foundation
import UIKit

enum DownloadState {
    case new, downloaded, failed
}

class Game {
    let id:Int
    let slug:String
    let name:String
    let released:String
    let backgroundImage:URL
    let rating:Double
    let descriptionRaw:String
    var state:DownloadState = .new
    var image:UIImage?
    init(id: Int, slug: String, name: String, released: String, backgroundImage: URL, rating: Double, descriptionRaw: String) {
        self.id = id
        self.slug = slug
        self.name = name
        self.released = released
        self.backgroundImage = backgroundImage
        self.rating = rating
        self.descriptionRaw = descriptionRaw
    }
}

struct Welcome: Codable {
    let status: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let slug: String
    let name: String
    let released: String
    let backgroundImage: URL
    let rating: Double
    let saturatedColor, dominantColor: Color
    let genres: [Genre]
    let clip: Clip
    let shortScreenshots: [ShortScreenshot]
    let descriptionRaw: String

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released
        case backgroundImage = "background_image"
        case rating
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case genres, clip
        case shortScreenshots = "short_screenshots"
        case descriptionRaw = "description_raw"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.name = try container.decode(String.self, forKey: .name)
        self.released = try container.decode(String.self, forKey: .released)
        let path = try container.decode(String.self, forKey: .backgroundImage)
        self.backgroundImage = URL(string: "\(path)")!
        self.rating = try container.decode(Double.self, forKey: .rating)
        self.saturatedColor = try container.decode(Color.self, forKey: .saturatedColor)
        self.dominantColor = try container.decode(Color.self, forKey: .dominantColor)
        self.genres = try container.decode([Genre].self, forKey: .genres)
        self.clip = try container.decode(Clip.self, forKey: .clip)
        self.shortScreenshots = try container.decode([ShortScreenshot].self, forKey: .shortScreenshots)
        self.descriptionRaw = try container.decode(String.self, forKey: .descriptionRaw)
    }
}

// MARK: - Clip
struct Clip: Codable {
    let clip: String
    let clips: Clips
    let preview: String
}

// MARK: - Clips
struct Clips: Codable {
    let the320, the640, full: String

    enum CodingKeys: String, CodingKey {
        case the320 = "320"
        case the640 = "640"
        case full
    }
}

enum Color: String, Codable {
    case the0F0F0F = "0f0f0f"
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

// MARK: - ShortScreenshot
struct ShortScreenshot: Codable {
    let id: Int
    let image: String
}
