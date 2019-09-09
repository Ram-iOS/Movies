//
//  Detail+CoreDataProperties.swift
//  Movies_RK
//
//  Created by Reus on 09/09/19.
//  Copyright © 2019 RK. All rights reserved.
//
//

import Foundation
import CoreData


extension Detail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Detail> {
        return NSFetchRequest<Detail>(entityName: "Detail")
    }

    @NSManaged public var overview: String?
    @NSManaged public var id: String?
    @NSManaged public var genre: String?
    @NSManaged public var duration: String?
    @NSManaged public var releasedate: String?
    @NSManaged public var companies: String?
    @NSManaged public var budget: String?
    @NSManaged public var revenue: String?
    @NSManaged public var title: String?
    @NSManaged public var tagline: String?
    @NSManaged public var lang: String?


}
