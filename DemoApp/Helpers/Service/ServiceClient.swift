//
//  ServiceClient.swift
//  DemoApp
//
//  Created by Rajeev on 24/09/17.
//  Copyright © 2017 Wildnet. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

struct ServiceClient {
   //API call
    static func call(_ router:String , method:HTTPMethod , params:[String:Any] , header:[String:Any],callback:@escaping (AnyObject?)->()){
        Alamofire.request(router, method: method, parameters: params, encoding: JSONEncoding.default, headers: header as? HTTPHeaders).validate().responseJSON { (response) in
            switch response.result {
            case .success :
                print("success")
                callback(response.result.value as AnyObject?)
                break
                
            case .failure(let error):
                print(error)
                callback(nil)
                break
                
                
            }
        }
        
    }
}
