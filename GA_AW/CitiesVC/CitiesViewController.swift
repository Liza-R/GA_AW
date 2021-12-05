//
//  MapViewController.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 05/12/2021.
//

import UIKit

class CitiesViewController: UIViewController {
    
    private let citiesTable = UITableView(),
                headerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
        headerView.backgroundColor = .green
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 150)
        view.backgroundColor = .purple
        citiesTable.rowHeight = 120
        citiesTable.register(CitiesTableViewCell.self, forCellReuseIdentifier: "cityCell")
        citiesTable.delegate = self
        citiesTable.dataSource = self
        citiesTable.frame = CGRect(x: 0, y: headerView.frame.maxY, width: self.view.frame.size.width, height: self.view.frame.size.height - headerView.frame.height)
        
        let footerTable_View = UIView(),
            weather_Label = UILabel(),
            searchCity = UISearchBar(),
            settingButton = UIButton()
        
        headerView.addSubview(weather_Label)
        headerView.addSubview(searchCity)
        headerView.addSubview(settingButton)
        
        weather_Label.text = "Weather"
        weather_Label.font = UIFont.boldSystemFont(ofSize: 33)
        weather_Label.textColor = .white
        weather_Label.frame = CGRect(x: 20, y: headerView.frame.size.height/2 - 10, width: headerView.frame.size.width/1.5, height: 30)
            
        searchCity.frame = CGRect(x: 0, y: weather_Label.frame.maxY + 10, width: headerView.frame.size.width, height: 50)
        searchCity.placeholder = "Поиск города или аэропорта"
        
        settingButton.backgroundColor = .red
        settingButton.frame = CGRect(x: headerView.frame.size.width - 50, y: 10, width: 30, height: 30)
        
        citiesTable.tableFooterView = footerTable_View

        footerTable_View.backgroundColor = .green
        footerTable_View.frame.size = CGSize(width: citiesTable.frame.size.width, height: 100)
        view.addSubview(citiesTable)
    }
}

extension CitiesViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CitiesTableViewCell
        cell.cityName_Label.text = "Odincovo"
        cell.warning_ImageV.image = imWarn
        cell.updateTime_Label.text = "18:49"
        cell.warning_Label.text = "AHTUNG"
        cell.temp_Label.text = "-00*"
        cell.maxTemp_Label.text = "Max: -00*"
        cell.minTemp_Label.text = "Min: -00*"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
}
