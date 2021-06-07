//
//  PastRunsTableViewController.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 15/04/2021.
//

import UIKit
import CoreData

class PastRunsTableViewController: UITableViewController {
  
  var run: Run!
  
  fileprivate let pastRunCellIdentifier = "pastRunsCell"
 // lazy var  coreDataStack = CoreDataStack(modelName: "")
  
  lazy var fetchedResultsController:
    NSFetchedResultsController<Run> = {
      
      let fetchRequest: NSFetchRequest<Run> = Run.fetchRequest()
      
      let sort = NSSortDescriptor(key: #keyPath(Run.timestamp), ascending: false)
      fetchRequest.sortDescriptors = [sort]
      
      let fetchedResultsController = NSFetchedResultsController(
        fetchRequest: fetchRequest,
        managedObjectContext: CoreDataStack.context,
        sectionNameKeyPath: nil,
        cacheName: nil)
        
      return fetchedResultsController
  }()

    override func viewDidLoad() {
        super.viewDidLoad()

      do {
        try fetchedResultsController.performFetch()
      } catch let error as NSError {
        print("Fetching error: \(error), \(error.userInfo)")
      }
      
    }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return fetchedResultsController.sections?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    guard let sectionInfo = fetchedResultsController.sections?[section] else {
      return 0
    }
    
    return sectionInfo.numberOfObjects
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: pastRunCellIdentifier, for: indexPath)
    configure(cell: cell, for: indexPath)
    return cell
  }

}

// MARK: - Internal
extension PastRunsTableViewController {

  func configure(cell: UITableViewCell,
                 for indexPath: IndexPath) {

    guard let cell = cell as? PastRunsCell else {
        return
    }

    let run = fetchedResultsController.object(at: indexPath)
    cell.dateLabel.text = "Distance: \(FormatDisplay.distance(run.distance))"
    cell.distanceLabel.text = "Date: \(FormatDisplay.date(run.timestamp))"
    cell.durationLabel.text = "Duration: \(FormatDisplay.time(Int(run.duration)))"

  }

}

