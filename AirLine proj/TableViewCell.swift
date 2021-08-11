//
//  TableViewCell.swift
//  AirLine proj
//
//  Created by makarand gharat on 04/08/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblHeadQuater: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
