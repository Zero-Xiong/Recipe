//
//  RecipeModel.swift
//  Recipe
//
//  Created by xiong on 22/4/16.
//  Copyright © 2016 Zero Inc. All rights reserved.
//

import UIKit

class RecipeModel: NSObject {
    var Title: String?
    var Content: String?
    
    init(_title: String?, _content: String?) {
        self.Title = _title
        self.Content = _content
    }
    
    override init() {
        super.init()
    }
}
