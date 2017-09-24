//
//  ResponseSkelton.swift
//  DemoApp
//
//  Created by Rajeev on 24/09/17.
//  Copyright © 2017 Wildnet. All rights reserved.
//

import UIKit
import SwiftyJSON

open class ResponseSkeleton: NSObject {
    fileprivate var resourse:AnyObject
    
    
    //MARK:- Intializer
    public init(_ data:AnyObject) {
        let json = JSON(data)
        self.resourse = (json["results"].object as? AnyObject)!
    }
    
    
    public func getResouse()->AnyObject {
        return resourse
    }

}
