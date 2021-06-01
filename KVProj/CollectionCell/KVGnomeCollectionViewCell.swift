//
//  KVGnomeCollectionViewCell.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

class KVGnomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var gnomeImage: UIImageView!
    
    @IBOutlet private weak var gnomeName: UILabel! {
        didSet {
            gnomeName.font = UIFont.systemFont(ofSize: 14)
            gnomeName.textColor = UIColor.black
            gnomeName.numberOfLines = 0
            gnomeName.textAlignment = .center
            gnomeName.lineBreakMode = .byWordWrapping
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.yellow
    }
    
    public func setup(with gnome: KVGnome) {
        gnomeImage.download(from: gnome.thumbnail)
        gnomeName.text = gnome.name
    }

}
