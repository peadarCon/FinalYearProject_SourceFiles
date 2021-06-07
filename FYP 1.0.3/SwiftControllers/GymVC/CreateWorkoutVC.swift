//
//  CreateWorkoutVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 04/03/2021.
//

import UIKit
import RealmSwift

class CreateWorkoutVC: UIViewController {

    @IBOutlet weak var GourpButton: UIButton!
    @IBOutlet weak var PPLButton: UIButton!
    @IBOutlet weak var ULButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GourpButton.layer.cornerRadius = 22
        PPLButton.layer.cornerRadius = 22
        ULButton.layer.cornerRadius = 22
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
       

        if
            DBHelper.shared.getMusclesCount() == 0 {
        
            
            loadBasicModels()
            storeModels()
        }
    }
}

class ChestController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   //     return DBHelper.shared.getAllMusclesNames().count
        return DBHelper.shared.getChest().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
//        let muscle = DBHelper.shared.getAllMusclesNames()[indexPath.row]
        let exc = DBHelper.shared.getChest()[indexPath.row]
        cell.textLabel?.text = exc.name
        cell.textLabel?.textColor = UIColor(named: "White")
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 24)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let name = DBHelper.shared.getAllMusclesNames()[indexPath.row]
        let name = DBHelper.shared.getChest()[indexPath.row].name
        let info = DBHelper.shared.getChest()[indexPath.row].information
        DBHelper.shared.saveToWorkoutWithExerciseName(name, info)
    }

}

class BicepController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   //     return DBHelper.shared.getAllMusclesNames().count
        return DBHelper.shared.getBiceps().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
//        let muscle = DBHelper.shared.getAllMusclesNames()[indexPath.row]
        let exc = DBHelper.shared.getChest()[indexPath.row]
        cell.textLabel?.text = exc.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let name = DBHelper.shared.getAllMusclesNames()[indexPath.row]
        let name = DBHelper.shared.getBiceps()[indexPath.row].name
        let info = DBHelper.shared.getChest()[indexPath.row].information
        DBHelper.shared.saveToWorkoutWithExerciseName(name, info)
        
    }


}

class TricepController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   //     return DBHelper.shared.getAllMusclesNames().count
        return DBHelper.shared.getTriceps().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
//        let muscle = DBHelper.shared.getAllMusclesNames()[indexPath.row]
        let exc = DBHelper.shared.getChest()[indexPath.row]
        cell.textLabel?.text = exc.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let name = DBHelper.shared.getAllMusclesNames()[indexPath.row]
        let name = DBHelper.shared.getTriceps()[indexPath.row].name
        let info = DBHelper.shared.getChest()[indexPath.row].information
        DBHelper.shared.saveToWorkoutWithExerciseName(name, info)
        
    }


}

class ShoulderController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   //     return DBHelper.shared.getAllMusclesNames().count
        return DBHelper.shared.getShoulders().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
//        let muscle = DBHelper.shared.getAllMusclesNames()[indexPath.row]
        let exc = DBHelper.shared.getChest()[indexPath.row]
        cell.textLabel?.text = exc.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let name = DBHelper.shared.getAllMusclesNames()[indexPath.row]
        let name = DBHelper.shared.getShoulders()[indexPath.row].name
        let info = DBHelper.shared.getChest()[indexPath.row].information
        DBHelper.shared.saveToWorkoutWithExerciseName(name, info)
    }
}

class WorkoutController: UITableViewController {
        
    var workoutTitle = "Select Exercise"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.workoutTitle
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBHelper.shared.getWorkout().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        let muscle = DBHelper.shared.getWorkout()[indexPath.row]
        cell.textLabel?.text = muscle
        cell.textLabel?.textColor = UIColor(named: "White")
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 26)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let workoutDetailVC = segue.destination as! WorkoutDetail
        guard let cell = sender as? UITableViewCell else {return}
        let name = cell.textLabel?.text ?? ""
//        let info = DBHelper.shared.getWorkout()
        workoutDetailVC.receivedName = name
    }
    
    
}

class PastWorkoutExerciseController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBHelper.shared.getWorkout().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        let muscle = DBHelper.shared.getWorkout()[indexPath.row]
        cell.textLabel?.text = muscle
        cell.textLabel?.textColor = UIColor(named: "White")
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 26)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

class PastWorkoutDataController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBHelper.shared.getData().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "pastWorkout", for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "pastWorkout")
        }
        let data = DBHelper.shared.getData()[indexPath.row]
//        let ex = DBHelper.shared.getWorkout().first
        cell.textLabel?.text = " Weight : \(data.weight)      Reps : \(data.reps)"
        cell.textLabel?.textColor = UIColor(named: "White")
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
