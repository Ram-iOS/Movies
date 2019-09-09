//
//  BelongsToCollection.swift
//
//  Created by Reus on 09/09/19
//  Copyright (c) . All rights reserved.
//

import Foundation

struct BelongsToCollection: Codable {

  enum CodingKeys: String, CodingKey {
    case name = "name"
    case posterPath = "poster_path"
    case id = "id"
    case backdropPath = "backdrop_path"
  }

  var name: String?
  var posterPath: String?
  var id: Int?
  var backdropPath: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
  }

}
