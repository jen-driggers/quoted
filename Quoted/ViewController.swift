//
//  ViewController.swift
//  Quoted
//
//  Created by Jennifer Driggers on 5/15/16.
//  Copyright © 2016 Jennifer Driggers. All rights reserved.
//

// Favorites is an explicitly unwrapped optional here, there is no initial value, you get a value when you switch to a random quote

// NSattributedString

import UIKit
import CoreData

class ViewController:  UIViewController {
    
    // initialize integer value for current quote? initialize quoteview with an integer value?
    
    // go back to code.tutsplus.com/tutorials/ios-from-scratch-with-swift-exploring-tab-bar-controller--cms-25470 to initialize tabs in view controllers
    
    @IBOutlet weak var quoteButton: UIButton!
    
    @IBOutlet weak var quoteView: UIImageView!
    
    @IBOutlet weak var favoritesButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentQuote : Quote! = nil
    
    var quotes:[Quote] = quotesArray
    
    var favorites : Favorites!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchToRandomQuote()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playButton(sender: UIButton) {
        switchToRandomQuote()
    }
    
    func switchToRandomQuote() {
        
//        Sam had me add a 1 because my samples array started out at 1 and not 0
//        let randomNumber = Int(arc4random_uniform(UInt32(quotes.count))) + 1
        
        let randomNumber = Int(arc4random_uniform(UInt32(quotes.count)))
        
        print("the number of quotes we have is \(quotes.count)")
        
        currentQuote = quotes[randomNumber]
        
        favorites = Favorites.favoriteForId(randomNumber)
        // favorites is all favorites with random number set to their id
        
        quoteView.image = UIImage(named: currentQuote!.imageName)
        
        print("current quote is \(currentQuote!.imageName), and the uid is \(currentQuote!.uid)");
        
        do {
            if try isQuoteFavorited(currentQuote!.uid) {
                favoritesButton.setTitle("delete favorite", forState: .Normal)
            } else {
                favoritesButton.setTitle("add to favorites", forState: .Normal)
            }
            
        } catch {
        }
        
    }
    

    @IBAction func favoriteAction(sender: UIButton) {
        
        
        do {
            if try isQuoteFavorited(currentQuote.uid) == false {
                // if fetched id is not equal to quote id
                favoritesButton.setTitle("delete favorite", forState: .Normal)
                
                favorites.authorName = currentQuote.authorName
                
                favorites.addToFavorites()
            } else {
                favoritesButton.setTitle("add to favorites", forState: .Normal)
                favorites.deleteFromFavorites()
            }
            
        } catch {
        }
        
        
    }
    
    
    // code will need to be moved to the favorites class somehow
    
    
    func isQuoteFavorited(id: Int) throws -> Bool {
        let managedContext = AppDelegate.context

        let fetch = NSFetchRequest(entityName: "Favorites")
        
        fetch.predicate = NSPredicate(format: "quoteId = %d AND favorites = 1", id)
        // gets the quote id and checks if true? from the saved quotes
        
        fetch.fetchLimit = 1 // Favorite.quoteId is unique, so we can have 0 or 1 rows anyway...
        
        let results = try managedContext.executeFetchRequest(fetch)
        
        return results.count > 0
        
    }
    

    
    
}

