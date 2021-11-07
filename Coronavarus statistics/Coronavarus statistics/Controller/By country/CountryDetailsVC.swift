//
//  CountryDetailsVC.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import UIKit

class CountryDetailsVC: UIViewController {
    
    // MARK: - Properties
    
    private var country: Country? {
        didSet {
            guard let country = country else { return }
            newConfirmedInfoView.subtitleLabel.text = String(country.newConfirmed)
            totalConfirmedInfoView.subtitleLabel.text = String(country.totalConfirmed)
            newDeathsInfoView.subtitleLabel.text = String(country.newDeaths)
            totalDeathsInfoView.subtitleLabel.text = String(country.totalDeaths)
            newRecoveredInfoView.subtitleLabel.text = String(country.newRecovered)
            totalRecoveredInfoView.subtitleLabel.text = String(country.totalRecovered)
        }
    }
    
    private let newConfirmedInfoView: InfoView = {
        let newConfirmedView = InfoView(title: "New confirmed")
        
        return newConfirmedView
    }()
    
    private let totalConfirmedInfoView: InfoView = {
        let totalConfirmedView = InfoView(title: "Total confirmed")
        
        return totalConfirmedView
    }()
    
    private let newDeathsInfoView: InfoView = {
        let newDeathsInfoView = InfoView(title: "New deaths")
        
        return newDeathsInfoView
    }()
    
    private let totalDeathsInfoView: InfoView = {
        let totalDeathsInfoView = InfoView(title: "Total deaths")
        
        return totalDeathsInfoView
    }()
    
    private let newRecoveredInfoView: InfoView = {
        let newRecoveredInfoView = InfoView(title: "New recovered")
        
        return newRecoveredInfoView
    }()
    
    private let totalRecoveredInfoView: InfoView = {
        let totalRecoveredInfoView = InfoView(title: "Total recovered")
        
        return totalRecoveredInfoView
    }()
    
    // MARK: - Lifecycle

    init(country: Country) {
        super.init(nibName: nil, bundle: nil)
        
        defer {
            self.country = country
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
        configureNavBar()
        configureUI()
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
        navigationItem.title = country?.country
    }
    
    func configureUI() {
        view.backgroundColor = .white
    }
}

