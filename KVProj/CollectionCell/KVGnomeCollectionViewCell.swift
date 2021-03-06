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
        
        layer.cornerRadius = 16.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.blue.cgColor
        layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4.0)
        layer.shadowRadius = 16.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
    }
    
    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                backgroundColor = UIColor.systemBlue
            } else {
                backgroundColor = UIColor.yellow
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = UIColor.systemBlue
            } else {
                backgroundColor = UIColor.yellow
            }
        }
    }
    
    
    public func setup(with gnome: KVGnomeViewModel) {
        gnomeImage.download(from: gnome.gnomeThumbnail)
        gnomeName.text = gnome.gnomeName
    }

}
