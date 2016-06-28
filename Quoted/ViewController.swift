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
    
    @IBOutlet weak var quoteButton: UIButton!
    
    @IBOutlet weak var quoteView: UIImageView!
    
    @IBOutlet weak var favoritesButton: UIButton!
    
    var quotesArray =
        [Quote(imageName: "grendel", uid: 1),
         Quote(imageName: "catcher", uid: 2),
         Quote(imageName: "design", uid: 3),
         Quote(imageName: "stranger", uid: 4),
         Quote(imageName: "alchemist", uid: 5),
         Quote(imageName: "vendetta", uid: 6),
         Quote(imageName: "watchmen", uid: 7),
         Quote(imageName: "bfg", uid: 8),
         Quote(imageName: "alice", uid: 9),
         Quote(imageName: "grapes", uid: 10),
         Quote(imageName: "naked", uid: 11),
         Quote(imageName: "neuromancer", uid: 12),
         Quote(imageName: "thinking", uid: 13),
         Quote(imageName: "voice", uid: 14),
         Quote(imageName: "american", uid: 15),
         Quote(imageName: "good", uid: 16),
         Quote(imageName: "astro", uid: 17),
         Quote(imageName: "atlas", uid: 18),
         Quote(imageName: "blankets", uid: 19),
         Quote(imageName: "castle", uid: 20),
         Quote(imageName: "dhalgren", uid: 21),
         Quote(imageName: "dune", uid: 22),
         Quote(imageName: "ender", uid: 23),
         Quote(imageName: "flying", uid: 23),
         Quote(imageName: "geek", uid: 24),
         Quote(imageName: "gormenghast", uid: 25),
         Quote(imageName: "history", uid: 25),
         Quote(imageName: "ice", uid: 25),
         Quote(imageName: "jest", uid: 26),
         Quote(imageName: "justine", uid: 27),
         Quote(imageName: "killing", uid: 28),
         Quote(imageName: "margarita", uid: 29),
         Quote(imageName: "road", uid: 30),
         Quote(imageName: "saga", uid: 31),
         Quote(imageName: "spake", uid: 32),
         Quote(imageName: "speedboat", uid: 33),
         Quote(imageName: "stoner", uid: 34),
         Quote(imageName: "unbearable", uid: 35),
         Quote(imageName: "wallflower", uid: 36),
         Quote(imageName: "zen", uid: 37)]
    
    var currentQuote : Quote! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchToRandomQuote()
    
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playButton(sender: UIButton) {
        switchToRandomQuote()
    }
    
    func switchToRandomQuote() {
        let randomNumber = Int(arc4random_uniform(UInt32(quotesArray.count)))
        
        currentQuote = quotesArray[randomNumber]
        
        quoteView.image = UIImage(named: currentQuote!.imageName)
        
        print("current quote is \(currentQuote!.imageName), and the uid is \(currentQuote!.uid)");
        
        
    }
    
    var favorites = [NSManagedObject]()

    @IBAction func favoriteAction(sender: UIButton) {
        // We need to see if it's already in the favorites table.  If so, the title of favoritesButton should be set to "Add to Favorites" and if not then it should be set to "Remove from Favorites".  Similarly, we should add/remove as needed.  The title needs to match what the button will do if the user presses it again, not what we're doing right now.
        
        //favoritesButton.setTitle("Added to Favorites", forState: .Normal)
                
        saveFavorite(currentQuote!.uid)
        
        fetchFavorites()
        
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }
    
    func saveFavorite(id: Int) {
        
        let managedContext = getContext()

        let entity =  NSEntityDescription.entityForName("Favorites",
                                                        inManagedObjectContext:managedContext)
        
        // TODO: Try to fetch the Favorite with quoteId == id.  If it doesn't exist, save the record.
        // TODO: If it DOES exist, then return without doing anything at all.
        let favorite = NSManagedObject(entity: entity!,
                                     insertIntoManagedObjectContext: managedContext)
      
        favorite.setValue(id, forKey: "quoteId")

        do {
            try managedContext.save()
            favorites.append(favorite)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
//        fetchFavorites()
        
    }
    
    func isQuoteFavorited(id: Int) throws -> Bool {
        let managedContext = getContext()

        let fetch = NSFetchRequest(entityName: "Favorites")
        fetch.predicate = NSPredicate(format: "quoteId = %d", id)
        fetch.fetchLimit = 1 // Favorite.quoteId is unique, so we can have 0 or 1 rows anyway...
        
        let results = try managedContext.executeFetchRequest(fetch)
        return results.count == 1
    }
    
    func fetchFavorites() {
        
        print("fetchFavorites was called")
        
//        let managedContext = getContext()
        
//        let fetchRequest = NSFetchRequest(entityName: "Favorites")
        
//        do {
//            let results = try managedContext.executeFetchRequest(fetchRequest)
//            
//            print("these are all the quotes in results array")
//            
//            for i in 0 ..< results.count {
//                
//                let counter = results[i] as! NSManagedObject
//                
//                let quote = counter.valueForKey("quoteId")
//                
//                let quoteNS = quote as? NSNumber
//                
//                let quoteNumber = quoteNS as? Int
//                
//                print("quoteNumber is \(quoteNumber)")
//                
//                updateFavorites(quoteNumber!)
//                
//                print("quote id is \(quote)")
//            }
//
//            
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//        }
        
    }
    
    func updateFavorites(quoteNumber: Int) -> Int {
         print("quote value is \(quoteNumber)")
        
        if (quoteNumber == currentQuote.uid) {
            saveFavorite(quoteNumber)
            favoritesButton.setTitle("Added to Favorites", forState: .Normal)
            print("quote value is \(quoteNumber)")
        } else {
            favoritesButton.setTitle("Removed from Favorites", forState: .Normal)
            print("I'm not saving it")
        }
        
        return quoteNumber
        
    }


}

