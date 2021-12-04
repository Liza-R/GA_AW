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
    //stacks or collections

                forecastTable_View = UIView(),
                mapFalls_View = UIView(),
                //stacks or collections
                
//                uvIndex_View = UIView(),
//                sunrise_View = UIView(),
//                wind_View = UIView(),
//                falls_View = UIView(),
//                feels_View = UIView(),
//                humidity_View = UIView(),
//                visibility_View = UIView(),
//                pressure_View = UIView(),
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
        createUI.createViews(userView: mainInfo_View, baseView: mainView_, x: 20, y: 40, width: mainW - 40, height: mainH/3, cornerRad: 0, color: .black)
        createUI.createViews(userView: warning_View, baseView: contentForScroll_View, x: 0, y: 0, width: contentForScroll_View.frame.width, height: 150, cornerRad: 15, color: backgroundViewsColor_)
        createUI.createViews(userView: hourForecast_View, baseView: contentForScroll_View, x: 0, y: warning_View.frame.maxY + 10, width: contentForScroll_View.frame.width, height: 150, cornerRad: 15, color: backgroundViewsColor_)
        createUI.createViews(userView: forecastTable_View, baseView: contentForScroll_View, x: 0, y: hourForecast_View.frame.maxY + 10, width: contentForScroll_View.frame.width, height: mainH - 215, cornerRad: 15, color: backgroundViewsColor_)
        createUI.addHeader(baseView: hourForecast_View, text: "ПОЧАСОВОЙ ПРОГНОЗ", icon: imClock)
        createUI.addHeader(baseView: forecastTable_View, text: "ПРОГНОЗ НА 10ДН", icon: imCalend)
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
        createUI.createLabels(userLabel: cityName_Label, baseView: mainInfo_View, color: colorMainWeatherInfo, text: "Moscow", x: 0, y: mainInfo_View.frame.width/6, width: mainInfo_View.frame.width, height: 45, fontName: fontStyleWeatherInfoText, fontSize: 33)
        createUI.createLabels(userLabel: mainTemp_Label, baseView: mainInfo_View, color: colorMainWeatherInfo, text: "7°", x: 0, y: cityName_Label.frame.maxY, width: mainInfo_View.frame.width, height: 105, fontName: fontStyleForNumbs, fontSize: 105)
        createUI.createLabels(userLabel: description_Label, baseView: mainInfo_View, color: colorMainWeatherInfo, text: "Cloudy", x: 0, y: mainTemp_Label.frame.maxY - 10, width: mainInfo_View.frame.width, height: 25, fontName: fontStyleWeatherInfoText, fontSize: 20)
        createUI.createLabels(userLabel: maxminTemp_Label, baseView: mainInfo_View, color: colorMainWeatherInfo, text: "H:8° L:4°", x: 0, y: description_Label.frame.maxY, width: mainInfo_View.frame.width, height: 25, fontName: fontStyleWeatherInfoText, fontSize: 22)
    }
    
    /**
     Calling a function to create a new UIScrollView with the specified parameters.
     */
    func createAllScrolls(){
        createUI.createScroll(baseView: mainView_, scroll: weather_Scroll, x: 20, y: mainInfo_View.frame.maxY + 10, width: mainW - 40, height: mainH - mainInfo_View.frame.height - 130, contentView: contentForScroll_View, color: .purple, contentSizeW: mainW - 40, contentSizeH: 2000, bounce: true, cornerRad: 0, backColor: .clear)
        var contentSizeW: CGFloat = 1000
        if contentSizeW < mainW{ contentSizeW = mainW }
        createUI.createScroll(baseView: hourForecast_View, scroll: hourForecast_Scroll, x: 0, y: 30, width: contentForScroll_View.frame.width, height: 120, contentView: contentForHourScroll_View, color: .clear, contentSizeW: 2000, contentSizeH: 120, bounce: false, cornerRad: 15, backColor: .yellow)
    }
    
    /**
     Calling a function to create a new UITableView with the specified parameters.
        - table: is output UITableView.
     */
    func createAllTables(table: UITableView){
        forecastTable_View.addSubview(table)
        table.frame = CGRect(x: 0, y: 30, width: weather_Scroll.frame.width, height: mainH - 245)
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
        createUI.createViews(userView: mapFalls_View, baseView: contentForScroll_View, x: 0, y: forecastTable_View.frame.maxY + 10, width: contentForScroll_View.frame.width, height: contentForScroll_View.frame.width/1.3, cornerRad: 15, color: backgroundViewsColor_)
        createUI.addHeader(baseView: mapFalls_View, text: "ОСАДКИ", icon: imUmbr)
    }
    
//    func createLeftInfoViews(){
//        createUI.createViews(userView: uvIndex_View, baseView: contentForScroll_View, x: 0, y: mapFalls_View.frame.maxY + 10, width: contentForScroll_View.frame.width/2 - 5, height: 150, cornerRad: 15, color: backgroundViewsColor_)
//        createUI.addHeader(baseView: uvIndex_View, text: "УФ-ИНДЕКС", icon: imSun)
//        createUI.createViews(userView: wind_View, baseView: contentForScroll_View, x: 0, y: uvIndex_View.frame.maxY + 10, width: contentForScroll_View.frame.width/2 - 5, height: 150, cornerRad: 15, color: backgroundViewsColor_)
//        createUI.addHeader(baseView: wind_View, text: "ВЕТЕР", icon: imWind)
//        createUI.createViews(userView: feels_View, baseView: contentForScroll_View, x: 0, y: wind_View.frame.maxY + 10, width: contentForScroll_View.frame.width/2 - 5, height: 150, cornerRad: 15, color: backgroundViewsColor_)
//        createUI.addHeader(baseView: feels_View, text: "ОЩУЩАЕТСЯ КАК", icon: imFeels)
//        createUI.createViews(userView: visibility_View, baseView: contentForScroll_View, x: 0, y: feels_View.frame.maxY + 10, width: contentForScroll_View.frame.width/2 - 5, height: 150, cornerRad: 15, color: backgroundViewsColor_)
//        createUI.addHeader(baseView: visibility_View, text: "ВИДИМОСТЬ", icon: imEye)
//    }
//    func createRightInfoViews(){
//        createUI.createViews(userView: sunrise_View, baseView: contentForScroll_View, x: uvIndex_View.frame.maxX + 10, y: mapFalls_View.frame.maxY + 10, width: contentForScroll_View.frame.width/2 - 5, height: 150, cornerRad: 15, color: backgroundViewsColor_)
//        createUI.addHeader(baseView: sunrise_View, text: "ВОСХОД СОЛНЦА", icon: imSunR)
//
//        createUI.createViews(userView: falls_View, baseView: contentForScroll_View, x: wind_View.frame.maxX + 10, y: sunrise_View.frame.maxY + 10, width: contentForScroll_View.frame.width/2 - 5, height: 150, cornerRad: 15, color: backgroundViewsColor_)
//        createUI.addHeader(baseView: falls_View, text: "ОСАДКИ", icon: imUmbr)
//
//        createUI.createViews(userView: humidity_View, baseView: contentForScroll_View, x: feels_View.frame.maxX + 10, y: falls_View.frame.maxY + 10, width: contentForScroll_View.frame.width/2 - 5, height: 150, cornerRad: 15, color: backgroundViewsColor_)
//        createUI.addHeader(baseView: humidity_View, text: "ВЛАЖНОСТЬ", icon: imUmbr)
//
//        createUI.createViews(userView: pressure_View, baseView: contentForScroll_View, x: visibility_View.frame.maxX + 10, y: humidity_View.frame.maxY + 10, width: contentForScroll_View.frame.width/2 - 5, height: 150, cornerRad: 15, color: backgroundViewsColor_)
//        createUI.addHeader(baseView: pressure_View, text: "ДАВЛЕНИЕ", icon: imPress)
//    }
//
    
    /**
     Calling a function to create a new UIView with the specified parameters.
        - mainView: is output UIView,
        - device: is output device (iPhone or iPad)
     */
    func createButtomView(mainView: UIView, device: String){
        mainView_ = mainView
        mainW = mainView.frame.width
        mainH = mainView.frame.height
        mainView.backgroundColor = .blue
        device_ = device
        createUI.createViews(userView: botton_View, baseView: mainView_, x: 0, y: mainView_.frame.maxY - 80, width: mainW, height: 80, cornerRad: 0, color: backgroundViewsColor_)
    }
}
