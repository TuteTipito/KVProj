//
//  KVViewController.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

class KVViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var gnomes: [KVGnome] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        loadGnomes()

        // Refresh Control
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refreshControlDidFire), for: .valueChanged)
        refreshControl.tintColor = UIColor.blue
        self.collectionView.refreshControl = refreshControl
        
        let searchButton : UIBarButtonItem = UIBarButtonItem(title: "Search", style: UIBarButtonItem.Style.plain, target: self, action: #selector(KVViewController.searchGnomes))
        let sortButton : UIBarButtonItem = UIBarButtonItem(title: "Sort", style: UIBarButtonItem.Style.plain, target: self, action: #selector(KVViewController.sortGnomes))
        let filterButton : UIBarButtonItem = UIBarButtonItem(title: "Filter", style: UIBarButtonItem.Style.plain, target: self, action: #selector(KVViewController.filterGnomes))

        self.navigationItem.rightBarButtonItems = [searchButton, sortButton, filterButton]
        
    }
    
    @objc func searchGnomes() {
        let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        showAlert(title: "Proximamente...", message: "gracias por tu interés <3", actions: [okAction])
    }
    
    @objc func filterGnomes() {
        let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        showAlert(title: "Proximamente...", message: "gracias por tu interés <3", actions: [okAction])
    }

    @objc func sortGnomes() {
        let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        showAlert(title: "Proximamente...", message: "gracias por tu interés <3", actions: [okAction])
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GnomeDetail" {
            if let navigationController = segue.destination as? UINavigationController {
                if let gnomeDetailController = navigationController.viewControllers[0] as? KVDetailViewController {
                    gnomeDetailController.gnome = sender as? KVGnome
                }
            }
        }
    }

}

// MARK: - Setup
extension KVViewController {
    private func setupCollectionView() {
        collectionView.backgroundColor = UIColor(red: 0, green: 150/255, blue: 255/255, alpha: 1.0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "KVGnomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "KVGnomeCollectionViewCell")
        collectionView.setCollectionViewLayout(KVCollectionViewFlowLayout(), animated: false)
    }
}

// MARK: - Collection
extension KVViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(gnomes.count)
        return gnomes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        let gnome: KVGnome = gnomes[indexPath.row]

        let cell : KVGnomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "KVGnomeCollectionViewCell", for: indexPath) as! KVGnomeCollectionViewCell
        cell.setup(with: gnome)
        return cell
    }

}

extension KVViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let gnome = gnomes[indexPath.row]
        self.performSegue(withIdentifier: "GnomeDetail", sender: gnome)
    }
}

// MARK: - Services
extension KVViewController {
    
    @objc private func refreshControlDidFire() {
        self.loadGnomes()
    }
    
    private func loadGnomes() {
        
        let success : APICompletionHandler = { [weak self] data in
            self?.gnomes = (data as! KVGnomes).brastlewark ?? []
            self?.collectionView.reloadData()
        }
        
        let failure : APIFailureHandler = { [weak self] error in
            let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            self?.showAlert(title: "Ups, algo salio mal (?)", message: "malio sal : \(error)", actions: [okAction])
        }
        
        KVNetworking.sharedInstance.getGnomes(success, failureHandler: failure)
    }
}
