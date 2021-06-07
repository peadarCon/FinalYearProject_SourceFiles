//
//  PPLVC.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 11/03/2021.
//

import UIKit

class PPLVC: UIViewController {

    @IBOutlet weak var PushButton: UIButton!
    @IBOutlet weak var PullButton: UIButton!
    @IBOutlet weak var LegsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         PushButton.layer.cornerRadius = 22
         PullButton.layer.cornerRadius = 22
         LegsButton.layer.cornerRadius = 22

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
