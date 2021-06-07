//
//  SetsVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 11/04/2021.
//

import UIKit

class SetsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var setsTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    
    let setsArray = [" "]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setsTableView.delegate = self
        setsTableView.dataSource = self
        
     }
    

//    class Sets: UITableViewCell {
//
//        @IBOutlet weak var repsTextField: UITextField!
//        @IBOutlet weak var weightTextField: UITextField!
//
//    }
//
//    func tableView(setsTableView: UITableView, numberOfRowaInSection section: Int) -> Int {
//        return 2
//    }
//
//    func tableView(setsTableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell: Sets = setsTableView.dequeueReusableCell(withIdentifier: "Sets") as! Sets
//        return cell
//    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Sets", for: indexPath)
        
        cell.textLabel?.textColor = UIColor(named: "White")
        cell.textLabel!.text = setsArray[indexPath.row]
        
        return cell
    }

}
