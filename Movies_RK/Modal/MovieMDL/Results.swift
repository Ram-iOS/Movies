//
//  Results.swift
//
//  Created by Reus on 09/09/19
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Results: Codable {

  enum CodingKeys: String, CodingKey {
    case voteAverage = "vote_average"
    case genreIds = "genre_ids"
    case overview = "overview"
    case id = "id"
    case video = "video"
    case releaseDate = "release_date"
    case posterPath = "poster_path"
    case originalTitle = "original_title"
    case backdropPath = "backdrop_path"
    case title = "title"
    case adult = "adult"
    case voteCount = "vote_count"
    case popularity = "popularity"
    case originalLanguage = "original_language"
  }

  var voteAverage: Float?
  var genreIds: [Int]?
  var overview: String?
  var id: Int?
  var video: Bool?
  var releaseDate: String?
  var posterPath: String?
  var originalTitle: String?
  var backdropPath: String?
  var title: String?
  var adult: Bool?
  var voteCount: Int?
  var popularity: Float?
  var originalLanguage: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
    genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
    overview = try container.decodeIfPresent(String.self, forKey: .overview)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    video = try container.decodeIfPresent(Bool.self, forKey: .video)
    releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
    voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
    originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
  }

}
