//
//  ViewController.swift
//  Quoted
//
//  Created by Jennifer Driggers on 5/15/16.
//  Copyright © 2016 Jennifer Driggers. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    
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
         Quote(imageName: "zen", uid: 37),]
    
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
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return favorites.count
//    }
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
//        -> UITableViewCell {
//            let cell = tableView.dequeueReusableCellWithIdentifier("FavoritesCell", forIndexPath: indexPath)
//                as! PlayerCell
//            
//            let favorite = favorites[indexPath.row] as Favorite
//            cell.favorite = favorite
//            return cell
//    }

    @IBAction func favoriteAction(sender: UIButton) {
        
        favoritesButton.setTitle("Added to Favorites", forState: .Normal)
        
        saveFavorite(currentQuote!.uid)
    }
    
    func saveFavorite(id: Int) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

        let managedContext = appDelegate.managedObjectContext

        let entity =  NSEntityDescription.entityForName("Favorites",
                                                        inManagedObjectContext:managedContext)
        
        let favorite = NSManagedObject(entity: entity!,
                                     insertIntoManagedObjectContext: managedContext)
      
        favorite.setValue(id, forKey: "quoteId")

        do {
            try managedContext.save()
            favorites.append(favorite)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        fetchFavorites()
        
    }
    
    func fetchFavorites() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Favorites")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            
            print("these are all the quotes in results array")
            
            for i in 0 ..< results.count {
                
                let counter = results[i] as! NSManagedObject
                
                let quote = counter.valueForKey("quoteId")
                
                print("quote id is \(quote)")
            }

            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }


}

