//
//  ListViewController.swift
//  Recipe
//
//  Created by xiong on 21/4/16.
//  Copyright © 2016 Zero Inc. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    //let arraydata = ["item1", "item2", "item3", "item4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(networkStatusChanged), name: ReachabilityStatusChangedNotification, object: nil)
        
        Reachability().monitorReachabilityChanges()
        
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let bkImage = UIImage(named: "breadsindex")
        
        let bkImageView = UIImageView(frame: self.view.frame)
        bkImageView.image = bkImage
        bkImageView.contentMode = .ScaleAspectFill
//      
//        let topConstraint = NSLayoutConstraint(item: bkImageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: tableView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
//        
//        let leadingContraint = NSLayoutConstraint(item: bkImageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: tableView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0)
//        
//        let trailingConstraint = NSLayoutConstraint(item: bkImageView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: tableView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0)
//        
//        let bottomConstraint = NSLayoutConstraint(item: bkImageView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: tableView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
//        
//        //tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
//        bkImageView.addConstraints([topConstraint, leadingContraint, trailingConstraint, bottomConstraint])
        
        tableView.backgroundView = bkImageView
        
        //tableView.backgroundColor = UIColor.clearColor()
        
        NSUserDefaultsManager.initializeDefault()
        initializeiCloud()
        
    }
    
    func SetImageViewConstraints() {
        
    }
    
    func  initializeiCloud()  {
        let fileManager = NSFileManager.defaultManager()
        
        let iCloudURL = fileManager.ubiquityIdentityToken
        
        let networkstatus = Reachability().connectionStatus()
        
        var online: Bool = false
        
        switch networkstatus {
        case .Offline, .Unknown:
            online = false
        case .Online(ReachabilityType.WWAN):
            online = true
        case .Online(ReachabilityType.WiFi) :
            online = true
        //default:
        //    online = false
        }
        
        if (iCloudURL != nil && online) {
            let store = NSUbiquitousKeyValueStore.defaultStore()
            let notification = NSNotificationCenter.defaultCenter()
            
            notification.addObserver(self, selector: #selector(UpdateFromiCloud), name: NSUbiquitousKeyValueStoreDidChangeExternallyNotification, object: store)
        }
    }
    
    func UpdateFromiCloud(notification: NSNotification) {
        iCloudManager.GetFromiCloud()
        tableView.reloadData()
    }
    
    func networkStatusChanged(notification: NSNotification) {
        let userInfo = notification.userInfo
        print (userInfo)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    //override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //    // #warning Incomplete implementation, return the number of sections
    //    return 1
    //}
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RecipeManager.recipes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! MyTableViewCell

        // Configure the cell...
        if (indexPath.item % 2 == 0) {
            cell.backgroundColor = UIColor.clearColor()
        }
        else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.3)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
        
        }
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = RecipeManager.recipes[indexPath.item].Title
        cell.Recipe = RecipeManager.recipes[indexPath.item]
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            RecipeManager.DeleteRecipe(indexPath.item)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "detailview") {
            let cell = sender as! MyTableViewCell
            let detailview = segue.destinationViewController as! DetailViewController
            
            detailview.recipe_Title = cell.Recipe.Title
            detailview.recipe_Content = cell.Recipe.Content
            
        }
    }
    

}
