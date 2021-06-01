//
//  KVDetailViewController.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

class KVDetailViewController: UIViewController {

    var gnome: KVGnome?

    @IBOutlet weak var gnomeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let gnome = self.gnome {
            gnomeImage.download(from: gnome.thumbnail)
        }
        
    }
}
