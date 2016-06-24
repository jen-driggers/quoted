//
//  Favorites+CoreDataProperties.h
//  Quoted
//
//  Created by Jennifer Driggers on 6/24/16.
//  Copyright © 2016 jennyd.info. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Favorites.h"

NS_ASSUME_NONNULL_BEGIN

@interface Favorites (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *quoteId;

@end

NS_ASSUME_NONNULL_END
