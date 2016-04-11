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
    
    enum ParseError: ErrorType {
        case ValueNotFound(key: String)
    }
    
    static let sharedController = FirebaseController()
    
    private let base = Firebase(url: "https://imagesagainsthumanit.firebaseio.com")
    
    func getThemes(completion: (data: AnyObject?) -> Void) {
        
        let objects = base.childByAppendingPath("themeObjects")
        
        objects.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            if snapshot.value is NSNull {
                NSLog("no info for snapshot")
                completion(data: nil)
            } else {
                completion(data: snapshot.value)
            }
        })
        
    }
    
    func getThemeData(completion: (data: AnyObject?) -> Void){
        
        let objects = base.childByAppendingPath("themes/\(ThemeController.sharedInstance.currentTheme)")
        
        objects.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            
            if snapshot.value is NSNull{
                completion(data: nil)
            } else {
                completion(data: snapshot.value)
            }
            
        })
    
    }
    
    //this will go and fetch all theme titles in firebase
    func getThemesTitle(completion: (data: AnyObject?) -> Void) {
        
        let theme = base.childByAppendingPath("themeNames")
        
        theme.observeEventType(.Value, withBlock: { (snapshot) in
            
            if snapshot.value is NSNull{
                
                completion(data: nil)
                NSLog("no info for snapshot")
                
            } else {
                
                completion(data: snapshot.value)
                
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
    func getTheme(themePicked: String, completion: (data: AnyObject?) -> Void) {
        
        let theme = base.childByAppendingPath("themes/\(themePicked)")
        
        theme.observeEventType(.Value, withBlock: { (snapshot) in
            
            if snapshot.value is NSNull{
                
                completion(data: nil)
                NSLog("no info for snapshot")
                
            } else {
                
                if let themeTitle = snapshot.value[""] as? [String] {
                    
                    for theme in themeTitle {
//                        let theme  = Theme.init(themeTitle: theme)
                        
//                        ThemeController.sharedInstance.themes.append(theme!)
                        
                        
                    }
                }
                
            }
        })
    }

    
//    func setupFirebase() {
//        // *** STEP 2: SETUP FIREBASE
//        messagesRef = Firebase(url: "https://swift-chat-dev.firebaseio.com/messages")
//        
//        // *** STEP 4: RECEIVE MESSAGES FROM FIREBASE (limited to latest 25 messages)
//        messagesRef.queryLimitedToNumberOfChildren(25).observeEventType(FEventType.ChildAdded, withBlock: { (snapshot) in
//            let text = snapshot.value["text"] as? String
//            let sender = snapshot.value["sender"] as? String
//            let imageUrl = snapshot.value["imageUrl"] as? String
//            
//            let message = Message(text: text, sender: sender, imageUrl: imageUrl)
//            self.messages.append(message)
//            self.finishReceivingMessage()
//        })
//    }
//    
//    func sendMessage(text: String!, sender: String!) {
//        // *** STEP 3: ADD A MESSAGE TO FIREBASE
//        messagesRef.childByAutoId().setValue([
//            "text":text,
//            "sender":sender,
//            "imageUrl":senderImageUrl
//            ])
//    }

    
    
}


