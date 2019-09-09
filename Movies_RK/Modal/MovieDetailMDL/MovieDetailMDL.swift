//
//  MovieDetailMDL.swift
//
//  Created by Reus on 09/09/19
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MovieDetailMDL: Codable {

  enum CodingKeys: String, CodingKey {
    case popularity = "popularity"
    case tagline = "tagline"
    case belongsToCollection = "belongs_to_collection"
    case budget = "budget"
    case runtime = "runtime"
    case video = "video"
    case spokenLanguages = "spoken_languages"
    case originalTitle = "original_title"
    case adult = "adult"
    case revenue = "revenue"
    case originalLanguage = "original_language"
    case homepage = "homepage"
    case overview = "overview"
    case imdbId = "imdb_id"
    case posterPath = "poster_path"
    case id = "id"
    case status = "status"
    case backdropPath = "backdrop_path"
    case title = "title"
    case voteCount = "vote_count"
    case genres = "genres"
    case productionCompanies = "production_companies"
    case releaseDate = "release_date"
    case voteAverage = "vote_average"
    case productionCountries = "production_countries"
  }

  var popularity: Float?
  var tagline: String?
  var belongsToCollection: BelongsToCollection?
  var budget: Int?
  var runtime: Int?
  var video: Bool?
  var spokenLanguages: [SpokenLanguages]?
  var originalTitle: String?
  var adult: Bool?
  var revenue: Int?
  var originalLanguage: String?
  var homepage: String?
  var overview: String?
  var imdbId: String?
  var posterPath: String?
  var id: Int?
  var status: String?
  var backdropPath: String?
  var title: String?
  var voteCount: Int?
  var genres: [Genres]?
  var productionCompanies: [ProductionCompanies]?
  var releaseDate: String?
  var voteAverage: Float?
  var productionCountries: [ProductionCountries]?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
    tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
    belongsToCollection = try container.decodeIfPresent(BelongsToCollection.self, forKey: .belongsToCollection)
    budget = try container.decodeIfPresent(Int.self, forKey: .budget)
    runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
    video = try container.decodeIfPresent(Bool.self, forKey: .video)
    spokenLanguages = try container.decodeIfPresent([SpokenLanguages].self, forKey: .spokenLanguages)
    originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
    adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
    revenue = try container.decodeIfPresent(Int.self, forKey: .revenue)
    originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
    homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
    overview = try container.decodeIfPresent(String.self, forKey: .overview)
    imdbId = try container.decodeIfPresent(String.self, forKey: .imdbId)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    status = try container.decodeIfPresent(String.self, forKey: .status)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    genres = try container.decodeIfPresent([Genres].self, forKey: .genres)
    productionCompanies = try container.decodeIfPresent([ProductionCompanies].self, forKey: .productionCompanies)
    releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
    voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
    productionCountries = try container.decodeIfPresent([ProductionCountries].self, forKey: .productionCountries)
  }

}
