//
//  MovieMDL.swift
//
//  Created by Reus on 09/09/19
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MovieMDL: Codable {

  enum CodingKeys: String, CodingKey {
    case results = "results"
    case totalResults = "total_results"
    case page = "page"
    case totalPages = "total_pages"
  }

  var results: [Results]?
  var totalResults: Int?
  var page: Int?
  var totalPages: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    results = try container.decodeIfPresent([Results].self, forKey: .results)
    totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    page = try container.decodeIfPresent(Int.self, forKey: .page)
    totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
  }

}
