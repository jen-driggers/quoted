//
//  Quote.swift
//  Quoted
//
//  Created by Jennifer Driggers on 7/14/16.
//  Copyright © 2016 jennyd.info. All rights reserved.
//

import Foundation
import CoreData


class Quote: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
//    var imageName: String
//    var quoteId: Int
//    var bookName: String
//    var textQuote: String
    
    
//    init(imageName: String, uid: Int, bookName: String, textQuote: String) {
//        self.imageName = imageName
//        self.uid = uid
//        self.bookName = bookName
//        self.textQuote = textQuote
//    }
    
//    static func setup() {
//        for quote in quotesArray {
//            quote.saveFavorite()
//        }
//    }
    

    
    func saveFavorite() {
        
        let fetchRequest = NSFetchRequest(entityName: "Quote")
        
        fetchRequest.predicate = NSPredicate(format: "quoteId = %d", quoteId)
        
        fetchRequest.fetchLimit = 1 // Quote.quoteId is unique, so we can have 0 or 1 rows anyway...
        
        guard try! AppDelegate.context.executeFetchRequest(fetchRequest).first as? Quote == nil else {
            return
        }
        // will need to do a do try here if it fails to save
        
        let entity =  NSEntityDescription.entityForName("Quote",
                                                        inManagedObjectContext:AppDelegate.context)
        
        let quote = NSManagedObject(entity: entity!,
                                       insertIntoManagedObjectContext: AppDelegate.context) as! Quote
        
        quote.quoteId = self.quoteId
        
        quote.imageName = self.imageName
        
        quote.bookName = self.bookName
        
        quote.textQuote = self.textQuote
        
        print("what is favorite \(quote)")
        
        print("the quote that is being saved is \(quote)")
        
        do {
            try AppDelegate.context.save()
            //                favorites.append(favorite)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    // ADDED FROM FAVORITES
    
    func addToFavorites() {
        print("add to favorites was called")
        
        print("the author name is \(self.bookName)")
        
        self.favorites = true
        
        do {
            try self.managedObjectContext?.save()
        } catch {
            print("Failed to save")
        }
        
    }
    
    func deleteFromFavorites() {
        print("delete from favorites was called")
        
        self.favorites = false
        
        do {
            try self.managedObjectContext?.save()
        } catch {
            print("Failed to delete")
        }
        
    }
    
//    var isFavorite : Bool {
//        get {
//            return favorites 
//        }
//        
//        set(newValue) {
//            favorites = newValue
//        }
//    }
    
//    static func favoriteForId(id: Int) -> Quote {
//        let managedContext = AppDelegate.context
//        
//        let fetch = NSFetchRequest(entityName: "Quote")
//        
//        fetch.predicate = NSPredicate(format: "quoteId = %d", id)
//        
//        fetch.fetchLimit = 1 // Favorite.quoteId is unique, so we can have 0 or 1 rows anyway...
//        
//        let results = try! managedContext.executeFetchRequest(fetch)
//        
//        return results.first as! Quote
//        // will need to add an error here for potential of running out of disc space
//        
//    }
    
    var stringValue : String {
        get {
            return String(quoteId)
        }
    }

}
