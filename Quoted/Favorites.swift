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
    
    var areFavorites: [Int] = []
    
    func addToFavorites(id: Int) {
        print("i was called from view controller")
        areFavorites.append(id)
        
        // will need to replace this with actual quantity of favorites from database
    }
    
    
// JON'S EXAMPLES ON TWO WAYS TO ASSIGN PROPERTIES TO CLASS
    
//    var someVariable : SomeType
    
//    var someVariable : SomeType = someValue
    
    var stringValue : String {
        get {
            return String(quoteId!)
        }
    }


}
