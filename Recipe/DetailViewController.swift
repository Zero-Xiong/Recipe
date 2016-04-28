//
//  DetailViewController.swift
//  Recipe
//
//  Created by xiong on 26/4/16.
//  Copyright © 2016 Zero Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet var recipeContent: UITextView!
    
    var recipe_Title: String?
    var recipe_Content: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        recipeContent.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.title = recipe_Title
        
        recipeContent.text = recipe_Content
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
