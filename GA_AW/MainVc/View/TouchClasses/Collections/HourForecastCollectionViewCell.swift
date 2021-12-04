//
//  HourForecastCollectionViewCell.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 04/12/2021.
//

import UIKit

class HourForecastCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let hour_Label = UILabel(),
        iconWeather_ImageV = UIImageView(),
        temp_Label = UILabel()
    
    func setupViews() {
        backgroundColor = .red
        
        addSubview(hour_Label)
        addSubview(iconWeather_ImageV)
        addSubview(temp_Label)
        
        hour_Label.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 15)
        iconWeather_ImageV.frame = CGRect(x: 0, y: hour_Label.frame.maxY + 15, width: self.frame.width, height: 15)
        temp_Label.frame = CGRect(x: 0, y: iconWeather_ImageV.frame.maxY + 15, width: self.frame.width, height: 15)
    }
}
