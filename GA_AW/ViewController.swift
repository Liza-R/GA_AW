//
//  ViewController.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {

    let cityName_Label = UILabel(),
        mainTemp_Label = UILabel(),
        maxminTemp_Label = UILabel(),
        description_Label = UILabel(),
//
//        weather_Scroll = UIScrollView(),
//        hourForecast_Scroll = UIScrollView(),
//
//        warning_View = UIView(),
//        map_View = UIView(),
        mainInfo_View = UIView(),
//        indexUV_View = UIView(),
//        sun_View = UIView(),
//        wind_View = UIView(),
//        downfall_View = UIView(),
//        feelTemp_View = UIView(),
//        humidity_View = UIView(),
//        visibility_View = UIView(),
//        pressure_View = UIView(),
//        details_Collection = UICollectionView(),
//
//        hourForecast_Collection = UICollectionView(),
//
//        daysForecast_Table = UITableView(),
        backgroundColor_ = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)

    override func viewDidLoad() {
        super.viewDidLoad()
        mainInfo_View.backgroundColor = .black
        mainInfo_View.frame = CGRect(x: 30, y: 40, width: view.frame.width - 60, height: view.frame.height/3)
//        mainInfo_View.layer.cornerRadius = 5
        mainInfo_View.autoresizingMask = .flexibleWidth
        view.backgroundColor = .systemGray
        view.addSubview(mainInfo_View)
        
        cityName_Label.text = "CityName"
        cityName_Label.frame = CGRect(x: 10, y: mainInfo_View.frame.height/3.5, width: mainInfo_View.frame.width - 20, height: 45)
        cityName_Label.font = UIFont(name: "Helvetica Neue", size: 40)
        cityName_Label.textAlignment = .center
        cityName_Label.autoresizingMask = .flexibleWidth
        mainInfo_View.addSubview(cityName_Label)
        
        mainTemp_Label.text = "-100"
        mainTemp_Label.frame = CGRect(x: 10, y: cityName_Label.frame.maxY, width: mainInfo_View.frame.width - 20, height: 70)
        mainTemp_Label.font = UIFont(name: "Helvetica Neue", size: 80)
        mainTemp_Label.textAlignment = .center
        mainTemp_Label.autoresizingMask = .flexibleWidth
        mainInfo_View.addSubview(mainTemp_Label)
        
        description_Label.text = "Description weather"
        description_Label.frame = CGRect(x: 10, y: mainTemp_Label.frame.maxY, width: mainInfo_View.frame.width - 20, height: 25)
        description_Label.font = UIFont(name: "Helvetica Neue", size: 20)
        description_Label.textAlignment = .center
        description_Label.autoresizingMask = .flexibleWidth
        mainInfo_View.addSubview(description_Label)
        
        maxminTemp_Label.text = "Maxx: +1000, minn: -1000"
        maxminTemp_Label.frame = CGRect(x: 10, y: description_Label.frame.maxY, width: mainInfo_View.frame.width - 20, height: 25)
        maxminTemp_Label.font = UIFont(name: "Helvetica Neue", size: 20)
        maxminTemp_Label.textAlignment = .center
        maxminTemp_Label.autoresizingMask = .flexibleWidth
        mainInfo_View.addSubview(maxminTemp_Label)
    }
}

