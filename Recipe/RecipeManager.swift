//
//  RecipeManager.swift
//  Recipe
//
//  Created by xiong on 22/4/16.
//  Copyright © 2016 Zero Inc. All rights reserved.
//

import UIKit

class RecipeManager: NSObject {
    
    static var recipes = [RecipeModel]()
    
    class func AddRecipe(title: String, content: String)  {
        
        let r = RecipeModel(_title: title, _content: content)
        
        recipes.append(r)
    }
    
    class func DeleteRecipe(id: Int) {
        recipes.removeAtIndex(id)
    }
    
    class func GetReceipt(id: Int) -> RecipeModel {
        if (recipes.count > 0) {
            return recipes[id]
        }
        
        return RecipeModel()
    }
    
}
