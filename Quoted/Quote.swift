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
    
    init(imageName: String, uid: Int) {
        self.imageName = imageName
        self.uid = uid
    }

}


