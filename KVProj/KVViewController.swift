//
//  KVViewController.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

class KVViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadGnomes()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Services
extension KVViewController {
    
    @objc private func refreshControlDidFire() {
        self.loadGnomes()
    }
    
    private func loadGnomes() {
        
        let success : APICompletionHandler = { [weak self] data in
            print("gnomes : \(data)")
        }
        
        let failure : APIFailureHandler = { error in
            print("error : \(error)")
        }
        
        KVNetworking.sharedInstance.getGnomes(success, failureHandler: failure)
        
    }
}
