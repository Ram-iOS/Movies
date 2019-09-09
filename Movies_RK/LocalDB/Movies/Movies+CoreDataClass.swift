//
//  Movies+CoreDataClass.swift
//  Movies_RK
//
//  Created by Reus on 09/09/19.
//  Copyright © 2019 RK. All rights reserved.
//
//

import Foundation
import CoreData
import MagicalRecord

@objc(Movies)
public class Movies: NSManagedObject {

    static func syncMoviestoDB(results: [Results], completion:@escaping ((_ success: Bool)->Void)){
        
        MagicalRecord.save({ (localContext) in
            
            for result in results{
                
                if let moviesdb = Movies.mr_createEntity(in: localContext){
                    moviesdb.id             = "\(result.id!)"
                    moviesdb.releaseDate    = result.releaseDate
                    moviesdb.posterPath     = result.posterPath
                    moviesdb.title          = result.title
                    moviesdb.backdropPath   = result.backdropPath
                    moviesdb.overview       = result.overview
                }
            }
            
            
        }) { (success, error) in
            completion(success)
        }
    }
}
