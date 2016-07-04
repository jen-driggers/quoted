//
//  Favorites.swift
//  Quoted
//
//  Created by Jennifer Driggers on 6/25/16.
//  Copyright © 2016 jennyd.info. All rights reserved.
//

import Foundation
import CoreData


class Favorites: NSManagedObject {
    
    var areFavorites = []
    
// JON'S EXAMPLES ON TWO WAYS TO ASSIGN PROPERTIES TO CLASS
    
// I need to add logic to save and delete favorites here
    
// do i need to create a subclass of favorites for the current quote? (or random quote)
    
//    var someVariable : SomeType
    
//    var someVariable : SomeType = someValue
    
    var stringValue : String {
        get {
            return String(quoteId!)
        }
    }


}
