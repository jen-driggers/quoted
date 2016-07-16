//
//  quoteSamples.swift
//  Quoted
//
//  Created by Jennifer Driggers on 7/4/16.
//  Copyright © 2016 jennyd.info. All rights reserved.
//

import UIKit
import CoreData

// github.com/andrewcbancroft/Zootastic/blob/BaseProject_SeedDataStore/Zootastic/DataHelper.swift
// to try "seeding" i think?

public class DataHelper {
    
    var quoteNumber = 0
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    public func seedDataStore() {
        seedQuotes()
    }
    
    private func seedQuotes() {
        let quotes = [
            (imageName: "grendel", quoteId: Int32(0), bookName: "Grendel", textQuote: "Poor Grendel's had an accident. So may you all", favorites: false),
            (imageName: "catcher", quoteId: Int32(1), bookName: "The Catcher in the Rye", textQuote: "“I like it when somebody gets excited about something. It's nice.” ", favorites: false),
            (imageName: "design", quoteId: 2, bookName: "The Design of Everyday Things", textQuote: "“Fail often, fail fast,” ", favorites: false),
            (imageName: "design", quoteId: Int32(2), bookName: "The Design of Everyday Things", textQuote: "“Fail often, fail fast,” ", favorites: false),
            (imageName: "stranger", quoteId: 3, bookName: "Stranger in a Strange Land", textQuote: "“Thou art god, I am god. All that groks is god.” ", favorites: false),
            (imageName: "alchemist", quoteId: 4, bookName: "The Alchemist", textQuote: "“Remember that wherever your heart is, there you will find your treasure.” ", favorites: false),
            (imageName: "vendetta", quoteId: 5, bookName: "V for Vendetta", textQuote: "“Artists use lies to tell the truth. Yes, I created a lie. But because you believed it, you found something true about yourself.” ", favorites: false),
            (imageName: "watchmen", quoteId: 6, bookName: "The Watchmen", textQuote: "“There's a notion I'd like to see buried: the ordinary person. Ridiculous. There is no ordinary person.”", favorites: false),
            (imageName: "bfg", quoteId: 7, bookName: "BFG", textQuote: "“let your love out” ", favorites: false),
            (imageName: "alice", quoteId: 8, bookName: "Alice in Wonderland", textQuote: "have i gone mad? im afraid so, but let me tell you something, the best people usually are.", favorites: false),
            (imageName: "grapes", quoteId: 9, bookName: "The Grapes of Wrath", textQuote: "“it was her habit to build up laughter out of inadequate materials.”", favorites: false),
            (imageName: "naked", quoteId: 10, bookName: "Naked Lunch", textQuote: "“Last night I woke up with someone squeezing my hand. It was my other hand.” ", favorites: false),
            (imageName: "neuromancer", quoteId: 11, bookName: "Neuromancer", textQuote: "“Cyberspace. A consensual hallucination experienced daily by billions of legitimate operators, in every nation.”", favorites: false),
            (imageName: "thinking", quoteId: 12, bookName: "Thinking, Fast and Slow", textQuote: "“The idea that the future is unpredictable is undermined every day by the ease with which the past is explained.” ", favorites: false),
            (imageName: "voice", quoteId: 13, bookName: "Voice of the Fire", textQuote: "“Above, great constellations wheeled to which our bonfire sparks ascended in their tiny mimicry” ", favorites: false),
            (imageName: "american", quoteId: 14, bookName: "American Gods", textQuote: "It doesn't matter that you didn't believe in us, said Mr. Ibis. We believed in you.", favorites: false),
            (imageName: "good", quoteId: 15, bookName: "Good Omens", textQuote: "Potentially evil. Potentially good, too, I suppose. Just this huge powerful potentiality waiting to be shaped.", favorites: false),
            (imageName: "astro", quoteId: 16, bookName: "Astro City", textQuote: "“And I saw in them a hope...A hope that it was possible to have secrets, to mask one's true nature...and yet still to walk among men. ” ", favorites: false),
            (imageName: "atlas", quoteId: 17, bookName: "Atlas Shrugged", textQuote: "“Contradictions do not exist. Whenever you think that you are facing a contradiction, check your premises. You will find that one of them is wrong.” ", favorites: false),
            (imageName: "blankets", quoteId: 18, bookName: "Blankets", textQuote: "“Maybe I'm sad about wanting you. I'm not too comfortable with wanting someone.” ", favorites: false),
            (imageName: "castle", quoteId: 19, bookName: "I Capture the Castle", textQuote: "“Only the margin left to write on now. I love you, I love you, I love you.”", favorites: false),
            (imageName: "dhalgren", quoteId: 20, bookName: "Dhalgren", textQuote: "“The problem isn't to learn to love humanity, but to learn to love those members of it who happen to be at hand.”  ", favorites: false),
            (imageName: "dune", quoteId: 21, bookName: "Dune", textQuote: "“Fear is the mind-killer.”", favorites: false),
            (imageName: "ender", quoteId: 22, bookName: "Ender's Game", textQuote: "“So the whole war is because we can't talk to each other.” ", favorites: false),
            (imageName: "flying", quoteId: 23, bookName: "Fear of Flying", textQuote: "“It was easy enough to kill yourself in a fit of despair. It was easy enough to play the martyr. It was harder to do nothing. To endure your life. To wait.” ", favorites: false),
            (imageName: "geek", quoteId: 24, bookName: "Geek Love", textQuote: "“How deep and sticky is the darkness of childhood, how rigid the blades of infant evil, which is unadulterated, unrestrained by the convenient cushions of age and its civilizing anesthesia.” ", favorites: false),
            (imageName: "gormenghast", quoteId: 25, bookName: "Gormenghast", textQuote: "“Cold love’s the loveliest love of all. So clear, so crisp, so empty. In short, so civilized.” ", favorites: false),
            (imageName: "history", quoteId: 26, bookName: "The Secret History", textQuote: "“Beauty is rarely soft or consolatory. Quite the contrary. Genuine beauty is always quite alarming.” ", favorites: false),
            (imageName: "ice", quoteId: 27, bookName: "Ice", textQuote: "“I had never before met anyone who owned a telephone and believed in dragons.” ", favorites: false),
            (imageName: "jest", quoteId: 28, bookName: "Infinite Jest", textQuote: "“...logical validity is not a guarantee of truth.”", favorites: false),
            (imageName: "justine", quoteId: 29, bookName: "Justine", textQuote: "“Does not everything depend on our interpretation of the silence around us?” ", favorites: false),
            (imageName: "killing", quoteId: 30, bookName: "Batman: The Killing Joke", textQuote: "“All it takes is one bad day to reduce the sanest man alive to lunacy. That's how far the world is from where I am. Just one bad day.” ", favorites: false),
            (imageName: "margarita", quoteId: 31, bookName: "The Master and Margarita", textQuote: "“But what can be done, the one who loves must share the fate of the one he loves.” ", favorites: false),
            (imageName: "road", quoteId: 32, bookName: "On the Road", textQuote: "“Nothing behind me, everything ahead of me, as is ever so on the road.” ", favorites: false),
            (imageName: "saga", quoteId: 33, bookName: "Saga of the Swamp Thing", textQuote: "“There are people. There are stories. The people think they shape the stories, but the reverse is often closer to the truth.”", favorites: false),
            (imageName: "spake", quoteId: 34, bookName: "Thus Spake Zarathustra: A Book for All and None", textQuote: "“Become who you are!” ", favorites: false),
            (imageName: "speedboat", quoteId: 35, bookName: "Speedboat", textQuote: "“My capacity for having a good time exists. It surfaces, however, on odd occasions.”", favorites: false),
            (imageName: "stoner", quoteId: 36, bookName: "Stoner", textQuote: "“Lust and learning. That's really all there is, isn't it?” ", favorites: false),
            (imageName: "unbearable", quoteId: 37, bookName: "The Unbearable Lightness of Being", textQuote: "“I want you to be weak. As weak as I am.” ", favorites: false),
            (imageName: "wallflower", quoteId: 38, bookName: "The Perks of Being a Wallflower", textQuote: "“This moment will just be another story someday.”", favorites: false),
            (imageName: "zen", quoteId: 39, bookName: "Zen and the Art of Motorcycle Maintenance: An Inquiry into Values", textQuote: "“When one person suffers from a delusion, it is called insanity. When many people suffer from a delusion it is called a Religion.”", favorites: false)]
        
        
        print("hello? from data seed")
        
        for quote in quotes {
            let newQuote = NSEntityDescription.insertNewObjectForEntityForName("Quote", inManagedObjectContext: context) as! Quote
            newQuote.imageName = quote.imageName
            newQuote.quoteId = quote.quoteId
            newQuote.bookName = quote.bookName
            newQuote.textQuote = quote.textQuote
            newQuote.favorites = quote.favorites
        }
        
        do {
            try context.save()
        } catch _ {
            
        }
    }
    
    func printNumberOfQuotes() {
        let idFetch = NSFetchRequest(entityName: "Quote")
        let primarySortDescriptor = NSSortDescriptor(key: "quoteId", ascending: true)
        idFetch.sortDescriptors = [primarySortDescriptor]
        
        let quotes = (try! context.executeFetchRequest(idFetch)) as! [Quote]
        
        var counter = 0
        
        for quote in quotes {
            print("quote text \(quote.textQuote)")
            counter += 1
            numberOfQuotes(counter)
        }
    
    }
    
    func numberOfQuotes(counter: Int) -> Int {
        return counter
    }
    
}
    
//    var quotesArray =
//        [Quote(imageName: "grendel", quoteId: 0, bookName: "Grendel", textQuote: "Poor Grendel's had an accident. So may you all", favorites: false),
//         Quote(imageName: "catcher", quoteId: 1, bookName: "The Catcher in the Rye", textQuote: "“I like it when somebody gets excited about something. It's nice.” "),
//         Quote(imageName: "design", quoteId: 2, bookName: "The Design of Everyday Things", textQuote: "“Fail often, fail fast,” "),
//         Quote(imageName: "stranger", quoteId: 3, bookName: "Stranger in a Strange Land", textQuote: "“Thou art god, I am god. All that groks is god.” "),
//         Quote(imageName: "alchemist", quoteId: 4, bookName: "The Alchemist", textQuote: "“Remember that wherever your heart is, there you will find your treasure.” "),
//         Quote(imageName: "vendetta", quoteId: 5, bookName: "V for Vendetta", textQuote: "“Artists use lies to tell the truth. Yes, I created a lie. But because you believed it, you found something true about yourself.” "),
//         Quote(imageName: "watchmen", quoteId: 6, bookName: "The Watchmen", textQuote: "“There's a notion I'd like to see buried: the ordinary person. Ridiculous. There is no ordinary person.”"),
//         Quote(imageName: "bfg", quoteId: 7, bookName: "BFG", textQuote: "“let your love out” "),
//         Quote(imageName: "alice", quoteId: 8, bookName: "Alice in Wonderland", textQuote: "have i gone mad? im afraid so, but let me tell you something, the best people usually are."),
//         Quote(imageName: "grapes", quoteId: 9, bookName: "The Grapes of Wrath", textQuote: "“it was her habit to build up laughter out of inadequate materials.”"),
//         Quote(imageName: "naked", quoteId: 10, bookName: "Naked Lunch", textQuote: "“Last night I woke up with someone squeezing my hand. It was my other hand.” "),
//         Quote(imageName: "neuromancer", quoteId: 11, bookName: "Neuromancer", textQuote: "“Cyberspace. A consensual hallucination experienced daily by billions of legitimate operators, in every nation.”"),
//         Quote(imageName: "thinking", quoteId: 12, bookName: "Thinking, Fast and Slow", textQuote: "“The idea that the future is unpredictable is undermined every day by the ease with which the past is explained.” "),
//         Quote(imageName: "voice", quoteId: 13, bookName: "Voice of the Fire", textQuote: "“Above, great constellations wheeled to which our bonfire sparks ascended in their tiny mimicry” "),
//         Quote(imageName: "american", quoteId: 14, bookName: "American Gods", textQuote: "It doesn't matter that you didn't believe in us, said Mr. Ibis. We believed in you."),
//         Quote(imageName: "good", quoteId: 15, bookName: "Good Omens", textQuote: "Potentially evil. Potentially good, too, I suppose. Just this huge powerful potentiality waiting to be shaped."),
//         Quote(imageName: "astro", quoteId: 16, bookName: "Astro City", textQuote: "“And I saw in them a hope...A hope that it was possible to have secrets, to mask one's true nature...and yet still to walk among men. ” "),
//         Quote(imageName: "atlas", quoteId: 17, bookName: "Atlas Shrugged", textQuote: "“Contradictions do not exist. Whenever you think that you are facing a contradiction, check your premises. You will find that one of them is wrong.” "),
//         Quote(imageName: "blankets", quoteId: 18, bookName: "Blankets", textQuote: "“Maybe I'm sad about wanting you. I'm not too comfortable with wanting someone.” "),
//         Quote(imageName: "castle", quoteId: 19, bookName: "I Capture the Castle", textQuote: "“Only the margin left to write on now. I love you, I love you, I love you.”"),
//         Quote(imageName: "dhalgren", quoteId: 20, bookName: "Dhalgren", textQuote: "“The problem isn't to learn to love humanity, but to learn to love those members of it who happen to be at hand.”  "),
//         Quote(imageName: "dune", quoteId: 21, bookName: "Dune", textQuote: "“Fear is the mind-killer.”"),
//         Quote(imageName: "ender", quoteId: 22, bookName: "Ender's Game", textQuote: "“So the whole war is because we can't talk to each other.” "),
//         Quote(imageName: "flying", quoteId: 23, bookName: "Fear of Flying", textQuote: "“It was easy enough to kill yourself in a fit of despair. It was easy enough to play the martyr. It was harder to do nothing. To endure your life. To wait.” "),
//         Quote(imageName: "geek", quoteId: 24, bookName: "Geek Love", textQuote: "“How deep and sticky is the darkness of childhood, how rigid the blades of infant evil, which is unadulterated, unrestrained by the convenient cushions of age and its civilizing anesthesia.” "),
//         Quote(imageName: "gormenghast", quoteId: 25, bookName: "Gormenghast", textQuote: "“Cold love’s the loveliest love of all. So clear, so crisp, so empty. In short, so civilized.” "),
//         Quote(imageName: "history", quoteId: 26, bookName: "The Secret History", textQuote: "“Beauty is rarely soft or consolatory. Quite the contrary. Genuine beauty is always quite alarming.” "),
//         Quote(imageName: "ice", quoteId: 27, bookName: "Ice", textQuote: "“I had never before met anyone who owned a telephone and believed in dragons.” "),
//         Quote(imageName: "jest", quoteId: 28, bookName: "Infinite Jest", textQuote: "“...logical validity is not a guarantee of truth.”"),
//         Quote(imageName: "justine", quoteId: 29, bookName: "Justine", textQuote: "“Does not everything depend on our interpretation of the silence around us?” "),
//         Quote(imageName: "killing", quoteId: 30, bookName: "Batman: The Killing Joke", textQuote: "“All it takes is one bad day to reduce the sanest man alive to lunacy. That's how far the world is from where I am. Just one bad day.” "),
//         Quote(imageName: "margarita", quoteId: 31, bookName: "The Master and Margarita", textQuote: "“But what can be done, the one who loves must share the fate of the one he loves.” "),
//         Quote(imageName: "road", quoteId: 32, bookName: "On the Road", textQuote: "“Nothing behind me, everything ahead of me, as is ever so on the road.” "),
//         Quote(imageName: "saga", quoteId: 33, bookName: "Saga of the Swamp Thing", textQuote: "“There are people. There are stories. The people think they shape the stories, but the reverse is often closer to the truth.”"),
//         Quote(imageName: "spake", quoteId: 34, bookName: "Thus Spake Zarathustra: A Book for All and None", textQuote: "“Become who you are!” "),
//         Quote(imageName: "speedboat", quoteId: 35, bookName: "Speedboat", textQuote: "“My capacity for having a good time exists. It surfaces, however, on odd occasions.”"),
//         Quote(imageName: "stoner", quoteId: 36, bookName: "Stoner", textQuote: "“Lust and learning. That's really all there is, isn't it?” "),
//         Quote(imageName: "unbearable", quoteId: 37, bookName: "The Unbearable Lightness of Being", textQuote: "“I want you to be weak. As weak as I am.” "),
//         Quote(imageName: "wallflower", quoteId: 38, bookName: "The Perks of Being a Wallflower", textQuote: "“This moment will just be another story someday.”"),
//         Quote(imageName: "zen", quoteId: 39, bookName: "Zen and the Art of Motorcycle Maintenance: An Inquiry into Values", textQuote: "“When one person suffers from a delusion, it is called insanity. When many people suffer from a delusion it is called a Religion.”")]


