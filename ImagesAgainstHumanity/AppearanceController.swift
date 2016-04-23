//
//  AppearanceController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 4/22/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import UIKit

class AppearanceController {
    

    static func initApper(){
        
        
        let backgroundColor = UIColor().grey()
        let textColor = UIColor.whiteColor()
        
        //nav bar
        let nav = UINavigationBar.appearance()
        
        nav.barTintColor = UIColor().darkPurple()
        nav.tintColor = textColor
        nav.titleTextAttributes = [NSForegroundColorAttributeName: textColor]
        
        //collectionView
        let collection = UICollectionView.appearance()
        
        collection.backgroundColor = backgroundColor
        
        //tabelView
        let tableView = UITableView.appearance()
        
        tableView.backgroundColor = backgroundColor
        UITableViewCell.appearance().backgroundColor = backgroundColor

    }
    
    
}

extension UIColor {
    
    func lightGreen() -> UIColor {
        return UIColor(red: 237/255, green: 255/255, blue: 236/255, alpha: 1.0)
    }
    
    func darkGreen() -> UIColor {
        return UIColor(red: 97/255, green: 231/255, blue: 134/255, alpha: 1.0)
    }
    
    func darkPurple() -> UIColor {
        return UIColor(red: 7/255, green: 6/255, blue: 12/255, alpha: 1.0)
    }
    
    func medPink() -> UIColor {
        return UIColor(red: 175/255, green: 1/255, blue: 135/255, alpha: 1.0)
    }
    
    func lightPink() -> UIColor {
        return UIColor(red: 237/255, green: 0/255, blue: 211/255, alpha: 1.0)
    }
    
    func grey() -> UIColor {
        return UIColor(red: 203/255, green: 203/255, blue: 203/255, alpha: 1.0)
    }
    
    
    
}