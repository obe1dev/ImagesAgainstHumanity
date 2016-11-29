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
        
        
        let backgroundColor = UIColor().backgroundColor()
        let textColor = UIColor.white
        
        //nav bar
        let nav = UINavigationBar.appearance()
        
        nav.barTintColor = UIColor().darkColor()
        nav.tintColor = textColor
        nav.titleTextAttributes = [NSForegroundColorAttributeName: textColor]
        
        //collectionView
        let collection = UICollectionView.appearance()
        
        collection.backgroundColor = backgroundColor
        
        //tabelView
        let tableView = UITableView.appearance()
        
        tableView.backgroundColor = backgroundColor
        UITableViewCell.appearance().backgroundColor = backgroundColor
        
        //labels
        let label = UILabel.appearance()
        label.textColor = textColor
        
    }
    
    
}


extension UIColor {
    
    func backgroundColor() -> UIColor {
        return UIColor().lightGrey()
    }
    
    func cardColor() -> UIColor {
        return UIColor().lightRed()
    }
    
    func lightGreen() -> UIColor {
        return UIColor(red: 237/255, green: 255/255, blue: 236/255, alpha: 1.0)
    }
    
    func darkGreen() -> UIColor {
        return UIColor(red: 97/255, green: 231/255, blue: 134/255, alpha: 1.0)
    }
    
    func darkColor() -> UIColor {
        return UIColor(red: 43/255, green: 45/255, blue: 66/255, alpha: 1.0)
    }
    
    func darkRed() -> UIColor {
        return UIColor(red: 217/255, green: 4/255, blue: 41/255, alpha: 1.0)
    }
    
    func lightRed() -> UIColor {
        return UIColor(red: 239/255, green: 35/255, blue: 60/255, alpha: 1.0)
    }
    
    func grey() -> UIColor {
        return UIColor(red: 141/255, green: 153/255, blue: 174/255, alpha: 1.0)
    }
    
    func lightGrey() -> UIColor {
        return UIColor(red: 237/255, green: 242/255, blue: 244/255, alpha: 1.0)
    }
    
}
