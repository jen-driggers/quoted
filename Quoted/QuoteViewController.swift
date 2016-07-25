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

class QuoteViewController:  UIViewController {
    
    // go back to code.tutsplus.com/tutorials/ios-from-scratch-with-swift-exploring-tab-bar-controller--cms-25470 to initialize tabs in view controllers
    
    @IBOutlet weak var quoteButton: UIButton!
    
    @IBOutlet weak var quoteView: UIImageView!
    
    @IBOutlet weak var favoritesButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    var currentQuote : Quote! = nil
    
    var allQuotes:[AnyObject] = []
    
    var theQuote : Quote?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: should the title be a snippet of the quote, or the book name, or something else?
        title = "Quote"
        
        fetchQuotes()
    
    }
    
    
    func fetchQuotes() {
        let managedContext = AppDelegate.context
        
        let idFetch = NSFetchRequest(entityName: "Quote")
        
        let primarySortDescriptor = NSSortDescriptor(key: "quoteId", ascending: true)
        
        idFetch.sortDescriptors = [primarySortDescriptor]
        
        let quotes = (try! managedContext.executeFetchRequest(idFetch)) as! [Quote]
        
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
        
        let randomNumber = Int(arc4random_uniform(UInt32(allQuotes.count)))
        
        //TODO: add logic here that checks if a quote id has been passed from the table, otherwise the currentQuote is random
        currentQuote = allQuotes[randomNumber] as! Quote
        
        quoteLabel.text = currentQuote.textQuote

        print("current quote is \(currentQuote!.imageName), and the quoteId is \(currentQuote!.quoteId)");
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

