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
                hourForecast_Scroll = UIScrollView(),
                contentForHourScroll_View = UIView(),
                //stacks or collections
                forecastTable = UITableView(),
                mapFalls_View = UIView(),
    
                backgroundColor_ = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3),
                fontStyleWeatherInfoText = "Helvetica Neue",
                fontStyleForNumbs = "AppleSDGothicNeo-UltraLight",
                createUI = CreateUIs()
    private var mainW: CGFloat = 0,
                mainH: CGFloat = 0
    
    /**
     Calling a function to create a new UIView with the specified parameters.
        - mainView: is output view.
     */
    func createAllViews(mainView: UIView){
        mainW = mainView.frame.width
        mainH = mainView.frame.height
        mainView.backgroundColor = .blue
        createUI.createViews(userView: mainInfo_View, baseView: mainView, color: .black, x: 20, y: 40, width: mainW - 40, height: mainH/3, cornerRad: 0)
        createUI.createViews(userView: warning_View, baseView: contentForScroll_View, color: backgroundColor_, x: 0, y: 0, width: contentForScroll_View.frame.width, height: 150, cornerRad: 15)
    }
    
    /**
     Calling a function to create a new UILabel with the specified parameters.
        - mainView: is output view.
     */
    func createAllLabels(mainView: UIView){
        createUI.createLabels(userLabel: cityName_Label, baseView: mainInfo_View, text: "Moscow", x: 0, y: mainInfo_View.frame.width/6, width: mainInfo_View.frame.width, height: 45, fontName: fontStyleWeatherInfoText, fontSize: 33)
        createUI.createLabels(userLabel: mainTemp_Label, baseView: mainInfo_View, text: "7°", x: 0, y: cityName_Label.frame.maxY, width: mainInfo_View.frame.width, height: 105, fontName: fontStyleForNumbs, fontSize: 105)
        createUI.createLabels(userLabel: description_Label, baseView: mainInfo_View, text: "Cloudy", x: 0, y: mainTemp_Label.frame.maxY - 10, width: mainInfo_View.frame.width, height: 25, fontName: fontStyleWeatherInfoText, fontSize: 20)
        createUI.createLabels(userLabel: maxminTemp_Label, baseView: mainInfo_View, text: "H:8° L:4°", x: 0, y: description_Label.frame.maxY, width: mainInfo_View.frame.width, height: 25, fontName: fontStyleWeatherInfoText, fontSize: 22)
    }
    
    /**
     Calling a function to create a new UIScrollView with the specified parameters.
        - mainView: is output view.
     */
    func createAllScrolls(mainView: UIView){
        createUI.createScroll(baseView: mainView, scroll: weather_Scroll, x: 20, y: mainInfo_View.frame.maxY + 10, width: mainW - 40, height: mainH - mainInfo_View.frame.height * 1.45, contentView: contentForScroll_View, color: .purple, contentSizeW: mainW - 40, contentSizeH: 2000, bounce: true, cornerRad: 0)
        var contentSizeW: CGFloat = 1000
        if contentSizeW < mainW{ contentSizeW = mainW }
        createUI.createScroll(baseView: contentForScroll_View, scroll: hourForecast_Scroll, x: 0, y: warning_View.frame.maxY + 15, width: contentForScroll_View.frame.width, height: 150, contentView: contentForHourScroll_View, color: backgroundColor_, contentSizeW: contentSizeW, contentSizeH: 150, bounce: false, cornerRad: 15)
    }
    /**
     Calling a function to create a new UITableView with the specified parameters.
        - mainView: is output view.
     */
    func createAllTables(mainView: UIView){
        createUI.createTable(table: forecastTable, baseView: contentForScroll_View, x: 0, y: hourForecast_Scroll.frame.maxY + 15, width: weather_Scroll.frame.width, height: mainView.frame.height - 200, color: backgroundColor_, cornerRad: 15, rowH: 50)
        forecastTable.register(ForecastTableViewCell.self, forCellReuseIdentifier: "forecastCell")
    }
    
    /**
     Calling a function to create a new UIView with map with the specified parameters.
        - mainView: is output view.
     */
    func createMap(mainView: UIView){
        createUI.createViewMap(viewForMap: mapFalls_View, baseView: contentForScroll_View, x: 0, y: forecastTable.frame.maxY + 15, width: contentForScroll_View.frame.width, height: contentForScroll_View.frame.width/1.3, color: backgroundColor_, cornerRad: 15)
    }
}
