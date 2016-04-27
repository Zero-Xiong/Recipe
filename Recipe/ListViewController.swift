//
//  ListViewController.swift
//  Recipe
//
//  Created by xiong on 21/4/16.
//  Copyright © 2016 Zero Inc. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    let arraydata = ["item1", "item2", "item3", "item4"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //let bkImage = UIImage(named: "breadsindex")
        
        //self.tableView.backgroundColor = UIColor(patternImage: bkImage!)
        
        //let bkImageView = UIImageView(frame: self.view.frame)
        //bkImageView.image = bkImage
        //bkImageView.contentMode = .ScaleAspectFill
      
        //tableView.backgroundView = bkImageView
        //tableView.insertSubview(bkImageView, atIndex: 0)
        //tableView.sendSubviewToBack(bkImageView)
        //tableView.backgroundColor = UIColor.clearColor()
        
        //let imageView : UIImageView = UIImageView(image: UIImage(named: "breadsindex"))
        //self.tableView.backgroundView = imageView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    //override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //    // #warning Incomplete implementation, return the number of sections
    //    return 1
    //}
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arraydata.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        if (indexPath.item % 2 == 0) {
            cell.backgroundColor = UIColor.grayColor()
        }
        else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.3)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
        
        }
        
        //cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = arraydata[indexPath.item]

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}