////
////  TestDataSource.swift
////  Quoted
////
////  Created by Jennifer Driggers on 7/3/16.
////  Copyright © 2016 jennyd.info. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//class TestDataSource: NSObject, UITableViewDataSource {
//    
////    let test: String
////    
////    init(test: String) {
////        self.test = "test data source"
////    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let cell =
//            tableView.dequeueReusableCellWithIdentifier("FavoritesCell")
//        
//        cell!.textLabel?.text = "test from test data source" // this works to show test text
//        
//        return cell!
//    }
//
//}
