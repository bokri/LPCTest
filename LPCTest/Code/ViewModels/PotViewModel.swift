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

    var pots = Variable<[Pot]>([])
  
    func getPots() -> Observable<[Pot]> {
    
        return ApiClient.shared.pots()
            .do(
                onNext: { [weak self] pots in
                    self?.pots.value = pots
                },
                onError: { (error) in
                    debugPrint(error)
            })
    }
    
    func createPot() -> Observable<Pot> {
        
        return ApiClient.shared.createPot()
            .do(
                onNext: { [weak self] pot in
                    if((self?.pots.value.count)! > 0) {
                        self?.pots.value.insert(pot, at: 1)
                    }
                },
                onError: { (error) in
                    debugPrint(error)
            })
 
    }
    
    func removePot() -> Observable<Pot> {
    
        return ApiClient.shared.removePot()
            .do(
                onNext: { [weak self] _ in
                    if((self?.pots.value.count)! > 1) {
                        self?.pots.value.remove(at: 1)
                    }
                },
                onError: { (error) in
                    debugPrint(error)
            })
    }

}
