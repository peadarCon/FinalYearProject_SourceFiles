//
//  RSSelectionVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 26/03/2021.
//

import Foundation
import RSSelectionMenu
import UIKit

//extension RSSelectionVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView1(_ tableView: UITableView, numberOfRowsInSection
//                    section: Int) -> Int{
//        return data.count
//    }
//}

class RSSelectionVC: UIViewController {
    
    let data = ["Bench Press", "Dumbbell Chest Press", "Peck Deck",                      "Dips", "Push Ups", "Cable Press"]
    var selectedExercises = [String]()
    
    
    
//    let menu = RSSelectionMenu(dataSource: data) { (cell, name, indexPath) in
//        
//        cell.textLabel?.text = name
//    }
//   
//    menu.setSelectedItems(items: selectedExercises) { (name, index,
//        selected, selectedItems) in
//    
//    selectedExercises = selectedItems
//    }
}

