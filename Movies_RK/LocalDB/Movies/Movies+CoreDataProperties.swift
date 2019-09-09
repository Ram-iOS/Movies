//
//  Movies+CoreDataProperties.swift
//  Movies_RK
//
//  Created by Reus on 09/09/19.
//  Copyright © 2019 RK. All rights reserved.
//
//

import Foundation
import CoreData


extension Movies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movies> {
        return NSFetchRequest<Movies>(entityName: "Movies")
    }

    @NSManaged public var id: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var posterPath: String?
    @NSManaged public var title: String?
    @NSManaged public var backdropPath: String?
    @NSManaged public var overview: String?

}
