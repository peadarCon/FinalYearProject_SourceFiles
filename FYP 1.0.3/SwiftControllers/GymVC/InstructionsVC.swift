//
//  InstructionsVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 11/05/2021.
//

import UIKit

class InstructionsVC: UIViewController {

    @IBOutlet weak var setUpLabel: UILabel!
    @IBOutlet weak var formLabel: UILabel!
    
    var setUp = "For this exercise you'll need access to a flat bench, a barbell and weights"
    var form = " 1) Lie flat on your back on the bench. \n 2) Grip the bar with hands just wider than shoulder-width apart, so when you’re at the bottom of your move your hands are directly above your elbows. This allows for maximum force generation. \n 3) Bring the bar slowly down to your chest as you breathe in. \n 4) Push up as you breathe out, gripping the bar hard and watching a spot on the ceiling rather than the bar, so you can ensure it travels the same path every time."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLabel.text = setUp
        formLabel.text = form
//        instructionsButton.layer.cornerRadius = 22
    }
    
    

}
