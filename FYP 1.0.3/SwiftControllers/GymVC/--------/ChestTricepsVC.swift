//
//  ChestTricepsVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 11/05/2021.
//

import Foundation
import RealmSwift
import UIKit

class ChestTricepsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!

    let exercise = DBHelper.shared.getWorkout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.textColor = UIColor(named: "White")
        cell.textLabel!.text = exercise[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 24)
        
        return cell
    }
    
}
