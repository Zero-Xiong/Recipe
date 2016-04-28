//
//  RecipeModel.swift
//  Recipe
//
//  Created by xiong on 22/4/16.
//  Copyright © 2016 Zero Inc. All rights reserved.
//

import UIKit

class RecipeModel: NSObject, NSCoding {
    var Title: String?
    var Content: String?
    
    init(_title: String?, _content: String?) {
        self.Title = _title
        self.Content = _content
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let titleDecoded = aDecoder.decodeObjectForKey("title") {
            self.Title = titleDecoded as? String
        }
        
        if let contentDecoded = aDecoder.decodeObjectForKey("content") {
            self.Content = contentDecoded as? String
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let titleEncoded = self.Title {
            aCoder.encodeObject(titleEncoded, forKey: "title")
        }
        
        if let contentEncoded = self.Content {
            aCoder.encodeObject(contentEncoded, forKey: "content")
        }
    }
}
