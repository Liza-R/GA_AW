//
//  ViewController.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 02/12/2021.
//

import UIKit

class ViewController: UIViewController{

    let daysForecastTable = UITableView()
    var hoursForecastCollection: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        daysForecastTable.register(DayForecastTableViewCell.self, forCellReuseIdentifier: "dayForecastCell")
        hoursForecastCollection?.dataSource = self
        hoursForecastCollection?.delegate = self
        daysForecastTable.delegate = self
        daysForecastTable.dataSource = self
        let createUIs = ViewVC()
        createUIs.createButtomView(mainView: view, device: UIDevice.current.model)
        createUIs.createAllViews()
        createUIs.createAllLabels()
        createUIs.createAllScrolls()
        createUIs.createAllTables(table: daysForecastTable)
        createUIs.createMap()
        createUIs.createHorizontalCollection(collect: &hoursForecastCollection)
        hoursForecastCollection?.register(HourForecastCollectionViewCell.self, forCellWithReuseIdentifier: "hourForecastCell")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayForecastCell", for: indexPath) as! DayForecastTableViewCell
        cell.hourWeather_Label.text = "Segodnya"
        cell.tempHumWeather_Label.text = "100%"
        cell.tempMaxWeather_Label.text = "10*"
        cell.tempMinWeather_Label.text = "-10*"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hourForecastCell", for: indexPath) as! HourForecastCollectionViewCell
        cell.backgroundColor = .blue
        return cell
    }
}
