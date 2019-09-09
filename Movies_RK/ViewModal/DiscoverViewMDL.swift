//
//  DiscoverViewMDL.swift
//  Movies_RK
//
//  Created by Reus on 09/09/19.
//  Copyright © 2019 RK. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya
import MagicalRecord

class DiscoverViewMDL{
    
    let provider = MoyaProvider<MoviesServices>()
    let results: BehaviorRelay<[Movies]> = BehaviorRelay(value: [])

    init() {
        discover()
    }
    
    func discover(){
        
        provider.request(.discover(api_key: Constants.APIs.key, pag: "1")) { (result) in
            switch result{
            case .success(let response):
                let mdl = try! response.map(MovieMDL.self)
                if let result = mdl.results{
                    Movies.syncMoviestoDB(results: result, completion: { (success) in
                        if let movies = Movies.mr_findAll() as? [Movies]{
                            self.results.accept(movies)
                        }
                    })
                }
                break
            case .failure(_):
                break
            }
        }
       
    }
}
