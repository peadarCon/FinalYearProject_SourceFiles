//
//  WorkoutSessionVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 11/05/2021.
//

import Foundation
import UIKit

class WorkoutSessionVC: UIViewController {

    var workoutType = ""
    var workoutSession = [Dictionary<String, String>]()
    
    @IBOutlet weak var tblWorkoutSession: UITableView!
    @IBOutlet weak var instructionsButton: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.workoutType
        createAnEmptySession()
        addSaveButton()
        self.tblWorkoutSession.dataSource = self
        instructionsButton.layer.cornerRadius = 22
    }
    
    //MARk:- createAEmptySession
    func createAnEmptySession() {
        var sessionDict = Dictionary<String,String>()
        sessionDict.updateValue("", forKey: "weight")
        sessionDict.updateValue("", forKey: "reps")
        self.workoutSession.append(sessionDict)
    }
    
    func addSaveButton() {
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveWorkoutsSession))
    }
    
    @objc func saveWorkoutsSession() {
        print("Saved session =\(self.workoutSession)")
        
        guard let viewcontrollers = self.navigationController?.viewControllers else {return}
        
        for vc in viewcontrollers {
            if vc is WorkoutController {
                self.navigationController?.popToViewController(vc, animated: true)
            }
        }
        let name = self.workoutType
        //let details = self.workoutSession
        DBHelper.shared.saveWorkoutSessionData(name, with: self.workoutSession)
        
    }
    

}


extension WorkoutSessionVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutSession.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Weight+Reps")
        if let btnAdd = cell?.viewWithTag(3) as? UIButton {
            btnAdd.addTarget(self, action: #selector(addNewSession), for: .touchUpInside)
            btnAdd.isHidden = true
            if indexPath.row == self.workoutSession.count - 1 {
                btnAdd.isHidden = false
            
            }
            let dict = self.workoutSession[indexPath.row]
            if let txtWeight = cell?.viewWithTag(1) as? UITextField {
                txtWeight.text = dict["weight"]
                txtWeight.addTarget(self, action: #selector(weightChanged(_:)), for: .editingChanged)
            }
            
            if let txtReps = cell?.viewWithTag(2) as? UITextField {
                txtReps.text = dict["reps"]
                txtReps.addTarget(self, action: #selector(repsChanged(_:)), for: .editingChanged)
            }
        }
        return cell!
    }
    
    
    @objc func weightChanged(_ textfield:UITextField) {
        guard let text = textfield.text , text.count > 0 else {
            return
        }
        let point = textfield.convert(CGPoint.zero, to: self.tblWorkoutSession)
        guard let indexpath = self.tblWorkoutSession.indexPathForRow(at: point) else {return}
        var dict = self.workoutSession[indexpath.row]
        dict.updateValue(text, forKey: "weight")
        self.workoutSession[indexpath.row] = dict
       // self.tblWorkOUtSession.reloadRows(at: [indexpath], with: .automatic)
    }

    @objc func repsChanged(_ textfield:UITextField) {
        guard let text = textfield.text , text.count > 0 else {
            return
        }
        let point = textfield.convert(CGPoint.zero, to: self.tblWorkoutSession)
        guard let indexpath = self.tblWorkoutSession.indexPathForRow(at: point) else {return}
        var dict = self.workoutSession[indexpath.row]
        dict.updateValue(text, forKey: "reps")
        self.workoutSession[indexpath.row] = dict
       // self.tblWorkOUtSession.reloadRows(at: [indexpath], with: .automatic)
    }
    
    @objc func addNewSession() {
        self.createAnEmptySession()
        self.tblWorkoutSession.reloadData()
    }
}
