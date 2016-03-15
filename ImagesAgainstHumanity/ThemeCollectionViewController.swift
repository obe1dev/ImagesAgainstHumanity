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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alertView(sender: AnyObject) {
        
        let alertView = JSSAlertView();
        
        alertView.show(self, title: "test", text: "Body text test", buttonText: "action", cancelButtonText: "Cancle", color: UIColor.orangeColor())
        alertView.setTextTheme(JSSAlertView.TextColorTheme.Light)
        
         
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        
        
        if let cell = sender as? UICollectionViewCell{
            if let indexPath = collectionView!.indexPathForCell(cell){
                
                let theme = themesImages[indexPath.row]
               
                let destinationViewController = segue.destinationViewController as? PickCaptionTableViewController
  // this is not working not 
                destinationViewController?.theme = theme
                
            }
        }
        
        
        
        // Pass the selected object to the new view controller.
        
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return themelables.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ThemeCollectionViewCell
        
        let nameImage = themesImages[indexPath.row]
        let nameLabel = themelables[indexPath.row]
        
        cell.themeImage.image = UIImage(named: nameImage)
        cell.themeLabel.text = nameLabel
        // Configure the cell
        
    
        return cell
    }
    
    let themesImages = ["FunnyPic","Spongebob"]
    let themelables = ["fat guy", "Sopngebob"]

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
