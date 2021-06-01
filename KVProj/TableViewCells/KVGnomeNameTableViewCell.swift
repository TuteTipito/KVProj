//
//  KVGnomeNameTableViewCell.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

class KVGnomeNameTableViewCell: UITableViewCell {

    @IBOutlet weak var gnomeName: UILabel!{
        didSet {
            gnomeName.font = UIFont.systemFont(ofSize: 14)
            gnomeName.textColor = UIColor.black
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
