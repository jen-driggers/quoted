//
//  Quote.swift
//  Quoted
//
//  Created by Jennifer Driggers on 6/11/16.
//  Copyright © 2016 jennyd.info. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
    var imageName: String
    var uid: Int
//    static var nextUid = 0
//    static func generateUid() -> Int {
//        nextUid += 1
//        return nextUid
//    }
    
    
    init(imageName: String, uid: Int) {
        self.imageName = imageName
        self.uid = uid
//        self.uid = Quote.generateUid()
    }

}


