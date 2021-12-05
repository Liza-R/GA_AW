//
//  View.swift.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 03/12/2021.
//

import Foundation
import UIKit

class ViewVC{
    private let mainInfo_View = UIView(),
                cityName_Label = UILabel(),
                mainTemp_Label = UILabel(),
                description_Label = UILabel(),
                maxminTemp_Label = UILabel(),
                weather_Scroll = UIScrollView(),
                contentForScroll_View = UIView(),
                warning_View = UIView(),
                hourForecast_View = UIView(),
                hourForecast_Scroll = UIScrollView(),
                contentForHourScroll_View = UIView(),
                forecastTable_View = UIView(),
                mapFalls_View = UIView(),
                uvIndex_View = UIView(),
                sunrise_View = UIView(),
                wind_View = UIView(),
                falls_View = UIView(),
                feels_View = UIView(),
                humidity_View = UIView(),
                visibility_View = UIView(),
                pressure_View = UIView(),
                botton_View = UIView(),
                createUI = CreateUIs()

    private var mainW: CGFloat = 0,
                mainH: CGFloat = 0,
                mainView_ = UIView(),
                device_ = ""
    
    /**
     Calling a function to create a new UIView with the specified parameters.
     */
    func createAllViews(){
        createUI.createViews(userView: mainInfo_View, baseView: mainView_, x: 20, y: 40, width: mainW - 40, height: mainH/2.75, cornerRad: 0, color: .black)
        createUI.createViews(userView: warning_View, baseView: contentForScroll_View, x: 0, y: 0, width: contentForScroll_View.frame.width, height: 150, cornerRad: 15, color: backgroundViewsColor_)
        createUI.createViews(userView: hourForecast_View, baseView: contentForScroll_View, x: 0, y: warning_View.frame.maxY + 10, width: contentForScroll_View.frame.width, height: 150, cornerRad: 15, color: backgroundViewsColor_)
        createUI.createViews(userView: forecastTable_View, baseView: contentForScroll_View, x: 0, y: hourForecast_View.frame.maxY + 10, width: contentForScroll_View.frame.width, height: 630, cornerRad: 15, color: backgroundViewsColor_)
    }
    
    func createHorizontalCollection(collect: inout UICollectionView?){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 80, height: hourForecast_Scroll.frame.height)
        layout.minimumInteritemSpacing = 0
        collect = UICollectionView(frame: contentForHourScroll_View.frame, collectionViewLayout: layout)
        collect?.backgroundColor = .red
        hourForecast_Scroll.addSubview(collect ?? UICollectionView())
    }
    /**
     Calling a function to create a new UILabel with the specified parameters.
     */
    func createAllLabels(){
        createUI.createLabels(userLabel: cityName_Label, baseView: mainInfo_View, color: colorMainWeatherInfo, text: "Moscow", x: 0, y: mainInfo_View.frame.width/4, width: mainInfo_View.frame.width, height: 30, font: UIFont.systemFont(ofSize: 33))
        createUI.createLabels(userLabel: mainTemp_Label, baseView: mainInfo_View, color: colorMainWeatherInfo, text: "7°", x: 0, y: cityName_Label.frame.maxY, width: mainInfo_View.frame.width, height: 75, font: UIFont.systemFont(ofSize: 65))
        createUI.createLabels(userLabel: description_Label, baseView: mainInfo_View, color: colorMainWeatherInfo, text: "Cloudy", x: 0, y: mainTemp_Label.frame.maxY - 10, width: mainInfo_View.frame.width, height: 30, font: UIFont.systemFont(ofSize: 20))
        createUI.createLabels(userLabel: maxminTemp_Label, baseView: mainInfo_View, color: colorMainWeatherInfo, text: "H:8° L:4°", x: 0, y: description_Label.frame.maxY, width: mainInfo_View.frame.width, height: 25, font: UIFont.systemFont(ofSize: 18))
    }
    
    /**
     Calling a function to create a new UIScrollView with the specified parameters.
     */
    func createAllScrolls(){
        createUI.createScroll(baseView: mainView_, scroll: weather_Scroll, x: 20, y: mainInfo_View.frame.maxY + 10, width: mainW - 40, height: mainH - mainInfo_View.frame.height - 50, contentView: contentForScroll_View, color: .purple, contentSizeW: mainW - 40, contentSizeH: 2120, cornerRad: 0, backColor: .clear)
        
        createUI.createScroll(baseView: hourForecast_View, scroll: hourForecast_Scroll, x: 0, y: 30, width: contentForScroll_View.frame.width, height: 120, contentView: contentForHourScroll_View, color: .clear, contentSizeW: 2000, contentSizeH: 120, cornerRad: 15, backColor: .yellow)
    }
    
    /**
     Calling a function to create a new UITableView with the specified parameters.
        - table: is output UITableView.
     */
    func createAllTables(table: UITableView){
        forecastTable_View.addSubview(table)
        table.frame = CGRect(x: 0, y: 30, width: weather_Scroll.frame.width, height: 600)
        table.layer.cornerRadius = 15
        table.autoresizingMask = .flexibleWidth
        table.rowHeight = 60
        table.separatorStyle = .singleLine
        table.separatorColor = .white
        table.isScrollEnabled = false
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        table.separatorInset = .init(top: 0, left: 10, bottom: 0, right: 10)  
    }
    
    /**
     Calling a function to create a new UIView with map with the specified parameters.
     */
    func createMap(){
        createUI.createViews(userView: mapFalls_View, baseView: contentForScroll_View, x: 0, y: forecastTable_View.frame.maxY + 10, width: contentForScroll_View.frame.width, height: contentForScroll_View.frame.width/1.25, cornerRad: 15, color: backgroundViewsColor_)
    }
    
    func addHeaders(){
        createUI.addHeader(baseView: warning_View, text: "НЕБЛАГОПРИЯТНЫЕ ПОГОДНЫЕ УСЛОВИЯ", icon: imWarn, font: UIFont.systemFont(ofSize: 14))
        createUI.addHeader(baseView: hourForecast_View, text: "ПОЧАСОВОЙ ПРОГНОЗ", icon: imClock, font: fontForViewHeader)
        createUI.addHeader(baseView: forecastTable_View, text: "ПРОГНОЗ НА 10ДН", icon: imCalend, font: fontForViewHeader)
        createUI.addHeader(baseView: mapFalls_View, text: "ОСАДКИ", icon: imUmbr, font: fontForViewHeader)
    }
    
    func createLeftInfoViews(){
        let headName = ["УФ-ИНДЕКС", "ВЕТЕР", "ОЩУЩАЕТСЯ КАК", "ВИДИМОСТЬ"],
        headIcons = [imSun, imWind, imFeels, imEye],
        additionalViews = [uvIndex_View, wind_View, feels_View, visibility_View],
        coordViews = [mapFalls_View, uvIndex_View, wind_View, feels_View]
        for i in 0...3{
            createUI.createViews(userView: additionalViews[i], baseView: contentForScroll_View, x: 0, y: coordViews[i].frame.maxY + 10, width: contentForScroll_View.frame.width/2 - 5, height: 160, cornerRad: 15, color: backgroundViewsColor_)
            createUI.addHeader(baseView: additionalViews[i], text: headName[i], icon: headIcons[i], font: fontForViewHeader)
        }
    }
    func createRightInfoViews(){
        let headName = ["ВОСХОД СОЛНЦА", "ОСАДКИ", "ВЛАЖНОСТЬ", "ДАВЛЕНИЕ"],
        headIcons = [imSunR, imFalls, imHum, imPress],
        additionalViews = [sunrise_View, falls_View, humidity_View, pressure_View],
        coordViews = [mapFalls_View, sunrise_View, falls_View, humidity_View]
        for i in 0...3{
            createUI.createViews(userView: additionalViews[i], baseView: contentForScroll_View, x: contentForScroll_View.frame.width/2 + 5, y: coordViews[i].frame.maxY + 10, width: contentForScroll_View.frame.width/2 - 5, height: 160, cornerRad: 15, color: backgroundViewsColor_)
            createUI.addHeader(baseView: additionalViews[i], text: headName[i], icon: headIcons[i], font: fontForViewHeader)
        }
        let openMapButton = UIButton(),
            weatherInCityLabel = UILabel(),
            imageBottom = UIImageView()
        
        openMapButton.frame = CGRect(x: 0, y: pressure_View.frame.maxY + 10, width: contentForScroll_View.frame.width, height: 45)
        openMapButton.backgroundColor = .yellow
        
        weatherInCityLabel.frame = CGRect(x: 0, y: openMapButton.frame.maxY + 10, width: contentForScroll_View.frame.width, height: 20)
        weatherInCityLabel.textAlignment = .center
        weatherInCityLabel.textColor = .white
        weatherInCityLabel.font = UIFont.boldSystemFont(ofSize: 16)
        weatherInCityLabel.text = "Weather in city: Moscow"
        
        imageBottom.frame = CGRect(x: contentForScroll_View.frame.width/2 - 12.5, y: weatherInCityLabel.frame.maxY + 10, width: 25, height: 25)
        imageBottom.backgroundColor = .green
        
        contentForScroll_View.addSubview(openMapButton)
        contentForScroll_View.addSubview(weatherInCityLabel)
        contentForScroll_View.addSubview(imageBottom)
    }
 
    /**
     Calling a function to create a new UIView with the specified parameters.
        - mainView: is output UIView,
        - device: is output device (iPhone or iPad)
     */
    func createBottomView(mainView: UIView, device: String){
        mainView_ = mainView
        mainW = mainView.frame.width
        mainH = mainView.frame.height
        device_ = device
    }
}
