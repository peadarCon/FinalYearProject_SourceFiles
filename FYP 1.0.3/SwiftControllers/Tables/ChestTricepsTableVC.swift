//
//  ChestTricepsTableVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 26/03/2021.
//

//import Foundation
import UIKit

extension ChestTricepsTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
                    section: Int) -> Int{
        return tableArray.count
    }
}

class ChestTricepsTableVC: UIViewController {
    
    let tableArray = ["Bench Press", "Dumbbell Chest Press", "Peck Deck",
                      "Dips", "Push Ups", "Tricep Push Downs",
                      "Overhead Tricep Extensions", "Skull Crushers"]
    var selectedIndexpaths = [IndexPath]()

    @IBAction func selectionDone(_ sender: Any) {
        
        self.performSegue(withIdentifier: "MoveToTwo", sender: nil)
    }
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let svc = segue.destination as! SecondVC
        
        var selectedItems = [String]()
        for anIndexPath in
            selectedIndexpaths{
            selectedItems.append(tableArray[anIndexPath.row])
        }
        
        svc.selectedItems = selectedItems
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = tableArray[indexPath.row]
        
        if selectedIndexpaths.contains(indexPath) {
            cell?.accessoryType = .checkmark
        } else{
            cell?.accessoryType = .none
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedIndexpaths.contains(indexPath) {
            selectedIndexpaths.removeAll { (selectedIndexPath) -> Bool in
                selectedIndexPath == indexPath
                }
            tableView.reloadRows(at: [indexPath], with: .fade)
            }  else {
            selectedIndexpaths.append(indexPath)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
}
