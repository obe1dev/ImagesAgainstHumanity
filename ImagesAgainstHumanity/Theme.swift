//
//  Themes.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/16/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Theme: NSManagedObject {
    
    //MARK: properties
    
    @NSManaged var name: String
    @NSManaged var coverImage: UIImage?
    
    //    var themeTitle: String?
    //    var images: [UIImage]?
    //    var phrases: [String]?
    
    //    convenience init(images: UIImage?, phrases: String?) {
    //        self.init(images: images , phrases: phrases)
    //    }
    
    
    // MARK: - Keys
    
//    fileprivate let nameKey = "name"
//    fileprivate let imageKey = "image"
//    
//   init(json: [String: AnyObject], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) throws {
//    
//    guard let name = json[self.nameKey] as? String else { throw FirebaseController.ParseError.valueNotFound(key:self.nameKey) }
//        self.name = name
//        guard let imageString = json[self.imageKey] as? String else { throw FirebaseController.ParseError.valueNotFound(key: self.imageKey) }
//        
//        let decodedData = Data(base64Encoded: imageString, options: NSData.Base64DecodingOptions(rawValue: 0))
//        
//        coverImage = UIImage(data: decodedData!)
//    
//        
//        
//    }
    
    convenience init(name: String, coverImage: UIImage, timestamp: Date = Date(), context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Theme", in: context)!
        
        self.init(entity: entity, insertInto: context)
        
        self.name = name
        self.coverImage = coverImage
        
    }
    
//init(name: String, coverImage: UIImage) {
//        let context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext
//        
//        //retrieve the entity that we just created
//        let entity =  NSEntityDescription.entity(forEntityName: "Theme", in: context)
//        
//        let transc = NSManagedObject(entity: entity!, insertInto: context)
//        
//        //set the entity values
//        transc.setValue(name, forKey: "name")
//        transc.setValue(coverImage, forKey: "coverImage")
//        
//        
//        //save the object
//        do {
//            try context.save()
//            print("saved!")
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
//    }
    
    
    
    //    init?(themeTitle: String?, images: UIImage? = nil, phrases: String? = nil){
    //        self.themeTitle = themeTitle
    //        self.images?.append(images!)
    //        self.phrases?.append(phrases!)
    //    }
    
    //    init(themeTitle: String?, images: UIImage?, phrases: String?) {
    //        self.themeTitle?.append(themeTitle!)
    //        self.images?.append(images!)
    //        self.phrases?.append(phrases!)
    //    }
    
}



