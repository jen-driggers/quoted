//
//  Quote.swift
//  Quoted
//
//  Created by Jennifer Driggers on 6/11/16.
//  Copyright © 2016 jennyd.info. All rights reserved.
//

// you'll want to  consolidate quote and favorite together

import UIKit
import CoreData

class Quote: NSObject {
    
    var imageName: String
    var uid: Int
    var authorName: String
    var textQuote: String
    
    
    init(imageName: String, uid: Int, authorName: String, textQuote: String) {
        self.imageName = imageName
        self.uid = uid
        self.authorName = authorName
        self.textQuote = textQuote
    }
    
    static func setup() {
        for quote in quotesArray {
            quote.saveFavorite()
        }
    }
    
    func saveFavorite() {
        
        let fetchRequest = NSFetchRequest(entityName: "Favorites")
        
        fetchRequest.predicate = NSPredicate(format: "quoteId = %d", uid)
        fetchRequest.fetchLimit = 1 // Favorite.quoteId is unique, so we can have 0 or 1 rows anyway...
        guard try! AppDelegate.context.executeFetchRequest(fetchRequest).first as? Favorites == nil else {
            return
        }
        // will need to do a do try here if it fails to save
        
        let entity =  NSEntityDescription.entityForName("Favorites",
                                                        inManagedObjectContext:AppDelegate.context)
        
        let favorite = NSManagedObject(entity: entity!,
                                       insertIntoManagedObjectContext: AppDelegate.context) as! Favorites
        
        favorite.quoteId = self.uid
        
        favorite.imageName = self.imageName
        
        favorite.authorName = self.authorName
        
        favorite.textQuote = self.textQuote
        
        print("what is favorite \(favorite)")
        
        print("the quote that is being saved is \(favorite)")
        
        do {
            try AppDelegate.context.save()
            //                favorites.append(favorite)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
//    let quotes = quotesArray
    
//    var quotes:[Quote] = quotesArray
    
//    var quotes = QuoteSamples.quotesArray
    
//    var randomNumber = Int(arc4random_uniform(UInt32(quotesArray.count)))
    

}


