//
//  Favorites.swift
//  Quoted
//
//  Created by Jennifer Driggers on 6/25/16.
//  Copyright © 2016 jennyd.info. All rights reserved.
//

// do not want duplicates in terms of models which is why we pulled all of quote attributes into the Favorites model which you would need to be tracking anyway
// ToDo name Favorites entity "Quote" in the visual model make sure to chang ethe name and class to Quote and you'll need to update Favorites to Quote throughout the app

// will need to add deletefromfavorites method that is opposite of addtofavorites

// kept fetch request internal to the class

// static functions apply to every favorites object 

import Foundation
import CoreData


class Favorites: NSManagedObject {
    
    func addToFavorites() {
        print("i was called from view controller")
        
        self.isFavorite = true
        
        do {
            try self.managedObjectContext?.save()
        } catch {
            print("Failed to save")
        }
//        areFavorites.append(id)
        
        // will need to replace this with actual quantity of favorites from database
    }
    
    var isFavorite : Bool {
        get {
            return favorites as Bool
        }
        
        set(newValue) {
            favorites = newValue
        }
    }
    
    static func favoriteForId(id: Int) -> Favorites {
        let managedContext = AppDelegate.context
        
        let fetch = NSFetchRequest(entityName: "Favorites")
        fetch.predicate = NSPredicate(format: "quoteId = %d", id)
        fetch.fetchLimit = 1 // Favorite.quoteId is unique, so we can have 0 or 1 rows anyway...
        
        let results = try! managedContext.executeFetchRequest(fetch)
        return results.first as! Favorites
        // will need to add an error here for potential of running out of disc space
        
        
    }
    
    
// JON'S EXAMPLES ON TWO WAYS TO ASSIGN PROPERTIES TO CLASS
    
//    var someVariable : SomeType
    
//    var someVariable : SomeType = someValue
    
    var stringValue : String {
        get {
            return String(quoteId)
        }
    }


}
