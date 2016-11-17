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
    
    let phrases:[String]
    let themeImages:[String]
    
    fileprivate let phraseKey = "phrases"
    fileprivate let imageKey = "images"
    
    init(json: [String: AnyObject]) throws {
        
        
        guard let phrases = json[phraseKey] as? [String] else { throw FirebaseController.ParseError.valueNotFound(key: phraseKey)}
        self.phrases = phrases
        
        guard let imageString = json[imageKey] as? [String] else { throw FirebaseController.ParseError.valueNotFound(key: imageKey)}
        
//        let decodedData = NSData(base64EncodedString: imageString, options: NSDataBase64DecodingOptions(rawValue: 0))
        
        self.themeImages = imageString
        //TODO: convet one image from the theme after randomly picked
    }
    
    
    
    
}
/* model store selected image and phrases and current theme
 
 */
