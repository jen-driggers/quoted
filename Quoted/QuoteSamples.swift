//
//  quoteSamples.swift
//  Quoted
//
//  Created by Jennifer Driggers on 7/4/16.
//  Copyright © 2016 jennyd.info. All rights reserved.
//

import UIKit

    
    var quotesArray =
        [Quote(imageName: "grendel", uid: 0, bookName: "Grendel", textQuote: "“Poor Grendel's had an accident. So may you all.” "),
         Quote(imageName: "catcher", uid: 1, bookName: "The Catcher in the Rye", textQuote: "“I like it when somebody gets excited about something. It's nice.” "),
         Quote(imageName: "design", uid: 2, bookName: "The Design of Everyday Things", textQuote: "“Fail often, fail fast,” "),
         Quote(imageName: "stranger", uid: 3, bookName: "Stranger in a Strange Land", textQuote: "“Thou art god, I am god. All that groks is god.” "),
         Quote(imageName: "alchemist", uid: 4, bookName: "The Alchemist", textQuote: "“Remember that wherever your heart is, there you will find your treasure.” "),
         Quote(imageName: "vendetta", uid: 5, bookName: "V for Vendetta", textQuote: "“Artists use lies to tell the truth. Yes, I created a lie. But because you believed it, you found something true about yourself.” "),
         Quote(imageName: "watchmen", uid: 6, bookName: "The Watchmen", textQuote: "“There's a notion I'd like to see buried: the ordinary person. Ridiculous. There is no ordinary person.”"),
         Quote(imageName: "bfg", uid: 7, bookName: "BFG", textQuote: "“let your love out” "),
         Quote(imageName: "alice", uid: 8, bookName: "Alice in Wonderland", textQuote: "have i gone mad? im afraid so, but let me tell you something, the best people usually are."),
         Quote(imageName: "grapes", uid: 9, bookName: "The Grapes of Wrath", textQuote: "“it was her habit to build up laughter out of inadequate materials.”"),
         Quote(imageName: "naked", uid: 10, bookName: "Naked Lunch", textQuote: "“Last night I woke up with someone squeezing my hand. It was my other hand.” "),
         Quote(imageName: "neuromancer", uid: 11, bookName: "Neuromancer", textQuote: "“Cyberspace. A consensual hallucination experienced daily by billions of legitimate operators, in every nation.”"),
         Quote(imageName: "thinking", uid: 12, bookName: "Thinking, Fast and Slow", textQuote: "“The idea that the future is unpredictable is undermined every day by the ease with which the past is explained.” "),
         Quote(imageName: "voice", uid: 13, bookName: "Voice of the Fire", textQuote: "“Above, great constellations wheeled to which our bonfire sparks ascended in their tiny mimicry” "),
         Quote(imageName: "american", uid: 14, bookName: "American Gods", textQuote: "It doesn't matter that you didn't believe in us, said Mr. Ibis. We believed in you."),
         Quote(imageName: "good", uid: 15, bookName: "Good Omens", textQuote: "Potentially evil. Potentially good, too, I suppose. Just this huge powerful potentiality waiting to be shaped."),
         Quote(imageName: "astro", uid: 16, bookName: "Astro City", textQuote: "“And I saw in them a hope...A hope that it was possible to have secrets, to mask one's true nature...and yet still to walk among men. ” "),
         Quote(imageName: "atlas", uid: 17, bookName: "Atlas Shrugged", textQuote: "“Contradictions do not exist. Whenever you think that you are facing a contradiction, check your premises. You will find that one of them is wrong.” "),
         Quote(imageName: "blankets", uid: 18, bookName: "Blankets", textQuote: "“Maybe I'm sad about wanting you. I'm not too comfortable with wanting someone.” "),
         Quote(imageName: "castle", uid: 19, bookName: "I Capture the Castle", textQuote: "“Only the margin left to write on now. I love you, I love you, I love you.”"),
         Quote(imageName: "dhalgren", uid: 20, bookName: "Dhalgren", textQuote: "“The problem isn't to learn to love humanity, but to learn to love those members of it who happen to be at hand.”  "),
         Quote(imageName: "dune", uid: 21, bookName: "Dune", textQuote: "“Fear is the mind-killer.”"),
         Quote(imageName: "ender", uid: 22, bookName: "Ender's Game", textQuote: "“So the whole war is because we can't talk to each other.” "),
         Quote(imageName: "flying", uid: 23, bookName: "Fear of Flying", textQuote: "“It was easy enough to kill yourself in a fit of despair. It was easy enough to play the martyr. It was harder to do nothing. To endure your life. To wait.” "),
         Quote(imageName: "geek", uid: 24, bookName: "Geek Love", textQuote: "“How deep and sticky is the darkness of childhood, how rigid the blades of infant evil, which is unadulterated, unrestrained by the convenient cushions of age and its civilizing anesthesia.” "),
         Quote(imageName: "gormenghast", uid: 25, bookName: "Gormenghast", textQuote: "“Cold love’s the loveliest love of all. So clear, so crisp, so empty. In short, so civilized.” "),
         Quote(imageName: "history", uid: 26, bookName: "The Secret History", textQuote: "“Beauty is rarely soft or consolatory. Quite the contrary. Genuine beauty is always quite alarming.” "),
         Quote(imageName: "ice", uid: 27, bookName: "Ice", textQuote: "“I had never before met anyone who owned a telephone and believed in dragons.” "),
         Quote(imageName: "jest", uid: 28, bookName: "Infinite Jest", textQuote: "“...logical validity is not a guarantee of truth.”"),
         Quote(imageName: "justine", uid: 29, bookName: "Justine", textQuote: "“Does not everything depend on our interpretation of the silence around us?” "),
         Quote(imageName: "killing", uid: 30, bookName: "Batman: The Killing Joke", textQuote: "“All it takes is one bad day to reduce the sanest man alive to lunacy. That's how far the world is from where I am. Just one bad day.” "),
         Quote(imageName: "margarita", uid: 31, bookName: "The Master and Margarita", textQuote: "“But what can be done, the one who loves must share the fate of the one he loves.” "),
         Quote(imageName: "road", uid: 32, bookName: "On the Road", textQuote: "“Nothing behind me, everything ahead of me, as is ever so on the road.” "),
         Quote(imageName: "saga", uid: 33, bookName: "Saga of the Swamp Thing", textQuote: "“There are people. There are stories. The people think they shape the stories, but the reverse is often closer to the truth.”"),
         Quote(imageName: "spake", uid: 34, bookName: "Thus Spake Zarathustra: A Book for All and None", textQuote: "“Become who you are!” "),
         Quote(imageName: "speedboat", uid: 35, bookName: "Speedboat", textQuote: "“My capacity for having a good time exists. It surfaces, however, on odd occasions.”"),
         Quote(imageName: "stoner", uid: 36, bookName: "Stoner", textQuote: "“Lust and learning. That's really all there is, isn't it?” "),
         Quote(imageName: "unbearable", uid: 37, bookName: "The Unbearable Lightness of Being", textQuote: "“I want you to be weak. As weak as I am.” "),
         Quote(imageName: "wallflower", uid: 38, bookName: "The Perks of Being a Wallflower", textQuote: "“This moment will just be another story someday.”"),
         Quote(imageName: "zen", uid: 39, bookName: "Zen and the Art of Motorcycle Maintenance: An Inquiry into Values", textQuote: "“When one person suffers from a delusion, it is called insanity. When many people suffer from a delusion it is called a Religion.”")]


