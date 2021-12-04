//
//  HourForecastCollectionViewCell.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 04/12/2021.
//

import UIKit

class HourForecastCollectionViewCell: UICollectionViewCell {
    let hourLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    let iconImageV: UIImageView = {
        let icon = UIImageView()
        icon.backgroundColor = .systemPink
        return icon
    }()
    let tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect){
            super.init(frame: frame)
            addViews()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        backgroundColor = .clear
        addSubview(hourLabel)
        addSubview(iconImageV)
        addSubview(tempLabel)
        
        hourLabel.frame = CGRect(x: 0, y: 5, width: 80, height: 20)
        iconImageV.frame = CGRect(x: 0, y: hourLabel.frame.maxY + 15, width: 80, height: 30)
        tempLabel.frame = CGRect(x: 0, y: iconImageV.frame.maxY + 15, width: 80, height: 20)
    }
}
