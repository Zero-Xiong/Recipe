//
//  AddViewController.swift
//  Recipe
//
//  Created by xiong on 26/4/16.
//  Copyright © 2016 Zero Inc. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIDocumentPickerDelegate {

    @IBOutlet var titleText: UITextField!
    
    @IBOutlet var recipeContent: UITextView!
    
    @IBOutlet var doneButton: UIBarButtonItem!
    
    @IBOutlet var addButton: UIButton!
    
    @IBOutlet var icloudDocButton: UIButton!
    
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleText.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        recipeContent.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(AddViewController.textTitleDidChange),
                                                         name: UITextFieldTextDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(AddViewController.recipeContentDidChange),
                                                         name: UITextViewTextDidChangeNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doneButton_Click(sender: AnyObject) {
        recipeContent.resignFirstResponder()
    }
    
    func textTitleDidChange() {
        HandleButtonState()
    }
    
    func recipeContentDidChange() {
        HandleButtonState()
    }
    
    @IBAction func titleDoneButton_Click(sender: AnyObject) {
        titleText.resignFirstResponder()
    }
    
    func HandleButtonState(){
        if (recipeContent.text != "") {
            doneButton.enabled = true
        }
        else {
            doneButton.enabled = false
        }
        
        if ( titleText.text != "" && recipeContent.text != "") {
            addButton.enabled = true
            addButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }
        else {
            addButton.enabled = false
            addButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
        }
    }
    
    
    @IBAction func addButton_Click(sender: AnyObject) {
        
        activityIndicator.startAnimating()
        
        RecipeManager.AddRecipe(titleText.text!, content: recipeContent.text)
        
        titleText.text = ""
        recipeContent.text = ""
        doneButton.enabled = false
        addButton.enabled = false
        addButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
        
        NSUserDefaultsManager.synchronize()
        iCloudManager.SendToCloud()
        
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.activityIndicator.stopAnimating()
        }
        
    }

    
    @IBAction func iCloudDocButton_Click(sender: AnyObject) {
        //refer to link explain why we need "public.text" here :   https://developer.apple.com/library/ios/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html
        
        //
        let documentPicker: UIDocumentPickerViewController = UIDocumentPickerViewController(documentTypes: ["public.text"], inMode: UIDocumentPickerMode.Import)
        documentPicker.delegate = self
        
        documentPicker.modalPresentationStyle = UIModalPresentationStyle.FullScreen
        
        self.presentViewController(documentPicker, animated: true, completion: nil)
    }
    
    func documentPicker(controller: UIDocumentPickerViewController, didPickDocumentAtURL url: NSURL) {
        if(controller.documentPickerMode == UIDocumentPickerMode.Import) {
            let content = OpenFile(url.path!, utf8: NSUTF8StringEncoding)
            
            recipeContent.text = content
        }
    }
    
    func OpenFile(path: String, utf8: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        
        let contents : String?
        
        do {
            contents = try String(contentsOfFile: path, encoding: utf8)
        }
        catch {
            contents = nil
        }
        
        return contents
        
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
