//
//  ProductionCompanies.swift
//
//  Created by Reus on 09/09/19
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ProductionCompanies: Codable {

  enum CodingKeys: String, CodingKey {
    case name = "name"
    case id = "id"
    case logoPath = "logo_path"
    case originCountry = "origin_country"
  }

  var name: String?
  var id: Int?
  var logoPath: String?
  var originCountry: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    logoPath = try container.decodeIfPresent(String.self, forKey: .logoPath)
    originCountry = try container.decodeIfPresent(String.self, forKey: .originCountry)
  }

}
