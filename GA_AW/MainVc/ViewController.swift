//
//  ViewController.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 02/12/2021.
//

import UIKit

class ViewController: UIViewController{
    
    private let mainScroll = UIScrollView(),
                mainPageControll = UIPageControl(),
                bottomView = UIView(),
                mapButton = UIButton(),
                configButton = UIButton()
    
    private var hoursForecastCollection: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainScroll.delegate = self
        mainPageControll.addTarget(self, action: #selector(pageControllChange(_ :)), for: .valueChanged)
        
//        configButton.addTarget(self, action: #selector(citiesSender(_ :)), for: .touchUpInside)
//        mapButton.addTarget(self, action: #selector(mapSender(_ :)), for: .touchUpInside)
        
        view.addSubview(mainScroll)
        bottomView.addSubview(mainPageControll)

        mainPageControll.numberOfPages = 2
        mainScroll.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.portrait)
    }
    
    @objc private func pageControllChange(_ sender: UIPageControl){
        mainScroll.setContentOffset(CGPoint(x: CGFloat(sender.currentPage) * view.frame.size.width, y: 0), animated: true)
    }
    
    // Router
//    @objc private func citiesSender(_ sender: UIButton){
//        let vc = CitiesViewController()
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
//    }
//
//    @objc private func mapSender(_ sender: UIButton){
//        let vc = MapViewController()
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        CreateUIs().createViews(userView: bottomView, baseView: self.view, x: 0, y: view.frame.size.height - 80, width: view.frame.size.width, height: 80, cornerRad: 0, color: .blue)
        CreateUIs().createButtons(userButton: mapButton, baseView: bottomView, x: 20, y: 10, width: 30, height: 30, cornerRad: 0, color: .purple)
        CreateUIs().createButtons(userButton: configButton, baseView: bottomView, x: bottomView.frame.size.width - 50, y: 10, width: 30, height: 30, cornerRad: 0, color: .purple)
        
        mainPageControll.frame = CGRect(x: mapButton.frame.maxX + 10, y: 10, width: bottomView.frame.size.width - 120, height: 30)
        mainScroll.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 80)
        
        if mainScroll.subviews.count == 2{
            configMainScroll()
        }
    }
    
    private func configMainScroll(){
        mainScroll.contentSize = CGSize(width: view.frame.size.width * CGFloat(mainPageControll.numberOfPages), height: mainScroll.frame.size.height)
        mainScroll.isPagingEnabled = true
        
        for i in 0..<mainPageControll.numberOfPages{
            let page = UIView(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: mainScroll.frame.size.height))
            mainScroll.addSubview(page)
            let createUIs = ViewVC()
            createUIs.deviceInfo(mainView: page, device: UIDevice.current.model)
            createUIs.createAllViews()
            createUIs.createAllLabels()
            createUIs.createAllScrolls()
            
            createUIs.createMap()
            createUIs.addHeaders()
            createUIs.createLeftInfoViews()
            createUIs.createRightInfoViews()
            createUIs.createViewsForInfo()
            
            hoursForecastCollection?.register(HourForecastCollectionViewCell.self, forCellWithReuseIdentifier: "hourForecastCell")
            hoursForecastCollection?.dataSource = self
            hoursForecastCollection?.delegate = self
            createUIs.createHorizontalCollection(collect: &hoursForecastCollection)

            let daysForecastTable = UITableView()
            daysForecastTable.register(DayForecastTableViewCell.self, forCellReuseIdentifier: "dayForecastCell")
            daysForecastTable.delegate = self
            daysForecastTable.dataSource = self
            createUIs.createAllTables(table: daysForecastTable)
            
        }
    }

    struct AppUtility{
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask){
            if let delegate = UIApplication.shared.delegate as? AppDelegate{
                delegate.orientationLock = orientation
            }
        }
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation: UIInterfaceOrientation) {
            self.lockOrientation(orientation)
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayForecastCell", for: indexPath) as! DayForecastTableViewCell
        cell.hourWeather_Label.text = "Segodnya"
        cell.tempHumWeather_Label.text = "100%"
        cell.tempMaxWeather_Label.text = "10*"
        cell.tempMinWeather_Label.text = "-10*"
        cell.selectionStyle = .none
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
        cell.hourLabel.text = "hour"
        cell.tempLabel.text = "-100*"
        cell.iconImageV.image = imWarn
        return cell
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        mainPageControll.currentPage = Int(floorf(Float(mainScroll.contentOffset.x) / Float(mainScroll.frame.size.width)))
    }
}
