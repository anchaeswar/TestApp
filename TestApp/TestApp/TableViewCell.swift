//
//  TableViewCell.swift
//  test
//
//  Created by Eswar on 12/05/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var lblOrderNumber: UILabel!
    @IBOutlet var lblOrderDueDate: UILabel!
    @IBOutlet var lblCustomerName: UILabel!
    @IBOutlet var lblCustomerAddress: UILabel!
    @IBOutlet var lblCustomerPhone: UILabel!
    @IBOutlet var lblOrderTotal: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
