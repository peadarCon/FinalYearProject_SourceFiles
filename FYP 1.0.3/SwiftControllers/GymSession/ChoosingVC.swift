//
//  ChoosingVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 28/03/2021.
//

import UIKit

class ChoosingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var Letsgo: UIButton!
    @IBOutlet weak var Choose: UIButton!
    @IBOutlet weak var Stats: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    
//    let exerciseArray = ["Bench Press", "Overhead Shoulder Press", "Incline Dumbbell Press", "Side Lateral Raises", "Tricep Push-Downs", "Overhead Tricep Extensions"]
    let exerciseArray = DBHelper.shared.getWorkout()
    
    let radius = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Letsgo.layer.cornerRadius = CGFloat(radius)
        Choose.layer.cornerRadius = 28
        Stats.layer.cornerRadius = CGFloat(radius)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Exercise", for: indexPath)
        
        cell.textLabel?.textColor = UIColor(named: "White")
        cell.textLabel!.text = exerciseArray[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 22)
        
        return cell
    }
}
