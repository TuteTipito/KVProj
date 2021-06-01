//
//  KVGnomeImageTableViewCell.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

class KVGnomeImageTableViewCell: UITableViewCell {

    @IBOutlet private weak var gnomeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setup(with gnome: KVGnome) {
        gnomeImage.download(from: gnome.thumbnail)
    }
}
