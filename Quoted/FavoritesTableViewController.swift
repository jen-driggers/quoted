//
//  FavoritesTableViewController.swift
//  Quoted
//
//  Created by Jennifer Driggers on 6/26/16.
//  Copyright © 2016 jennyd.info. All rights reserved.
//

import UIKit
import CoreData

class FavoritesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet var FavoritesTableView: UITableView!
    
    var favorites = [NSManagedObject]()
    
    var managedObjectContext: NSManagedObjectContext!
    
    let ReuseIdentifierToDoCell = "FavoritesCell"
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        
        let fetchRequest = NSFetchRequest(entityName: "Favorites")
        
        let sortDescriptor = NSSortDescriptor(key: "quoteId", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.getContext(), sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
        }
        
        //        loadMyRecords()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    var recordsArray: [AnyObject] = []

    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        
////        print("the number of favorites there are is \(favorites.count)") // returns 0
//        
////        return favorites.count
//        
//        // return 3
//        
//        return 1
//        
////        return recordsArray.count
//        
//    }
    
    func configureCell(cell: FavoritesCell, atIndexPath indexPath: NSIndexPath) {
        
        let record = fetchedResultsController.objectAtIndexPath(indexPath)
        
        if let quoteId = record.valueForKey("quoteId") as? String {
            cell.textLabel!.text = quoteId
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCellWithIdentifier(ReuseIdentifierToDoCell, forIndexPath: indexPath) as! FavoritesCell
        
         configureCell(cell, atIndexPath: indexPath)
        
         return cell
        
    }

    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let cell =
//            tableView.dequeueReusableCellWithIdentifier("FavoritesCell")
//        
//        cell!.textLabel?.text = "test" // this works to show test text
//        
//        return cell!
//    }
    
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // OLD METHOD FOR LOADING RECORDS DON'T DELETE UNTIL YOU CAN USE NSFETCHEDCONTROLLER SUCCESSFULLY
    
    //    func loadMyRecords() {
    //
    ////        let myContext = managedObjectContext
    //
    //        // Create Entity
    //        let entity =  NSEntityDescription.entityForName("Favorites",
    //                                                        inManagedObjectContext:managedObjectContext!)
    //
    //        // Initialize Record
    //        let record = NSManagedObject(entity: entity!,
    //                                     insertIntoManagedObjectContext:managedObjectContext!)
    //
    //        print("what is records \(record)")
    //
    //        let recordId = record.valueForKey("quoteId")
    //
    //        print("what is my record id \(recordId)")
    //
    //        recordsArray.append(recordId!)
    //    
    //        
    ////        return recordId
    //        
    //    }
    
}
