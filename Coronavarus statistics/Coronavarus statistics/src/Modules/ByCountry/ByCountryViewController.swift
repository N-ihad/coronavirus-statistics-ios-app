//
//  ByCountryViewController.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//
import UIKit

final class ByCountryViewController: UIViewController {

    private let loadingOverlay = Helper.makeLoadingView()
    private let tableView = UITableView()
    private let identifier = "CountryCell"

    private var countries: [Country] = [] {
        didSet {
            setupSections()
            tableView.reloadData()
            stopLoading()
        }
    }

    private var sortedFirstLetters: [String] = []
    private var sections: [[Country]] = [[]]

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        layout()
        style()
        fetchCountriesData()
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 55
        tableView.register(ByCountryTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.sectionIndexColor = .black

        let updateDataButton = UIButton()
        updateDataButton.setImageWithSize(size: 20, systemImgName: "arrow.triangle.2.circlepath")
        updateDataButton.addTarget(self, action: #selector(onUpdate), for: .touchUpInside)

        let updateDataBarButtonItem = UIBarButtonItem(customView: updateDataButton)
        navigationItem.rightBarButtonItem = updateDataBarButtonItem
        navigationItem.title = "By country"
    }

    private func layout() {
        view.addSubview(tableView)
        tableView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
    }

    private func style() {
        view.backgroundColor = .white
    }

    @objc private func onUpdate() {
        fetchCountriesData()
    }

    private func fetchCountriesData() {
        startLoading()
        CovidService.shared.getSummaryStatistics { [weak self] response in

            guard let value = response.value else {
                return
            }
            self?.countries = value.countries
        }
    }

    private func setupSections() {
        let countriesFirstLetter = countries.map { $0.titleFirstLetter }
        let uniqueCountriesFirstLetter = Array(Set(countriesFirstLetter))

        sortedFirstLetters = uniqueCountriesFirstLetter.sorted()
        sections = sortedFirstLetters.map { firstLetter in
            return countries
                .filter { $0.titleFirstLetter == firstLetter }
                .sorted { $0.country < $1.country }
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

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ByCountryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard !sortedFirstLetters.isEmpty else {
            return nil
        }
        return sortedFirstLetters[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as! ByCountryTableViewCell
        let country = sections[indexPath.section][indexPath.row]
        cell.set(withCountry: country.country)
        return cell
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedFirstLetters
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryDetailsVC = ByCountrySummaryViewController(country: sections[indexPath.section][indexPath.row])
        navigationController?.pushViewController(countryDetailsVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
