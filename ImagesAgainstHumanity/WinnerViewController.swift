//
//  WinnerViewController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/14/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //UICollectionViewFlowLayout
    
    @IBOutlet weak var winnerThemeImage: UIImageView!
    
    var winnerArray = ["WOW!","I beat anorexia","this will take a crane to get me out","fat guy in a little lake","cannonball!!"]
    
    private let reuseIdentifier = "winnerCell"
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //whis will help the fromatting on the collection view
        winnerArray.insert("", atIndex: 0)
        winnerArray.append("")

        winnerThemeImage.image = UIImage(named: "FunnyPic")
        
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
        
//        if indexPath.row == 0 {
//            cell.backgroundColor = UIColor.clearColor()
//        }
        
        let nameLabel = winnerArray[indexPath.row]
        
        cell.winnerTextView.text = nameLabel

        
        return cell
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

