//
//  UIViewController+Alert.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

extension UIViewController {

    // MARK: - Alert
    func showAlert(title : String?, message : String?, actions : [UIAlertAction]) {
        DispatchQueue.main.async {
            let alert : UIAlertController = UIAlertController(title: title, message: message , preferredStyle: .alert)
            for action in actions {
                alert.addAction(action)
            }
            self.present(alert, animated: true, completion: nil)
        }
    }
}
