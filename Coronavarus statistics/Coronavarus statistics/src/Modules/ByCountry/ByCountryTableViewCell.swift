//
//  ByCountryTableViewCell.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import UIKit

final class ByCountryTableViewCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 18)
        return nameLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        contentView.addSubview(nameLabel)
        nameLabel.centerY(inView: contentView, leftAnchor: contentView.leftAnchor, paddingLeft: 8)
    }

    func set(withCountry country: String) {
        nameLabel.text = country
    }
}
