//
//  PickCaptionTableViewController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/7/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import UIKit

class PickCaptionTableViewController: UITableViewController {
    
    
    
    var theme = ""
    var phrases = []
    var winnerArray = [String]()
    var captionPicked = ""
    
    @IBOutlet weak var captionImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.tableFooterView = UIView()
        
        if theme != "" {
            captionImage.image = UIImage(named: theme)
        }
        
        switch theme {
        case "FunnyPic":
            phrases = ["WOW!","I beat anorexia","this will take a crane to get me out","fat guy in a little lake","cannonball!!"]
            return
        case "Spongebob":
            phrases = ["i dont think were in utah","hold me","lol","cool","its working"]
            return
        default:
            captionImage.image = UIImage(named: "FunnyPic")
            phrases = ["WOW!","I beat anorexia","this will take a crane to get me out","fat guy in a little lake","cannonball!!"]
            return
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return section == 0 ? 5 : 0
        return phrases.count + 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        //this will send the pre-built captions
        
        if indexPath.row < phrases.count {
            let cell = tableView.dequeueReusableCellWithIdentifier("phraseCell") as! PhraseTableViewCell
        
            cell.phraseLabel.text = phrases[indexPath.row] as? String
            
            return cell
        } else {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("addCaptionCell") as! CaptionTableViewCell
            cell.captionText.placeholder = "Add your caption here"
            
            return cell
        }
       
        

        
    }
    
//    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50.0
//    }
//    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        
//        let footerView = UIView()
//        
//        footerView.backgroundColor = UIColor.clearColor()
//        
//        return footerView
//        
//    }
    
    //MARK: Custom Alert View
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == phrases.count {
            print("selected text field cell")
        } else {
        
            let aletView = JSSAlertView()
            
            captionPicked = phrases[indexPath.row] as! String
            
            aletView.show(self, title: "Pass or End", text: "Pass to another player. Or End the round", buttonText: "Pass", cancelButtonText: "End", color: UIColor.purpleColor())
            aletView.setTextTheme(JSSAlertView.TextColorTheme.Light)
            
            aletView.addAction(addCaptionToWinnerArray)
            aletView.addCancelAction(endRound)
            
        }
        
        
    }
    
    func addCaptionToWinnerArray() ->Void {
        
       winnerArray.append(captionPicked)
        
    }
    
    func endRound() ->Void {
        
        captionImage.image = UIImage(named: theme)
        
        addCaptionToWinnerArray()
        performSegueWithIdentifier("toWinner", sender: self)
        
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

    
    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let cell = sender as? UITableViewCell{
            if let _ = tableView!.indexPathForCell(cell){
                
                _ = segue.destinationViewController as! PassOrPlayViewController
                
                
            }
        }
        
    }
    */
    

}
