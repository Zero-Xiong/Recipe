//
//  iCloudManager.swift
//  Recipe
//
//  Created by xiong on 28/4/16.
//  Copyright © 2016 Zero Inc. All rights reserved.
//

import UIKit

class iCloudManager: NSObject {
    
    
    class func GetFromiCloud() {
        let iCloudStore = NSUbiquitousKeyValueStore.defaultStore()
        let fromCloud = iCloudStore.objectForKey("recipearray") as! NSData
        
        RecipeManager.recipes = NSKeyedUnarchiver.unarchiveObjectWithData(fromCloud) as! [RecipeModel]!
        
        
    }
    
    class func SendToCloud() {
        let myData = NSKeyedArchiver.archivedDataWithRootObject(RecipeManager.recipes)
        
        let iCloudStore = NSUbiquitousKeyValueStore.defaultStore()
        iCloudStore.setObject(myData, forKey: "recipearray")
        iCloudStore.synchronize()
    
    }

}
