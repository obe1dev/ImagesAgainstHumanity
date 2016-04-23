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
    
    //var themelables = [Theme]()

    
    @ IBAction func unwindTofirst(segue: UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ThemeController.sharedInstance.fetchAllThemes { (success) in
            if success {
                self.collectionView?.reloadData()
            }
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        
        guard let captionView = segue.destinationViewController as? PickCaptionTableViewController, cell = sender as? UICollectionViewCell, indexPath = collectionView?.indexPathForCell(cell) else { return }
        let theme = ThemeController.sharedInstance.themeAtIndexPath(indexPath)
        
        ThemeController.sharedInstance.selectTheme(theme)
        
        captionView.title = theme.name
        
        if theme.coverImage != nil{
            
            WinnerController.sharedInstance.ThemeTitleImage = theme.coverImage!
            
        }
        
        ThemeController.sharedInstance.selectTheme(theme)
        
        
        // Pass the selected object to the new view controller.
        
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ThemeController.sharedInstance.themes.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ThemeCollectionViewCell
        
        let theme = ThemeController.sharedInstance.themeAtIndexPath(indexPath)
        
        cell.themeLabel.text = theme.name
        cell.themeImage.image = theme.coverImage
        
        cell.firstView.layer.cornerRadius = 7.0
        cell.firstView.layer.borderWidth = 1.0
        cell.firstView.layer.borderColor = UIColor.blackColor().CGColor
        cell.firstView.layer.shadowColor = UIColor.lightGrayColor().CGColor
        
        cell.firstView.layer.masksToBounds = false
        cell.firstView.layer.shadowOffset = CGSizeMake(-3, -3)
        cell.firstView.layer.shadowColor = UIColor.blackColor().CGColor
        cell.firstView.layer.shadowRadius = 7.0
//        cell.firstView.layer.shadowOpacity = 1.0
        cell.layer.shouldRasterize = true
        
        
        
//        cell.themeLabel.layer.cornerRadius = 7.0
//        cell.themeLabel.layer.backgroundColor = UIColor.whiteColor().CGColor
        
//        cell.cardStackView.backgroundColor = UIColor.whiteColor()
        
//        cell.secondView.backgroundColor = UIColor.lightGrayColor()
        cell.secondView.layer.cornerRadius = 7.0
        cell.secondView.layer.borderWidth = 1.0
        cell.secondView.layer.borderColor = UIColor.blackColor().CGColor
        
//        cell.thirdView.backgroundColor = UIColor.lightGrayColor()
        cell.thirdView.layer.cornerRadius = 7.0
        cell.thirdView.layer.borderWidth = 1.0
        cell.thirdView.layer.borderColor = UIColor.blackColor().CGColor
        
//        cell.fourthView.backgroundColor = UIColor.lightGrayColor()
        cell.fourthView.layer.cornerRadius = 7.0
        cell.fourthView.layer.borderWidth = 1.0
        cell.fourthView.layer.borderColor = UIColor.blackColor().CGColor
        
        cell.themeImage.layer.cornerRadius = 7.0
        cell.themeImage.layer.borderWidth = 3.0
        cell.themeImage.layer.borderColor = UIColor.whiteColor().CGColor
        
//        cell.layer.backgroundColor = UIColor.darkGrayColor().CGColor
//        cell.layer.cornerRadius = 7.0
        
    
    
        return cell
    }
    
    //MARK: style image
    
    
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
