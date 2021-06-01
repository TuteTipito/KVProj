//
//  KVDetailViewController.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

enum KVDetailTableSections: Int, CaseIterable {
    case image
    case age, height, weight, hairColor //TO-DO Make this one section (?
    case professions
    case friends
}

class KVDetailViewController: UIViewController {

    var gnome: KVGnome?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()

        if let gnome = self.gnome {
            self.navigationItem.title = gnome.name
        }
    }
}

// MARK: - Setup
extension KVDetailViewController {
    private func setupTableView() {
        tableView.backgroundColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "KVGnomeImageTableViewCell", bundle: nil), forCellReuseIdentifier: "KVGnomeImageTableViewCell")
        tableView.register(UINib(nibName: "KVGnomeTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "KVGnomeTitleTableViewCell")
        tableView.register(UINib(nibName: "KVGnomeNameTableViewCell", bundle: nil), forCellReuseIdentifier: "KVGnomeNameTableViewCell")
        tableView.register(UINib(nibName: "KVGnomeValueTableViewCell", bundle: nil), forCellReuseIdentifier: "KVGnomeValueTableViewCell")
    }
}

// MARK: - TableView
extension KVDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let gnome = self.gnome {
            switch KVDetailTableSections(rawValue: section) {
            case .image:
                return 1
            case .age:
                return 1
            case .height:
                return 1
            case .weight:
                return 1
            case .hairColor:
                return 1
            case .professions:
                return gnome.professions.count
            case .friends:
                return gnome.friends.count
            case .none:
                return 0
            }
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return KVDetailTableSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if let gnome = self.gnome {
            switch KVDetailTableSections(rawValue: indexPath.section) {
            case .image:
                let imageCell : KVGnomeImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KVGnomeImageTableViewCell", for: indexPath) as! KVGnomeImageTableViewCell
                imageCell.setup(with: gnome)
                return imageCell
            case .age:
                let valueCell : KVGnomeValueTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KVGnomeValueTableViewCell", for: indexPath) as! KVGnomeValueTableViewCell
                valueCell.keyLabel.text = "Age:"
                valueCell.valueLabel.text = "\(gnome.age)"
                return valueCell
            case .height:
                let valueCell : KVGnomeValueTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KVGnomeValueTableViewCell", for: indexPath) as! KVGnomeValueTableViewCell
                valueCell.keyLabel.text = "Height:"
                valueCell.valueLabel.text = "\(gnome.height)"
                return valueCell
            case .weight:
                let valueCell : KVGnomeValueTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KVGnomeValueTableViewCell", for: indexPath) as! KVGnomeValueTableViewCell
                valueCell.keyLabel.text = "Weight:"
                valueCell.valueLabel.text = "\(gnome.weight)"
                return valueCell
            case .hairColor:
                let valueCell : KVGnomeValueTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KVGnomeValueTableViewCell", for: indexPath) as! KVGnomeValueTableViewCell
                valueCell.keyLabel.text = "Hair Color:"
                valueCell.valueLabel.text = gnome.hair_color
                return valueCell
            case .professions:
                let nameCell : KVGnomeNameTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KVGnomeNameTableViewCell", for: indexPath) as! KVGnomeNameTableViewCell
                let profession = gnome.professions[indexPath.row]
                nameCell.gnomeName.text = profession
                return nameCell
            case .friends:
                let nameCell : KVGnomeNameTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KVGnomeNameTableViewCell", for: indexPath) as! KVGnomeNameTableViewCell
                let friend = gnome.friends[indexPath.row]
                nameCell.gnomeName.text = friend
//                nameCell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
                return nameCell
            case .none:
                break
            }
        }
        
        return cell

    }
    
}

extension KVDetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == KVDetailTableSections.professions.rawValue || section == KVDetailTableSections.friends.rawValue {
            return 60
        }
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == KVDetailTableSections.professions.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "KVGnomeTitleTableViewCell") as! KVGnomeTitleTableViewCell
            cell.titleLabel.text = "PROFESSIONS"
            return cell
        }
        
        if section == KVDetailTableSections.friends.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "KVGnomeTitleTableViewCell") as! KVGnomeTitleTableViewCell
            cell.titleLabel.text = "FRIENDS"
            return cell
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == KVDetailTableSections.friends.rawValue {
            // TO-DO
        }
    }
}

