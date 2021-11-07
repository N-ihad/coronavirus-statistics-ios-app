//
//  SummaryViewController.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import UIKit

final class SummaryViewController: UIViewController {

    private let loadingOverlay = Helper.makeLoadingView()
    private let newConfirmedInfoView = InfoView(title: "New confirmed")
    private let totalConfirmedInfoView = InfoView(title: "Total confirmed")
    private let newDeathsInfoView = InfoView(title: "New deaths")
    private let totalDeathsInfoView = InfoView(title: "Total deaths")
    private let newRecoveredInfoView = InfoView(title: "New recovered")
    private let totalRecoveredInfoView = InfoView(title: "Total recovered")

    private var summaryData: Global? {
        didSet {
            guard let summaryData = summaryData else {
                return
            }
            stopLoading()
            newConfirmedInfoView.subtitleLabel.text = String(summaryData.newConfirmed)
            totalConfirmedInfoView.subtitleLabel.text = String(summaryData.totalConfirmed)
            newDeathsInfoView.subtitleLabel.text = String(summaryData.newDeaths)
            totalDeathsInfoView.subtitleLabel.text = String(summaryData.totalDeaths)
            newRecoveredInfoView.subtitleLabel.text = String(summaryData.newRecovered)
            totalRecoveredInfoView.subtitleLabel.text = String(summaryData.totalRecovered)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
        style()
        fetchSummaryData()
    }

    private func setup() {
        let updateDataButton = UIButton()
        updateDataButton.setImageWithSize(size: 20, systemImgName: "arrow.triangle.2.circlepath")
        updateDataButton.addTarget(self, action: #selector(onUpdate), for: .touchUpInside)

        let updateDataBarButtonItem = UIBarButtonItem(customView: updateDataButton)
        navigationItem.rightBarButtonItem = updateDataBarButtonItem
        navigationItem.title = "Worldwide"
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

    @objc private func onUpdate() {
        fetchSummaryData()
    }

    private func fetchSummaryData() {
        startLoading()
        CovidService.shared.getSummaryStatistics { [weak self] response in

            guard let value = response.value else {
                return
            }
            self?.summaryData = value.global
        }
    }
    
    private func startLoading() {
        view.addSubview(loadingOverlay)
        loadingOverlay.pinTo(view)
    }

    private func stopLoading() {
        loadingOverlay.removeFromSuperview()
    }
}
