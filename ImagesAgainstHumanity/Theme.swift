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
    
    var themeTitle: String?
    var images: [UIImage]?
    var phrases: [String]?
    
//    convenience init(images: UIImage?, phrases: String?) {
//        self.init(images: images , phrases: phrases)
//    }
    
    init?(themeTitle: String?, images: UIImage? = nil, phrases: String? = nil){
        self.themeTitle = themeTitle
        self.images?.append(images!)
        self.phrases?.append(phrases!)
    }
    
//    init(themeTitle: String?, images: UIImage?, phrases: String?) {
//        self.themeTitle?.append(themeTitle!)
//        self.images?.append(images!)
//        self.phrases?.append(phrases!)
//    }
    
}


