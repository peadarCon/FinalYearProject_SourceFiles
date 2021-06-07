//
//  GymHomeVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 24/02/2021.
//

import UIKit

class GymHomeVC: UIViewController {
    
    @IBOutlet weak var ContinueWorkoutButton: UIButton!
    @IBOutlet weak var PremadeButton: UIButton!
    @IBOutlet weak var MAkeYourOwnButton: UIButton!
    
    @IBOutlet weak var TopStack: UIStackView!
    @IBOutlet weak var MidStack: UIStackView!
    @IBOutlet weak var BottomStack: UIStackView!
    
    
    var radius = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContinueWorkoutButton.layer.cornerRadius = CGFloat(radius)
        PremadeButton.layer.cornerRadius =
            CGFloat(radius)
        MAkeYourOwnButton.layer.cornerRadius = CGFloat(radius)
        
        TopStack.layer.cornerRadius = CGFloat(radius)
        MidStack.layer.cornerRadius = CGFloat(radius)
        BottomStack.layer.cornerRadius = CGFloat(radius)
        
        
        
    }
    

}
