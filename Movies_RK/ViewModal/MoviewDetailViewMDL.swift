//
//  MovieDetailViewMDL.swift
//  Movies_RK
//
//  Created by Reus on 09/09/19.
//  Copyright © 2019 RK. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa
import MagicalRecord

class MoviewDetailViewMDL{
    
    let provider = MoyaProvider<MoviesServices>()
    let results  = BehaviorRelay<Detail?>(value: nil)
    
    init(movieid:String) {
        requestdetails(movieid: movieid)
    }
    
    
    func requestdetails(movieid:String){
    
        provider.request(.moviedetails(api_key: Constants.APIs.key, movie_id: movieid)) { (result) in
            switch result{
            case .success(let response):
                let mdl = try! response.map(MovieDetailMDL.self)
                Detail.syncMovieDetails(detail: mdl, completion: { (success) in
                    if let detail = Detail.mr_findFirst(with: NSPredicate(format: "id==\(movieid)")){
                        self.results.accept(detail)
                    }
                })
                break
            case .failure(_):
                break
            }
        }
    }
}
