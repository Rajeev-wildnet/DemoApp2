//
//  Recipe.swift
//  DemoApp
//
//  Created by Rajeev on 24/09/17.
//  Copyright © 2017 Wildnet. All rights reserved.
//

import UIKit

class Recipe: NSObject {
    
    var title:AnyObject?
    var href:AnyObject?
    var ingredients:AnyObject?
    var thumbnail:AnyObject?
    
    init(title:AnyObject? , href:AnyObject? ,ingredients:AnyObject?,thumbnail:AnyObject?) {
        self.title = title!
        self.href = href!
        self.ingredients = ingredients!
        self.thumbnail = thumbnail!
    }
}
