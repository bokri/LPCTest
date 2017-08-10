//
//  Router.swift
//  LPCTest
//
//  Created by Aymen Bokri on 10/08/2017.
//  Copyright © 2017 Saif Chaouachi. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    case getPots()
    case createPot()
    case removePot()
    
    
    var method: HTTPMethod {
        switch self {
        case .getPots:
            return .get
        case .createPot:
            return .post
        case .removePot:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .getPots:
            return Constants.getPotsSuffix
        case .createPot:
            return Constants.createPotSuffix
        case .removePot:
            return Constants.removePotSuffix
        }
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.potsBaseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getPots():
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .createPot():
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .removePot():
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        default:
            break
        }
        
        return urlRequest
    }
}
