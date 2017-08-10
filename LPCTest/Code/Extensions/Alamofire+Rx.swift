//
//  Alamofire+Rx.swift
//  LPCTest
//
//  Created by Aymen Bokri on 10/08/2017.
//  Copyright © 2017 Saif Chaouachi. All rights reserved.
//

import Alamofire
import RxSwift

extension Request: ReactiveCompatible {}

extension Reactive where Base: DataRequest {
    
    func responseJSON() -> Observable<Any> {
        return Observable.create { observer in
            let request = self.base.responseJSON { response in
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create(with: request.cancel)
        }
    }
    
    func responseData() -> Observable<Any> {
        return Observable.create { observer in
            let request = self.base.responseData { response in
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create(with: request.cancel)
        }
    }
}
