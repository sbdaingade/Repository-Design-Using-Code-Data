//
//  EmployeeRecordCell.swift
//  Repository-Design-Using-Code-Data
//
//  Created by Sachin Daingade on 13/03/23.
//

import UIKit

class EmployeeRecordCell: UITableViewCell {
    @IBOutlet weak var employeeImageView: UIImageView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
