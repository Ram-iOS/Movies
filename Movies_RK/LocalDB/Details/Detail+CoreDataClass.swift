//
//  Detail+CoreDataClass.swift
//  Movies_RK
//
//  Created by Reus on 09/09/19.
//  Copyright © 2019 RK. All rights reserved.
//
//

import Foundation
import CoreData
import MagicalRecord

@objc(Detail)
public class Detail: NSManagedObject {

    static func syncMovieDetails(detail: MovieDetailMDL, completion:@escaping ((_ success: Bool)->Void)){
        
        MagicalRecord.save({ (localContext) in
            
            if let detailDB = Detail.mr_createEntity(in: localContext){
                
                detailDB.overview       = detail.overview
                detailDB.id             = "\(detail.id!)"
                detailDB.duration       = "\(detail.runtime!)"
                detailDB.releasedate    = detail.releaseDate
                detailDB.budget         = "\(detail.budget!)"
                detailDB.revenue        = "\(detail.revenue!)"
                
                detailDB.genre          = genrenames(genres: detail.genres)
                detailDB.companies      = productioncompanies(genres: detail.productionCompanies)
                detailDB.title          = detail.title
                detailDB.tagline        = detail.tagline
                detailDB.lang           = detail.originalLanguage
            }
            
            
        }) { (success, error) in
            completion(success)
        }
        
    }
    
     static func genrenames(genres: [Genres]?)->String{
        var i = 0
        var gneress = ""
        if let gnrs = genres{
            for genre in gnrs{
                if i == gnrs.count - 1{
                    gneress = gneress + genre.name!
                }
                gneress = gneress + genre.name! + ", "
                i = i + 1
            }
        }
        return gneress
    }
    
    static func productioncompanies(genres: [ProductionCompanies]?)->String{
        var i = 0
        var gneress = ""
        if let gnrs = genres{
            for genre in gnrs{
                if i == gnrs.count - 1{
                    gneress = gneress + genre.name!
                }
                gneress = gneress + genre.name! + ", "
                i = i + 1
            }
        }
        return gneress
    }
  
}
