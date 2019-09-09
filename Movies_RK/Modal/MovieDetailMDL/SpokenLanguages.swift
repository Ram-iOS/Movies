//
//  SpokenLanguages.swift
//
//  Created by Reus on 09/09/19
//  Copyright (c) . All rights reserved.
//

import Foundation

struct SpokenLanguages: Codable {

  enum CodingKeys: String, CodingKey {
    case name = "name"
    case iso6391 = "iso_639_1"
  }

  var name: String?
  var iso6391: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    iso6391 = try container.decodeIfPresent(String.self, forKey: .iso6391)
  }

}
