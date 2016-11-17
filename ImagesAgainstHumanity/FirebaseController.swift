//
//  FirebaseController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/22/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController  {
    
    enum ParseError: Error {
        case valueNotFound(key: String)
    }
    
    static let sharedController = FirebaseController()
    
    fileprivate let base = Firebase(url: "https://imagesagainsthumanit.firebaseio.com")
    
    func getThemes(_ completion: @escaping (_ data: AnyObject?) -> Void) {
        
        let objects = base?.child(byAppendingPath: "themeObjects")
        
        objects?.observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot?.value is NSNull {
                NSLog("no info for snapshot")
                completion(nil)
            } else {
                completion(snapshot?.value as AnyObject?)
            }
        })
        
    }
    
    func getThemeData(_ completion: @escaping (_ json: [String: AnyObject]?) -> Void){
        
        let objects = base?.child(byAppendingPath: "themes/\(ThemeController.sharedInstance.currentTheme!.name)")
        
        objects?.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if snapshot?.value is NSNull{
                completion(nil)
            } else {
                completion(snapshot?.value as? [String: AnyObject])
            }
            
        })
            
    }
    
    //this will go and fetch all theme titles in firebase
    func getThemesTitle(_ completion: @escaping (_ data: AnyObject?) -> Void) {
        
        let theme = base?.child(byAppendingPath: "themeNames")
        
        theme?.observe(.value, with: { (snapshot) in
            
            if snapshot?.value is NSNull{
                
                completion(nil)
                NSLog("no info for snapshot")
                
            } else {
                
                completion(snapshot?.value as AnyObject?)
                
//                if let themeTitle = snapshot.value as? [String] {
//                
//                    for theme in themeTitle {
//                        
//                        let theme = Theme.init(themeTitle: theme)
//                        
//                        ThemeController.sharedInstance.themeNames.append(theme!)
//                        
//                        
//                    }
//                }
            
            }
        })
    }
    
    // this will access a specific themes photo
    func getTheme(_ themePicked: String, completion: @escaping (_ data: AnyObject?) -> Void) {
        
        let theme = base?.child(byAppendingPath: "themes/\(themePicked)")
        
        theme?.observe(.value, with: { (snapshot) in
            
            if snapshot?.value is NSNull{
                
                completion(nil)
                NSLog("no info for snapshot")
                
            } else {
                
                let snapshotValue = snapshot?.value as? NSDictionary
               
                
                if let themeTitle = snapshotValue?[""] as? [String] {
                    
                    for _ in themeTitle {
//                        let theme  = Theme.init(themeTitle: theme)
                        
//                        ThemeController.sharedInstance.themes.append(theme!)
                        
                        
                    }
                }
                
            }
        })
    }


}


