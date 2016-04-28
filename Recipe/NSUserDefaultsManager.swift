//
//  NSUserDefaultsManager.swift
//  Recipe
//
//  Created by xiong on 27/4/16.
//  Copyright © 2016 Zero Inc. All rights reserved.
//

import UIKit

class NSUserDefaultsManager: NSObject {
    
    static let userDefaults = NSUserDefaults.standardUserDefaults()
    
    class func synchronize() {
        let myData = NSKeyedArchiver.archivedDataWithRootObject(RecipeManager.recipes)
        
        NSUserDefaults.standardUserDefaults().setObject(myData, forKey: "recipearray")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func initializeDefault() {
        if let recipesRaw = NSUserDefaults.standardUserDefaults().dataForKey("recipearray") {
            if let recipes = NSKeyedUnarchiver.unarchiveObjectWithData(recipesRaw) as? [RecipeModel] {
                
                RecipeManager.recipes = recipes
            }
        }
//        else {
//            synchronize()
//        }
    }

}
