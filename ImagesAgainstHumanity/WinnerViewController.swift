//
//  WinnerViewController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/14/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    //UICollectionViewFlowLayout
    
    @IBOutlet weak var winnerThemeImage: UIImageView!
    @IBOutlet weak var winningCardLabel: UILabel!
    
    
    var theme = ""
    
    var winnerArray = [String]()
    //var winnerArray = ["WOW!","I beat anorexia","this will take a crane to get me out","fat guy in a little lake","cannonball!!"]
    
    private let reuseIdentifier = "winnerCell"
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let centerCell = CenterCellCollectionView()
        
        
        
        
        //centerCell.targetContentOffsetForProposedContentOffset(<#T##proposedContentOffset: CGPoint##CGPoint#>, withScrollingVelocity: <#T##CGPoint#>)
        
        theme = (ThemeController.sharedInstance.currentTheme?.name)!
        
        if self.theme == "Black Cards"{
            
            self.winnerThemeImage.backgroundColor = UIColor.blackColor()
            self.winnerThemeImage.layer.cornerRadius = 10.0
            
            self.winningCardLabel.text = WinnerController.sharedInstance.pickedCard.text
            self.winningCardLabel.textColor = UIColor.whiteColor()
        
        }else{

            winnerThemeImage.image = WinnerController.sharedInstance.themeImage
            
            winnerThemeImage.layer.cornerRadius = 10
            winnerThemeImage.layer.borderWidth = 3
            
            self.winningCardLabel.hidden = true
            
        }
        
        winnerArray = WinnerController.sharedInstance.winnerArray
        
        //this will help the fromatting on the collection view
//        winnerArray.insert("", atIndex: 0)
//        winnerArray.append("")
    
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0), atScrollPosition: .CenteredHorizontally, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Collection View
    
        
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return winnerArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! WinnerCollectionViewCell
        
        if indexPath.row == 0 {
            
//            cell.backgroundColor = UIColor(patternImage: UIImage(named: "FunnyPic")!)
            //cell.backgroundView = UIImageView(image: WinnerController.sharedInstance.themeImage)
        }
        
        
        let nameLabel = winnerArray[indexPath.row]
        
        cell.winnerTextlabel.text = nameLabel
        
        cell.innerView.layer.cornerRadius = 7.0
        
        cell.layer.cornerRadius = 7.0
        
        cell.layer.shadowColor = UIColor.darkGrayColor().CGColor
        cell.layer.shadowOpacity = 0.7
        // cell.layer.shadowRadius = 7.0
        cell.layer.masksToBounds = false
        cell.layer.shouldRasterize = false
        cell.layer.shadowOffset = CGSizeMake(10, 10)
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 10.0).CGPath
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 23.0
        
    }

    @IBAction func winnerButton(sender: AnyObject) {
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    func snapToCenter() {
//        let centerPoint = view.convertPoint(view.center, toView: collectionView)
//        let centerIndexPath = collectionView.indexPathForItemAtPoint(centerPoint)
//        collectionView.scrollToItemAtIndexPath(centerIndexPath!, atScrollPosition: .CenteredHorizontally, animated: true)
//    }
//    
//    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        snapToCenter()
//    }
//    
//    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if !decelerate {
//            snapToCenter()
//        }
//    }

}

