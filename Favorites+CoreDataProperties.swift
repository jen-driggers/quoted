//
//  Favorites+CoreDataProperties.swift
//  Quoted
//
//  Created by Jennifer Driggers on 7/9/16.
//  Copyright © 2016 jennyd.info. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Favorites {

    @NSManaged var bookName: String
    @NSManaged var favorites: NSNumber
    @NSManaged var imageName: String
    @NSManaged var quoteId: NSNumber
    @NSManaged var textQuote: String

}
