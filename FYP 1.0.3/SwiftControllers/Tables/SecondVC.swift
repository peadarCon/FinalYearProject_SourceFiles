//
//  SecondVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 26/03/2021.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var selectedItemsList: UITableView!
    
    var selectedItems = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Selected items in FVC: \(selectedItems)")
        selectedItemsList.reloadData()

        // Do any additional setup after loading the view.
    }

}
