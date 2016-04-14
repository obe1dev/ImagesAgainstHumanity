//
//  PickedCatagoryController.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 4/6/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation
import UIKit

class PickedCatagoryController {
    
    static let sharedInstance = PickedCatagoryController()
    
    private(set) var currentTheme: PickedCatagory?
    var randomNum: Int = 0
    var pickedImage = UIImage()
    
    func fetchThemeData(completion: (success: Bool) -> Void){
        
        FirebaseController.sharedController.getThemeData { json in

            guard let json = json else {
                completion(success: false)
                return
            }
            
            self.currentTheme = nil
            
            do {
                let theme = try PickedCatagory(json: json)
                self.currentTheme = theme
                completion(success: true)
            } catch {
                print("Error parsing Theme: \(json)")
                completion(success: false)
            }
            
            
        }
    }

    
    func getRandomNum(array: NSArray) {
        
        let numberOfThemes = array.count
        
        randomNum = Int(arc4random_uniform(UInt32(numberOfThemes)) + 1)
        
    }
    
    func decodeImage(image: NSString) {
        
        let decodeData = NSData(base64EncodedString: image as String, options: NSDataBase64DecodingOptions(rawValue: 0))
        
        pickedImage = UIImage(data: decodeData!)!
        
    }
    
}



