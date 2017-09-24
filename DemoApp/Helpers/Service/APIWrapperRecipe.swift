//
//  APIWrapperRecipe.swift
//  DemoApp
//
//  Created by Rajeev on 24/09/17.
//  Copyright © 2017 Wildnet. All rights reserved.
//

import UIKit

struct APIWrapper {
    static func getSearchData(param:[String:Any] , callBack:@escaping (AnyObject?)->()){
        ServiceClient.call(URLS.BASE_URL, method: .get, params: param, header: [:]) { (response) in
            if let res:AnyObject = response {
                let envelope = ResponseSkeleton(res)
                if envelope.getResouse().count > 0 {
                    let arraySearchedRecipes = ParserRecipe.parseAndSetRecipeDataToRecipeModel(envelope.getResouse())
                    callBack(arraySearchedRecipes as AnyObject?)
                }
            }else{
                callBack(nil)
            }
        }
    }
}
