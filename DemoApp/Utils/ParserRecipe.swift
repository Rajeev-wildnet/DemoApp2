//
//  ParserRecipe.swift
//  DemoApp
//
//  Created by Rajeev on 24/09/17.
//  Copyright © 2017 Wildnet. All rights reserved.
//

import UIKit

class ParserRecipe: NSObject {
   
    static var recipes:[Recipe] = []
    
    class func parseAndSetRecipeDataToRecipeModel(_ data:AnyObject)->[Recipe]{
        if let array = data as? NSArray {
            for recipe in array {
                var recipeTitle:AnyObject?
                if let title = (recipe as? NSDictionary)?.object(forKey: KEY_RECIPE.TITLE){
                   recipeTitle = title as AnyObject?
                }
                
                var recipeHref:AnyObject?

                if let href = (recipe as? NSDictionary)?.object(forKey: KEY_RECIPE.HREF){
                    recipeHref = href as AnyObject?
                }
                
                var recipeIngredients:AnyObject?

                if let ingredients = (recipe as? NSDictionary)?.object(forKey: KEY_RECIPE.INGREDIENTS){
                    recipeIngredients = ingredients as AnyObject?
                }
                
                var recipeThumbnail:AnyObject?

                if let thumbnail = (recipe as? NSDictionary)?.object(forKey: KEY_RECIPE.THUMBNAIL){
                    recipeThumbnail = thumbnail as AnyObject?
                }
                
                let recipe = Recipe(title: recipeTitle, href: recipeHref, ingredients: recipeIngredients, thumbnail: recipeThumbnail)
                
                self.recipes.append(recipe)
                
            }
            
            return self.recipes
            
        }
        
        
        return self.recipes
        
        
    }

}
