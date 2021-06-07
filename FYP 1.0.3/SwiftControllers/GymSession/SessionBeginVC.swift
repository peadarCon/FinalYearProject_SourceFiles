//
//  SessionBeginVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 27/03/2021.
//

import UIKit

class SessionBeginVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    let exerciseArray = ["Bench Press", "Overhead Shoulder Press", "Incline Dumbbell Press", "Side Lateral Raises", "Tricep Push-Downs", "Overhead Tricep Extensions"]
    
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
        return exerciseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Exercises", for: indexPath)
        
        cell.textLabel?.textColor = UIColor(named: "White")
        cell.textLabel!.text = exerciseArray[indexPath.row]
        
        return cell
    }
}
