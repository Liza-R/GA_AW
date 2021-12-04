//
//  ViewController.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 02/12/2021.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        let createUIs = ViewVC()
        createUIs.createButtomView(mainView: view, device: UIDevice.current.model)
        createUIs.createAllViews()
        createUIs.createAllLabels()
        createUIs.createAllScrolls()
        createUIs.createAllTables()
        createUIs.createMap()
//        createUIs.createLeftInfoViews()
//        createUIs.createRightInfoViews()
    }
}

//extension ViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath) as! ForecastTableViewCell
//        cell.date_Label.text = "\(indexPath.row)"
//        return cell
//    }
//}
