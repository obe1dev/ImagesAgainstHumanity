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
    var pickedImage = UIImage()
    var phrases = [String]()
    var displayedPhrases = [String]()
    var images = []
    var winnerArray = [String]()
    var captionPicked = ""
    
    @IBOutlet weak var captionImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        PickedCatagoryController.sharedInstance.fetchThemeData { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
        
        tableView.tableFooterView = UIView()
        
        phrases = (PickedCatagoryController.sharedInstance.themes?.phrases)!
        images = (PickedCatagoryController.sharedInstance.themes?.themeImages)!
        
        captionImage.image = UIImage(data: getRandomNumAndDecode(images))
        //captionImage.image = UIImage(data: decodeImage(getRandomNum(images)))
        
        //captionImage.image = PickedCatagoryController.sharedInstance.pickedImage
        
        for _ in 1...4 {
            
            let randomNum = getRandPhrase(phrases)
            displayedPhrases.append(phrases[randomNum])
            //think about taking this item out of the phrases array to prevent douplicates
            
        }
        
        
        
        
        if theme != "" {
            
            //captionImage.image = UIImage(named: theme)
        }
        
//        switch theme {
//        case "FunnyPic":
//            phrases = ["WOW!","I beat anorexia","this will take a crane to get me out","fat guy in a little lake","cannonball!!"]
//            return
//        case "Spongebob":
//            phrases = ["i dont think were in utah","hold me","lol","cool","its working"]
//            return
//        default:
//            captionImage.image = UIImage(named: "FunnyPic")
//            phrases = ["WOW!","I beat anorexia","this will take a crane to get me out","fat guy in a little lake","cannonball!!"]
//            return
//        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRandPhrase(array: NSArray) -> Int {
        
        let numberOfPhrases = array.count
        
        var randomNum: Int = 0
        
        randomNum = Int(arc4random_uniform(UInt32(numberOfPhrases)) + 1)
        
        return randomNum
        
    }
    
    func getRandomNumAndDecode(array: NSArray) -> NSData {
        
        let numberOfThemes = array.count
        
        var randomNum: Int = 0
        
        randomNum = Int(arc4random_uniform(UInt32(numberOfThemes)) + 1)
        
        if let imageData = array[randomNum] as? String {
            
            return decodeImage(imageData)
            
        } else {
            NSLog("error in getRandomNum func")
            
            return NSData()
        }
        
        
        
    }
    
    func decodeImage(image: NSString) -> NSData {
        
        let decodeData = NSData(base64EncodedString: image as String, options: NSDataBase64DecodingOptions(rawValue: 0))
        
        //        pickedImage = UIImage(data: decodeData!)!
        
        return decodeData!
        
    }
    
    
    
//    func getRandomNum(array: NSArray) -> Int {
//        
//        let numberOfThemes = array.count
//        
//        return Int(arc4random_uniform(UInt32(numberOfThemes)) + 1)
//        
//    }
//    
//    func decodeImage(image: NSString){
//        
//        let decodeData = NSData(base64EncodedString: image as String, options: NSDataBase64DecodingOptions(rawValue: 0))
//        
//        pickedImage = UIImage(data: decodeData!)!
//        
//    }

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
        
            cell.phraseLabel.text = phrases[indexPath.row]
            
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
            
            captionPicked = phrases[indexPath.row]
            
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
