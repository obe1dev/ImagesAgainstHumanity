//
//  ThemeCollectionViewController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/7/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import UIKit

private let reuseIdentifier = "themeCell"

class ThemeCollectionViewController: UICollectionViewController{
    
    var themes = ThemeController.sharedInstance.themeNames
    //let themesImages = ["FunnyPic","Spongebob"]
    var themelables = [Theme]()

    
    @ IBAction func unwindTofirst(segue: UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = ThemeController.fetchAllThemes({ (success) in
            if let _ = success {
                self.themes = ThemeController.sharedInstance.themeNames
                self.themelables = self.themes
                self.collectionView?.reloadData()
            }
        })
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alertView(sender: AnyObject) {
        
        let alertView = JSSAlertView();
        
        alertView.show(self, title: "test", text: "Body text test", buttonText: "action", cancelButtonText: "Cancel", color: UIColor.orangeColor())
        alertView.setTextTheme(JSSAlertView.TextColorTheme.Light)
        
         
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        
        
        
        if let cell = sender as? UICollectionViewCell{
            if let indexPath = collectionView!.indexPathForCell(cell){
                
                //let theme = themesImages[indexPath.row]
               let theme = themelables[indexPath.row]
                let destinationViewController = segue.destinationViewController as? PickCaptionTableViewController
                
                _ = destinationViewController?.view
  
                destinationViewController?.theme = theme.themeTitle!
                
            }
        }
        
        
        
        // Pass the selected object to the new view controller.
        
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return themes.count
        //return themelables.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ThemeCollectionViewCell
        
        //let nameImage = themesImages[indexPath.row]
        let nameLabel = themelables[indexPath.row]
        
        //cell.themeImage.image = UIImage(named: nameImage)
        cell.themeLabel.text = nameLabel.themeTitle
        // Configure the cell
        
    
        return cell
    }
    
    // MARK: UICollectionViewDelegate


    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */
    
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        
    
    }
    */
    

}
