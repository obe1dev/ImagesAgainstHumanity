//
//  PickCaptionTableViewController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/7/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import UIKit

class PickCaptionTableViewController: UITableViewController, CaptionCellDelegate {
    
    
    
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

        
        PickedCatagoryController.sharedInstance.fetchThemeData { (success) in
            if success {
                
                self.phrases = (PickedCatagoryController.sharedInstance.currentTheme?.phrases)!
                self.images = (PickedCatagoryController.sharedInstance.currentTheme?.themeImages)!
                
                self.captionImage.image = UIImage(data: self.getRandomNumAndDecode(self.images))
                
                self.randomLoop()
                
                self.tableView.reloadData()
            }
        }
        
        tableView.tableFooterView = UIView()
        
    }

    func randomLoop(){
        
        var tempArray = self.phrases
        
        for _ in 1...4 {
            
            if tempArray.count < 0{
                return
            }
            
            let randomNum = self.getRandPhrase(tempArray)
            self.displayedPhrases.append(tempArray[randomNum])
            tempArray.removeAtIndex(randomNum)
            
        }
        
    }
    
    
    
    func getRandPhrase(array: NSArray) -> Int {
        
        let numberOfPhrases = array.count
        
        var randomNum: Int = 0
        
        randomNum = Int(arc4random_uniform(UInt32(numberOfPhrases)))
        
        return randomNum
        
    }
    
    func getRandomNumAndDecode(array: NSArray) -> NSData {
        
        let numberOfThemes = array.count
        
        var randomNum: Int = 0
        
        randomNum = Int(arc4random_uniform(UInt32(numberOfThemes)))
        
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
    
    

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return displayedPhrases.count + 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        //this will send the pre-built captions
        
        if indexPath.row < displayedPhrases.count {
            let cell = tableView.dequeueReusableCellWithIdentifier("phraseCell") as! PhraseTableViewCell
            
            cell.phraseLabel.text = displayedPhrases[indexPath.row]
            //cell.phraseLabel.text = phrases[indexPath.row]
            
            return cell
        } else {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("addCaptionCell") as! CaptionTableViewCell
            cell.captionText.placeholder = "Add your caption here"
           
            if cell.cellDelegate == nil{
                
                cell.cellDelegate = self
                
            }
            return cell
        }
       
        

        
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == displayedPhrases.count + 1 {
            print("selected text field cell")
        } else {
        
            captionPicked = displayedPhrases[indexPath.row]
            
            self.aletView()
            
        }
        
        
    }
    
    //MARK: CaptionCellDelegate
    func cellTapped(cell: CaptionTableViewCell) {
        
        if cell.captionText.text != "" {
            
            
            captionPicked = cell.captionText.text!
            
            //reset the cell to nil for next player
            cell.captionText.text = nil
            
            self.aletView()
            
        }
        
    }

    
    //MARK: Custom Alert View
    
    func aletView() {
        
        let aletView = JSSAlertView()
        
        aletView.show(self, title: "Pass or End", text: "Pass to another player. Or End the round", buttonText: "Pass", cancelButtonText: "End", color: UIColor.purpleColor())
        aletView.setTextTheme(JSSAlertView.TextColorTheme.Light)
        
        aletView.addAction(addCaptionToWinnerArray)
        aletView.addCancelAction(endRound)
    }
    
    func addCaptionToWinnerArray() ->Void {
        
        //taking an item out of the phrases array to prevent douplicate

        
        winnerArray.append(captionPicked)
        
        displayedPhrases = []
        
        self.randomLoop()
        self.tableView.reloadData()
        
    }
    
    func endRound() ->Void {
        
//        captionImage.image = UIImage(named: theme)
        
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
