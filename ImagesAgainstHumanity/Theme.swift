//
//  Themes.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/16/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    
    //MARK: properties
    
    let name: String
    let coverImage: UIImage?
    
//    var themeTitle: String?
//    var images: [UIImage]?
//    var phrases: [String]?
    
//    convenience init(images: UIImage?, phrases: String?) {
//        self.init(images: images , phrases: phrases)
//    }
    
    // MARK: - Keys
    
    private let nameKey = "name"
    private let imageKey = "image"
    
    init(json: [String: AnyObject]) throws {
        guard let name = json[nameKey] as? String else { throw FirebaseController.ParseError.ValueNotFound(key: nameKey) }
        self.name = name
        guard let imageString = json[imageKey] as? String else { throw FirebaseController.ParseError.ValueNotFound(key: imageKey) }
        // convert image and save it
        coverImage = nil // change this when you have converted the image
    }
    
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

/* model store selected image and phrases and current theme
 
 */


