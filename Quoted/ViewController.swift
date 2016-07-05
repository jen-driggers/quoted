//
//  ViewController.swift
//  Quoted
//
//  Created by Jennifer Driggers on 5/15/16.
//  Copyright © 2016 Jennifer Driggers. All rights reserved.
//

import UIKit
import CoreData

class ViewController:  UIViewController {
    
    // go back to code.tutsplus.com/tutorials/ios-from-scratch-with-swift-exploring-tab-bar-controller--cms-25470 to initialize tabs in view controllers
    
    @IBOutlet weak var quoteButton: UIButton!
    
    @IBOutlet weak var quoteView: UIImageView!
    
    @IBOutlet weak var favoritesButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentQuote : Quote! = nil
    
    var quotes:[Quote] = quotesArray

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
        let randomNumber = Int(arc4random_uniform(UInt32(quotes.count)))
        
        print("the number of quotes we have is \(quotes.count)")
        
        currentQuote = quotes[randomNumber]
        
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
    
    var favorites = [NSManagedObject]()

    @IBAction func favoriteAction(sender: UIButton) {
        
        do {
            if try isQuoteFavorited(currentQuote.uid) {
                favoritesButton.setTitle("delete favorite", forState: .Normal)
                print("i was clicked")
            } else {
                saveFavorite(currentQuote.uid)
                favoritesButton.setTitle("add to favorites", forState: .Normal)
            }
            
        } catch {
        }
        
    }
    
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }
    
    // this code will need to be moved to the favorites class somehow
    
    func saveFavorite(id: Int) {
        
        let managedContext = getContext()

        let entity =  NSEntityDescription.entityForName("Favorites",
                                                        inManagedObjectContext:managedContext)
        
        // TODO: Try to fetch the Favorite with quoteId == id.  If it doesn't exist, save the record.
        // TODO: If it DOES exist, then return without doing anything at all.
        let favorite = NSManagedObject(entity: entity!,
                                     insertIntoManagedObjectContext: managedContext)
      
        favorite.setValue(id, forKey: "quoteId")
        
        print("what is favorite \(favorite)")
        
        print("the quote that is being saved is \(favorite)")

        do {
            try managedContext.save()
            favorites.append(favorite)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    func isQuoteFavorited(id: Int) throws -> Bool {
        let managedContext = getContext()

        let fetch = NSFetchRequest(entityName: "Favorites")
        fetch.predicate = NSPredicate(format: "quoteId = %d", id)
        fetch.fetchLimit = 1 // Favorite.quoteId is unique, so we can have 0 or 1 rows anyway...
        
        let results = try managedContext.executeFetchRequest(fetch)
        return results.count > 0
        
    }
    
    
}

