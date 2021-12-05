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
        view.addSubview(bottomView)
        view.addSubview(mainScroll)
        bottomView.addSubview(mainPageControll)
        bottomView.addSubview(mapButton)
        bottomView.addSubview(configButton)
        mainScroll.delegate = self
        mainPageControll.addTarget(self, action: #selector(pageControllChange(_ :)), for: .valueChanged)
        configButton.addTarget(self, action: #selector(mapSender(_ :)), for: .touchUpInside)
        
        mainPageControll.numberOfPages = 5
        bottomView.backgroundColor = .blue
        mainScroll.backgroundColor = .red
    }
    
    @objc private func pageControllChange(_ sender: UIPageControl){
        let curPage = sender.currentPage
        mainScroll.setContentOffset(CGPoint(x: CGFloat(curPage) * view.frame.size.width, y: 0), animated: true)
    }
    
    @objc private func mapSender(_ sender: UIButton){
        present(CitiesViewController(), animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bottomView.frame = CGRect(x: 0, y: view.frame.size.height - 80, width: view.frame.size.width, height: 80)
        mapButton.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
        mapButton.backgroundColor = .purple
        mainPageControll.frame = CGRect(x: mapButton.frame.maxX + 10, y: 10, width: bottomView.frame.size.width - 120, height: 30)
        configButton.frame = CGRect(x: bottomView.frame.size.width - 50, y: 10, width: 30, height: 30)
        configButton.backgroundColor = .purple
        
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
            createUIs.createBottomView(mainView: page, device: UIDevice.current.model)
            createUIs.createAllViews()
            createUIs.createAllLabels()
            createUIs.createAllScrolls()
            
            hoursForecastCollection?.register(HourForecastCollectionViewCell.self, forCellWithReuseIdentifier: "hourForecastCell")
            hoursForecastCollection?.dataSource = self
            hoursForecastCollection?.delegate = self
            createUIs.createHorizontalCollection(collect: &hoursForecastCollection)
            
            createUIs.createMap()
            createUIs.addHeaders()
            createUIs.createLeftInfoViews()
            createUIs.createRightInfoViews()
            
            let daysForecastTable = UITableView()
            daysForecastTable.register(DayForecastTableViewCell.self, forCellReuseIdentifier: "dayForecastCell")
            daysForecastTable.delegate = self
            daysForecastTable.dataSource = self
            createUIs.createAllTables(table: daysForecastTable)

        }
    }

    struct AppUtility {
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask){
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
            self.lockOrientation(orientation)
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.portrait)
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
        cell.hourLabel.text = "\(indexPath.row)"
        cell.tempLabel.text = "-100*"
        return cell
    }
}

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        mainPageControll.currentPage = Int(floorf(Float(mainScroll.contentOffset.x) / Float(mainScroll.frame.size.width)))
    }
}
