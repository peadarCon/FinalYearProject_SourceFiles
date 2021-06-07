//
//  CardioVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 27/02/2021.
//

import UIKit

class CardioVC: UIViewController {
    
    @IBOutlet weak var newRunButton: UIButton!
    @IBOutlet weak var pastRunButton: UIButton!
    @IBOutlet weak var badgesButton: UIButton!
    
    let radius = 24
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newRunButton.layer.cornerRadius = CGFloat(radius)
        pastRunButton.layer.cornerRadius = CGFloat(radius)
        badgesButton.layer.cornerRadius = CGFloat(radius)
        // Do any additional setup after loading the view.
    }

}
