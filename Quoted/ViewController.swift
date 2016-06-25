//
//  ViewController.swift
//  Quoted
//
//  Created by Jennifer Driggers on 5/15/16.
//  Copyright © 2016 Jennifer Driggers. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var quoteButton: UIButton!
    
    @IBOutlet weak var quoteView: UIImageView!
    
    @IBOutlet weak var favoritesButton: UIButton!
    
    var quotesArray =
        [Quote(imageName: "grendel"),
         Quote(imageName: "catcher"),
         Quote(imageName: "design"),
         Quote(imageName: "stranger"),
         Quote(imageName: "alchemist"),
         Quote(imageName: "vendetta"),
         Quote(imageName: "watchmen"),
         Quote(imageName: "bfg"),
         Quote(imageName: "alice"),
         Quote(imageName: "grapes"),
         Quote(imageName: "naked"),
         Quote(imageName: "neuromancer"),
         Quote(imageName: "thinking"),
         Quote(imageName: "voice"),
         Quote(imageName: "american"),
         Quote(imageName: "good"),
         Quote(imageName: "astro"),
         Quote(imageName: "atlas"),
         Quote(imageName: "blankets"),
         Quote(imageName: "castle"),
         Quote(imageName: "dhalgren"),
         Quote(imageName: "dune"),
         Quote(imageName: "ender"),
         Quote(imageName: "flying"),
         Quote(imageName: "geek"),
         Quote(imageName: "gormenghast"),
         Quote(imageName: "history"),
         Quote(imageName: "ice"),
         Quote(imageName: "jest"),
         Quote(imageName: "justine"),
         Quote(imageName: "killing"),
         Quote(imageName: "margarita"),
         Quote(imageName: "road"),
         Quote(imageName: "saga"),
         Quote(imageName: "spake"),
         Quote(imageName: "speedboat"),
         Quote(imageName: "stoner"),
         Quote(imageName: "unbearable"),
         Quote(imageName: "wallflower"),
         Quote(imageName: "zen"),]
    var currentQuote : Quote? = nil
    

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
        
    }
    
    var favorites = [NSManagedObject]()

    @IBAction func favoriteAction(sender: UIButton) {
        
        favoritesButton.setTitle("Added to Favorites", forState: .Normal)
        
        saveFavorite(currentQuote!.uid)
    }
    
    func saveFavorite(id: Int) {
    
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        var managedObjectContext: NSManagedObjectContext?
        
        let entity =  NSEntityDescription.entityForName("Favorite",
                                                        inManagedObjectContext:managedObjectContext!)
        
        let favorite = NSManagedObject(entity: entity!,
                                     insertIntoManagedObjectContext: managedObjectContext)
        
//        favorite.setValue(id, forKey: "uid")
        
        
        do {
            try managedObjectContext!.save()
            favorites.append(favorite)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }

}

