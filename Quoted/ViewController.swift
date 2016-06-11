//
//  ViewController.swift
//  Quoted
//
//  Created by Jennifer Driggers on 5/15/16.
//  Copyright © 2016 Jennifer Driggers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var quoteButton: UIButton!
    
    @IBOutlet weak var quoteView: UIImageView!
    
//    var quotesArray:[String] = ["grendel","catcher","design","stranger","alchemist","vendetta","watchmen","bfg","alice","grapes","naked","neuromancer","thinking","voice","american","good"]
    
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
         Quote(imageName: "good"),]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playButton(sender: UIButton) {
        
        let randomNumber = Int(arc4random_uniform(UInt32(quotesArray.count)))
        
        let quote = quotesArray[randomNumber]
        
        quoteView.image = UIImage(named: quote.imageName)
    }


}

