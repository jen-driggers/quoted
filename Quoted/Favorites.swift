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
    
//    var someVariable : SomeType
    
//    var someVariable : SomeType = someValue
    
    var stringValue : String {
        get {
            return String(quoteId!)
        }
    }
//    var stringValue = String(quoteId)
    
    //TODO: figure out how to initialize this class with the Quote id

//    var id: NSInteger?
//    
//    init(id: NSInteger?) {
//        self.id = id
//    }
    
//    required init(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    class func newInstance(id: Int, context: NSManagedObjectContext) -> Favorites {
//        var favorites = NSEntityDescription.insertNewObjectForEntityForName("Favorites",
//                                                                       inManagedObjectContext: context) as! Favorites
//        favorites.id
//        return favorites
    //}

}
