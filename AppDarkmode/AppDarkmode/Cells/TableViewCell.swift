//
//  TableViewCell.swift
//  AppDarkmode
//
//  Created by 이민재 on 5/5/24.
//

import UIKit

// MARK: TableViewCell
class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 0
        return lb
    }()
    let button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("button", for: .normal)
        btn.setTitleColor(UIColor(named: "LabelColor"), for: .normal)
        return btn
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: TableViewCell.identifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(button)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 50),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
