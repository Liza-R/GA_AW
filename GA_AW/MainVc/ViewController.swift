//
//  ViewController.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 02/12/2021.
//

import UIKit

class ViewController: UIViewController{

    let daysForecastTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        daysForecastTable.register(DayForecastTableViewCell.self, forCellReuseIdentifier: "dayForecastCell")
        daysForecastTable.delegate = self
        daysForecastTable.dataSource = self
        let createUIs = ViewVC()
        createUIs.createButtomView(mainView: view, device: UIDevice.current.model)
        createUIs.createAllViews()
        createUIs.createAllLabels()
        createUIs.createAllScrolls()
        createUIs.createAllTables(table: daysForecastTable)
//        createUIs.createMap()
//        createUIs.createLeftInfoViews()
//        createUIs.createRightInfoViews()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayForecastCell", for: indexPath) as! DayForecastTableViewCell
        cell.hourWeather_Label.text = "hour\(indexPath.row)"
        print(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
}
