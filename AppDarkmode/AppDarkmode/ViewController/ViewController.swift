//
//  ViewController.swift
//  AppDarkmode
//
//  Created by 이민재 on 5/2/24.
//

import UIKit

// MARK: ViewController
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var customModeButton: UIButton!
    @IBOutlet weak var darkModeButton: UIButton!
    @IBOutlet weak var lightModeButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        collectionView.backgroundColor = UIColor(named: "ViewBackgroundColor")
        tableView.backgroundColor = UIColor(named: "ViewBackgroundColor")
        label.textColor = UIColor(named: "LabelColor")
        setButtonTitle()
    }
    // 버튼의 타이틀 변경
    private func setButtonTitle() {
        customModeButton.setTitle("Custom", for: .normal)
        darkModeButton.setTitle("Dark", for: .normal)
        lightModeButton.setTitle("Light", for: .normal)
    }
    
//    MARK: Button Actions
    @IBAction func CustomButtonTapped(_ sender: Any) {
        UIModeUserDefaults.shared.chageValue(.custom)
        view.window?.overrideUserInterfaceStyle = .unspecified
    }
    @IBAction func DarkButtonTapped(_ sender: Any) {
        UIModeUserDefaults.shared.chageValue(.dark)
        view.window?.overrideUserInterfaceStyle = .dark
    }
    @IBAction func LightButtonTapped(_ sender: Any) {
        UIModeUserDefaults.shared.chageValue(.light)
        view.window?.overrideUserInterfaceStyle = .light
    }
    

}

// MARK: CollectionViewDelegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.titleLabel.text = "\(indexPath.row) cell"
        cell.backgroundColor = UIColor(named: "CellBackgroundColor")
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

// MARK: TableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = "\(indexPath.row) cell"
        cell.backgroundColor = UIColor(named: "CellBackgroundColor")
        return cell
    }
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
