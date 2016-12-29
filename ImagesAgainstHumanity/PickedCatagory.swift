//
//  PickedCatagory.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 4/6/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PickedCatagory: NSManagedObject {
    
    @NSManaged var phrases:[String]
    @NSManaged var themeImages:[String]
    
    fileprivate let phraseKey = "phrases"
    fileprivate let imageKey = "images"
    
    convenience init(phrases: [String], themeImages: [String]) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entity(forEntityName: "PickedCatagory", in: context)!
        
        self.init(entity: entity, insertInto: context)
        
        self.phrases = phrases
        self.themeImages = themeImages
        
    }
    
//    init(json: [String: AnyObject]) throws {
//        
//        
//        guard let phrases = json[phraseKey] as? [String] else { throw FirebaseController.ParseError.valueNotFound(key: phraseKey)}
//        self.phrases = phrases
//        
//        guard let imageString = json[imageKey] as? [String] else { throw FirebaseController.ParseError.valueNotFound(key: imageKey)}
//        
////        let decodedData = NSData(base64EncodedString: imageString, options: NSDataBase64DecodingOptions(rawValue: 0))
//        
//        self.themeImages = imageString
//        //TODO: convet one image from the theme after randomly picked
//    }
    
    
    
    
}
/* model store selected image and phrases and current theme
 
 */
