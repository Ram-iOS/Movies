//
//  MoviesServices.swift
//  Movies_RK
//
//  Created by Reus on 09/09/19.
//  Copyright © 2019 RK. All rights reserved.
//

import Moya
import Foundation

enum MoviesServices {
    
    case discover(api_key:String, pag:String)
    case moviedetails(api_key:String, movie_id:String)
    
}

extension MoviesServices: TargetType{
    
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
        case .discover(_, _):
            return "/discover/movie"
        case .moviedetails(_, let movie_id):
            return Constants.APIs.moviewdetail + "/\(movie_id)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var parameters: [String: Any]? {
        switch self {
        
        case .discover(let api_key, let pag):
            return ["api_key":api_key, "api_key":pag]
        case .moviedetails(let api_key, _):
            return ["api_key":api_key]
        
        }
    }
    
    var task: Task {
        switch self {
        case .discover(let api_key, let pag):
            return .requestParameters(parameters: ["api_key":api_key, "pag":pag], encoding: URLEncoding.default)
        case .moviedetails(let api_key, _):
            return .requestParameters(parameters: ["api_key":api_key], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
    
}
