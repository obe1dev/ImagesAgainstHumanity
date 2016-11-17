//
//  ThemeCollectionViewController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/7/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import UIKit

private let reuseIdentifier = "themeCell"

class ThemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //var themelables = [Theme]()

    
    @ IBAction func unwindTofirst(_ segue: UIStoryboardSegue) {}

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        
        guard let captionView = segue.destination as? PickCaptionTableViewController, let cell = sender as? UICollectionViewCell, let indexPath = collectionView?.indexPath(for: cell) else { return }
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


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ThemeController.sharedInstance.themes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ThemeCollectionViewCell
        
        let theme = ThemeController.sharedInstance.themeAtIndexPath(indexPath)
        
        cell.themeLabel.text = theme.name
        cell.themeImage.image = theme.coverImage
        
       
        self.cardFormat(cell.firstView)
        self.addShadow(cell.firstView)
        
        self.cardFormat(cell.secondView)
        self.addShadow(cell.secondView)

        
        self.cardFormat(cell.thirdView)
        self.addShadow(cell.thirdView)

        
        self.cardFormat(cell.fourthView)

        
        cell.themeImage.layer.cornerRadius = 7.0
        cell.themeImage.layer.borderWidth = 3.0
        cell.themeImage.layer.borderColor = UIColor().cardColor().cgColor
    
    
        return cell
    }
    
    func cardFormat(_ cell:UIView){
        cell.backgroundColor =  UIColor().cardColor()
        cell.layer.cornerRadius = 7.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.black.cgColor
    }
    
    func addShadow(_ cell:UIView){
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 1.4
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
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
