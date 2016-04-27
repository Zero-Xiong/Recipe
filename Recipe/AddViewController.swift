//
//  AddViewController.swift
//  Recipe
//
//  Created by xiong on 26/4/16.
//  Copyright © 2016 Zero Inc. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var titleText: UITextField!
    
    @IBOutlet var recipeContent: UITextView!
    
    @IBOutlet var doneButton: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleText.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        recipeContent.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doneButton_Click(sender: AnyObject) {
        recipeContent.resignFirstResponder()
    }
    
    
    @IBAction func titleDoneButton_Click(sender: AnyObject) {
        titleText.resignFirstResponder()
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
