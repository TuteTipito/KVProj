//
//  KVGnomeValueTableViewCell.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

class KVGnomeValueTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!{
        didSet {
            keyLabel.font = UIFont.boldSystemFont(ofSize: 14)
            keyLabel.textColor = UIColor.black
        }
    }
    
    @IBOutlet weak var valueLabel: UILabel!{
        didSet {
            valueLabel.font = UIFont.systemFont(ofSize: 14)
            valueLabel.textColor = UIColor.black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
