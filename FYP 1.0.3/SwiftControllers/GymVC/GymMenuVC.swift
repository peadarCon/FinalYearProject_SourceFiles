//
//  GymMenuVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 12/04/2021.
//

import UIKit

class GymMenuVC: UIViewController {

    @IBOutlet weak var LetsGoButton: UIButton!
    @IBOutlet weak var TakeLookButton: UIButton!
    @IBOutlet weak var GetStartedButton: UIButton!
    
    let radius = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LetsGoButton.layer.cornerRadius = CGFloat(radius)
        TakeLookButton.layer.cornerRadius = CGFloat(radius)
        GetStartedButton.layer.cornerRadius = CGFloat(radius)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
