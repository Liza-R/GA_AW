//
//  ViewController.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {

    private let cityName_Label = UILabel(),
        mainTemp_Label = UILabel(),
        maxminTemp_Label = UILabel(),
        description_Label = UILabel(),
                
        contentForScroll_View = UIView(),
        weather_Scroll = UIScrollView(),
        hourForecast_Scroll = UIScrollView(),
        contentForHourScroll_View = UIView(),
//
        warning_View = UIView(),
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
        mainInfo_View.frame = CGRect(x: 20, y: 40, width: view.frame.width - 40, height: view.frame.height/3)
        mainInfo_View.autoresizingMask = .flexibleWidth
        view.backgroundColor = .blue
        view.addSubview(mainInfo_View)
        
        cityName_Label.text = "Moscow"
        cityName_Label.frame = CGRect(x: 0, y: mainInfo_View.frame.height/6, width: mainInfo_View.frame.width, height: 45)
        cityName_Label.font = UIFont(name: "Helvetica Neue", size: 33)
        cityName_Label.textAlignment = .center
        cityName_Label.autoresizingMask = .flexibleWidth
        mainInfo_View.addSubview(cityName_Label)
        
        mainTemp_Label.text = "7°"
        mainTemp_Label.frame = CGRect(x: 0, y: cityName_Label.frame.maxY, width: mainInfo_View.frame.width, height: 105)
        mainTemp_Label.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 105)
        mainTemp_Label.textAlignment = .center
        mainTemp_Label.autoresizingMask = .flexibleWidth
        mainInfo_View.addSubview(mainTemp_Label)
        
        description_Label.text = "Cloudy"
        description_Label.frame = CGRect(x: 0, y: mainTemp_Label.frame.maxY - 10, width: mainInfo_View.frame.width, height: 25)
        description_Label.font = UIFont(name: "Helvetica Neue", size: 20)
        description_Label.textAlignment = .center
        description_Label.autoresizingMask = .flexibleWidth
        mainInfo_View.addSubview(description_Label)
        
        maxminTemp_Label.text = "H:8° L:4°"
        maxminTemp_Label.frame = CGRect(x: 0, y: description_Label.frame.maxY, width: mainInfo_View.frame.width, height: 25)
        maxminTemp_Label.font = UIFont(name: "Helvetica Neue", size: 22)
        maxminTemp_Label.textAlignment = .center
        maxminTemp_Label.autoresizingMask = .flexibleWidth
        mainInfo_View.addSubview(maxminTemp_Label)
        
        let contentViewSize = CGSize(width: view.frame.width - 40, height: CGFloat(1600))

        weather_Scroll.frame = .zero
        weather_Scroll.backgroundColor = .clear
        weather_Scroll.contentSize = contentViewSize
        weather_Scroll.autoresizingMask = .flexibleWidth
        weather_Scroll.bounces = true
        view.addSubview(weather_Scroll)
        weather_Scroll.frame = CGRect(x: 20, y: mainInfo_View.frame.maxY + 10, width: view.frame.width - 40, height: view.frame.height - mainInfo_View.frame.height * 1.45)
        weather_Scroll.showsVerticalScrollIndicator = false
        weather_Scroll.showsHorizontalScrollIndicator = false

        contentForScroll_View.frame = .zero
        contentForScroll_View.autoresizingMask = .flexibleHeight
        contentForScroll_View.autoresizingMask = .flexibleWidth
        contentForScroll_View.frame.size = contentViewSize
        weather_Scroll.addSubview(contentForScroll_View)
        
        warning_View.backgroundColor = backgroundColor_
        warning_View.layer.cornerRadius = 15
        warning_View.frame = CGRect(x: 0, y: 0, width: contentForScroll_View.frame.width, height: 150)
        warning_View.autoresizingMask = .flexibleWidth
        contentForScroll_View.addSubview(warning_View)
        
        let contentViewSizeVert = CGSize(width: CGFloat(800), height: 150)

        hourForecast_Scroll.frame = .zero
        hourForecast_Scroll.contentSize = contentViewSizeVert
        hourForecast_Scroll.autoresizingMask = .flexibleWidth
        hourForecast_Scroll.bounces = true
        contentForScroll_View.addSubview(hourForecast_Scroll)
        hourForecast_Scroll.frame = CGRect(x: 0, y: warning_View.frame.maxY + 15, width: contentForScroll_View.frame.width, height: 150)
        hourForecast_Scroll.showsVerticalScrollIndicator = false
        hourForecast_Scroll.showsHorizontalScrollIndicator = false

        contentForHourScroll_View.frame = .zero
        hourForecast_Scroll.layer.cornerRadius = 20
        contentForHourScroll_View.backgroundColor = backgroundColor_
        contentForHourScroll_View.frame.size = contentViewSizeVert
        hourForecast_Scroll.addSubview(contentForHourScroll_View)
    }
}

