//
//  MapViewController.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 05/12/2021.
//

import UIKit

class CitiesViewController: UIViewController {
    
    let citiesTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        citiesTable.rowHeight = 120
        citiesTable.register(CitiesTableViewCell.self, forCellReuseIdentifier: "cityCell")
        citiesTable.delegate = self
        citiesTable.dataSource = self
        citiesTable.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        let footerTable_View = UIView(),
            headerTable_View = UIView()
        citiesTable.tableFooterView = footerTable_View
        citiesTable.tableHeaderView = headerTable_View
        
        //citiesTable.separatorColor = .clear
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
}
