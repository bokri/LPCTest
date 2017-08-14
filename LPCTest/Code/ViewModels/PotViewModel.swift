//
//  PotViewModel.swift
//  LPCTest
//
//  Created by Aymen Bokri on 11/08/2017.
//  Copyright © 2017 Saif Chaouachi. All rights reserved.
//

import Foundation
import RxSwift

class PotViewModel {

    // MARK : - Variables
    var pots = Variable<[Pot]>([])
  
    // MARK : - Methods
    func getPots() -> Observable<[Pot]> {
    
        return ApiClient.shared.pots()
            .do(
                onNext: { [weak self] pots in
                    self?.pots.value = pots
                },
                onError: { (error) in
                    self.pots.value.removeAll()
                    debugPrint(error)
            })
    }
    
    func createPot() -> Observable<Any> {
        
        return ApiClient.shared.createPot()
        
    }
    
    func removePot() -> Observable<Any> {
    
        return ApiClient.shared.removePot()

    }

}
