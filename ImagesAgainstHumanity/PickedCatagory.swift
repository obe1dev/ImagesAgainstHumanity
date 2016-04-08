//
//  PickedCatagory.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 4/6/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import UIKit

struct PickedCatagory {
    
    let phrase:String?
    let themeImages:UIImage?
    
    private let phraseKey = "phrases"
    private let imageKey = "images"
    
    init(json: [String: AnyObject]) throws {
        
        guard let phrase = json[phraseKey] as? String else { throw FirebaseController.ParseError.ValueNotFound(key: phraseKey)}
        self.phrase = phrase
        
        guard let imageString = json[imageKey] as? String else { throw FirebaseController.ParseError.ValueNotFound(key: imageKey)}
        
        let decodedData = NSData(base64EncodedString: imageString, options: NSDataBase64DecodingOptions(rawValue: 0))
        
        self.themeImages = UIImage(data: decodedData!)
    }
    
    
    
    
}
/* model store selected image and phrases and current theme
 
 */
