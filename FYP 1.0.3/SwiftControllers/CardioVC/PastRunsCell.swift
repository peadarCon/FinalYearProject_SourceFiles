//
//  PastRunsCell.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 15/04/2021.
//

import UIKit

class PastRunsCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    // MARK: - View Life Cycle
    override func prepareForReuse() {
      super.prepareForReuse()

     //   dateLabel.text = nil
     //   distanceLabel.text = nil
    }


}
