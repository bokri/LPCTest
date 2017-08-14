//
//  Router.swift
//  LPCTest
//
//  Created by Aymen Bokri on 10/08/2017.
//  Copyright © 2017 Saif Chaouachi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RxSwift

class ApiClient {
    
    // For singelton design pattern purpose
    static let shared = ApiClient()
    
    // MARK : - Methods
    
    func pots() -> Observable<[Pot]> {
        
        var pots = [Pot]()
    
        return Alamofire.request(Router.getPots()).rx.responseJSON()
            .map { value in
 
                let jsonPots = JSON(value).arrayValue
                
                    jsonPots.forEach({ jsonPot in
                        
            
                        let name = jsonPot["name"].stringValue
                        let imageUrl = jsonPot["imageUrl"].stringValue
                        
                        let pot = Pot()
                        pot.initialize(name: name, imageUrl: imageUrl)
                    
                        pots.append(pot)
                    
                    })
                
                return pots
        }
        
    }


    func createPot() -> Observable<Any> {
        return Alamofire.request(Router.createPot()).rx.responseData()
        
    }
    
    func removePot() -> Observable<Any> {
        
        return Alamofire.request(Router.removePot()).rx.responseData()
        
    }

}
