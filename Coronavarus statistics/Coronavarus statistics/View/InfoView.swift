//
//  InfoView.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import UIKit

final class InfoView: UIView {

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "—"
        titleLabel.font = .boldSystemFont(ofSize: 26)
        return titleLabel
    }()

    let subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "—"
        subtitleLabel.font = subtitleLabel.font.withSize(18)
        return subtitleLabel
    }()

    init(frame: CGRect = .zero, title: String) {
        super.init(frame: frame)

        setup(withTitle: title)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(withTitle title: String) {
        titleLabel.text = title
    }

    private func layout() {
        heightAnchor.constraint(equalToConstant: 75).isActive = true

        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 6, paddingLeft: 6)

        addSubview(subtitleLabel)
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, paddingTop: 6, paddingLeft: 7)
    }
}
