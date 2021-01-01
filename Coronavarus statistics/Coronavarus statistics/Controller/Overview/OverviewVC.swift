//
//  ViewController.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import UIKit

class OverviewVC: UIViewController {
    
    // MARK: - Properties
    
    let loadingOverlay: UIView = {
        let loadingOverlay = Utilities().loadingView()
        
        return loadingOverlay
    }()
    
    private var overviewData: Global? {
        didSet {
            guard let overviewData = overviewData else { return }
            newConfirmedInfoView.textLabel.text = String(overviewData.newConfirmed)
            totalConfirmedInfoView.textLabel.text = String(overviewData.totalConfirmed)
            newDeathsInfoView.textLabel.text = String(overviewData.newDeaths)
            totalDeathsInfoView.textLabel.text = String(overviewData.totalDeaths)
            newRecoveredInfoView.textLabel.text = String(overviewData.newRecovered)
            totalRecoveredInfoView.textLabel.text = String(overviewData.totalRecovered)
        }
    }
    
    private let newConfirmedInfoView: InfoView = {
        let newConfirmedView = InfoView(caption: "New confirmed")
        
        return newConfirmedView
    }()
    
    private let totalConfirmedInfoView: InfoView = {
        let totalConfirmedView = InfoView(caption: "Total confirmed")
        
        return totalConfirmedView
    }()
    
    private let newDeathsInfoView: InfoView = {
        let newDeathsInfoView = InfoView(caption: "New deaths")
        
        return newDeathsInfoView
    }()
    
    private let totalDeathsInfoView: InfoView = {
        let totalDeathsInfoView = InfoView(caption: "Total deaths")
        
        return totalDeathsInfoView
    }()
    
    private let newRecoveredInfoView: InfoView = {
        let newRecoveredInfoView = InfoView(caption: "New recovered")
        
        return newRecoveredInfoView
    }()
    
    private let totalRecoveredInfoView: InfoView = {
        let totalRecoveredInfoView = InfoView(caption: "Total recovered")
        
        return totalRecoveredInfoView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
        configureNavBar()
        configureUI()
        fetchOverviewData()
    }
    
    // MARK: - Selectors

    @objc func updateButtonPressed() {
        fetchOverviewData()
    }

    // MARK: - Helpers
    
    func configureSubviews() {
        let vStackView = UIStackView(arrangedSubviews: [newConfirmedInfoView, totalConfirmedInfoView, newDeathsInfoView, totalDeathsInfoView, newRecoveredInfoView, totalRecoveredInfoView])
        vStackView.axis = .vertical
        vStackView.distribution = .fillEqually
        vStackView.spacing = 10
        
        view.addSubview(vStackView)
        vStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 16, paddingLeft: 16)
    }
    
    func configureNavBar() {
        let button = UIButton()
        button.setImageWithSize(size: 20, systemImgName: "arrow.triangle.2.circlepath")
        button.addTarget(self, action: #selector(updateButtonPressed), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
        navigationItem.title = "Worldwide"
    }
    
    func configureUI() {
        view.backgroundColor = .white
    }
    
    func fetchOverviewData() {
        startLoadingAnimation()
        NetworkService.shared.getOverviewStatistics { response in
            guard let res = response.value else { return }
            self.overviewData = res.global
            self.stopLoadingAnimation()
        }
    }
    
    func startLoadingAnimation() {
        view.addSubview(loadingOverlay)
        loadingOverlay.pinTo(view)
    }
    
    func stopLoadingAnimation() {
        loadingOverlay.removeFromSuperview()
    }
}

