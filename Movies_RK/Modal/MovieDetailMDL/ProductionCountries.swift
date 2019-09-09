//
//  ProductionCountries.swift
//
//  Created by Reus on 09/09/19
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ProductionCountries: Codable {

  enum CodingKeys: String, CodingKey {
    case name = "name"
    case iso31661 = "iso_3166_1"
  }

  var name: String?
  var iso31661: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    iso31661 = try container.decodeIfPresent(String.self, forKey: .iso31661)
  }

}
