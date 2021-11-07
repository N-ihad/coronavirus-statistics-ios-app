//
//  CountryDetailsVC.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import UIKit

final class ByCountrySummaryViewController: UIViewController {

    private let newConfirmedInfoView = InfoView(title: "New confirmed")
    private let totalConfirmedInfoView = InfoView(title: "Total confirmed")
    private let newDeathsInfoView = InfoView(title: "New deaths")
    private let totalDeathsInfoView = InfoView(title: "Total deaths")
    private let newRecoveredInfoView = InfoView(title: "New recovered")
    private let totalRecoveredInfoView = InfoView(title: "Total recovered")

    private var country: Country? {
        didSet {
            guard let country = country else {
                return
            }
            newConfirmedInfoView.subtitleLabel.text = String(country.newConfirmed)
            totalConfirmedInfoView.subtitleLabel.text = String(country.totalConfirmed)
            newDeathsInfoView.subtitleLabel.text = String(country.newDeaths)
            totalDeathsInfoView.subtitleLabel.text = String(country.totalDeaths)
            newRecoveredInfoView.subtitleLabel.text = String(country.newRecovered)
            totalRecoveredInfoView.subtitleLabel.text = String(country.totalRecovered)
        }
    }

    init(country: Country) {
        super.init(nibName: nil, bundle: nil)

        self.country = country
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. No storyboards")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        layout()
        style()
    }
    
    private func setup() {
        navigationItem.title = country?.country
    }

    private func layout() {
        let verticalStackView = UIStackView(
            arrangedSubviews: [
                newConfirmedInfoView,
                totalConfirmedInfoView,
                newDeathsInfoView,
                totalDeathsInfoView,
                newRecoveredInfoView,
                totalRecoveredInfoView
            ]
        )
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 10

        view.addSubview(verticalStackView)
        verticalStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 16, paddingLeft: 16)
    }
    
    private func style() {
        view.backgroundColor = .white
    }
}
