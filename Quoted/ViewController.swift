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
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    var currentQuote : Quote! = nil
    
    var allQuotes:[AnyObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        switchToRandomQuote()
        
        fetchQuotes()
    
    }
    
    
    func fetchQuotes() {
        let managedContext = AppDelegate.context
        
        let idFetch = NSFetchRequest(entityName: "Quote")
        
        let primarySortDescriptor = NSSortDescriptor(key: "quoteId", ascending: true)
        
        idFetch.sortDescriptors = [primarySortDescriptor]
        
        let quotes = (try! managedContext.executeFetchRequest(idFetch)) as! [Quote]
        
        // this loop does work to append quote to allquotes
        for quote in quotes {
            allQuotes.append(quote)
            print("the number of quotes we have is \(allQuotes.count) from view controller")
            print("\(quote.textQuote)")
        }
        
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
//        let randomNumber = Int(arc4random_uniform(UInt32(allQuotes.count)))
        
//        let quotes = quotesSaved.numberOfQuotes
//        
//        let randomNumber = Int(arc4random_uniform(UInt32(quotes.count)))
//        
//        print("the number of quotes we have is \(allQuotes.count) from view controller")
//
//        currentQuote = quotes[randomNumber]
        
//        var favorites = Quote.favoriteForId(randomNumber)
        // favorites is all favorites with random number set to their id
        
        // removed imageview to start experimenting with text display
        // quoteView.image = UIImage(named: currentQuote!.imageName)
        
//        quoteLabel.text = currentQuote.textQuote
//        
//        print("current quote is \(currentQuote!.imageName), and the quoteId is \(currentQuote!.quoteId)");
//        
//        // check if currentQuote.favorites == true
//        
//        do {
//            if try currentQuote.favorites == true {
//                favoritesButton.setTitle("delete favorite", forState: .Normal)
//            } else {
//                favoritesButton.setTitle("add to favorites", forState: .Normal)
//            }
//        } catch {
//            
//        }
        
//        do {
//            if try isQuoteFavorited(currentQuote!.quoteId) {
//                favoritesButton.setTitle("delete favorite", forState: .Normal)
//            } else {
//                favoritesButton.setTitle("add to favorites", forState: .Normal)
//            }
//            
//        } catch {
//        }
        
    }
    

//    @IBAction func favoriteAction(sender: UIButton) {
//        
//        do {
//            if try currentQuote.favorites == true {
//                
//                favoritesButton.setTitle("delete favorite", forState: .Normal)
//                
//                currentQuote.addToFavorites()
//                
//            } else {
//                
//                favoritesButton.setTitle("add to favorites", forState: .Normal)
//                
//                currentQuote.deleteFromFavorites()
//            }
//            
//        } catch {
//            
//        }
    
        
//        do {
//            if try isQuoteFavorited(currentQuote.quoteId) == false {
//                // if fetched id is not equal to quote id
//                favoritesButton.setTitle("delete favorite", forState: .Normal)
//                
//                favorites.bookName = currentQuote.bookName
//                
//                favorites.addToFavorites()
//            } else {
//                favoritesButton.setTitle("add to favorites", forState: .Normal)
//                favorites.deleteFromFavorites()
//            }
//            
//        } catch {
//        }
        
        
    }
    
    
    
    
//    func isQuoteFavorited(id: Int) throws -> Bool {
//        let managedContext = AppDelegate.context
//
//        let fetch = NSFetchRequest(entityName: "Quote")
//        
//        fetch.predicate = NSPredicate(format: "quoteId = %d AND favorites = 1", id)
//        // gets the quote id and checks if true? from the saved quotes
//        
//        fetch.fetchLimit = 1 // Favorite.quoteId is unique, so we can have 0 or 1 rows anyway...
//        
//        let results = try managedContext.executeFetchRequest(fetch)
//        
//        return results.count > 0
//        
//    }
    

    
    
//}

