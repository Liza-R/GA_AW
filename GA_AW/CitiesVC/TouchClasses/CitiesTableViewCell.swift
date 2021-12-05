//
//  CitiesTableViewCell.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 05/12/2021.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {

    let cityName_Label = UILabel(),
        cityAnima_View = UIView(),
        warning_ImageV = UIImageView(),
        updateTime_Label = UILabel(),
        warning_Label = UILabel(),
        temp_Label = UILabel(),
        maxTemp_Label = UILabel(),
        minTemp_Label = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        cityName_Label.font = UIFont.boldSystemFont(ofSize: 22)
        updateTime_Label.font = UIFont.systemFont(ofSize: 14)
        warning_Label.font = UIFont.systemFont(ofSize: 12)
        temp_Label.font = UIFont.systemFont(ofSize: 38)
        maxTemp_Label.font = UIFont.systemFont(ofSize: 16)
        minTemp_Label.font = UIFont.systemFont(ofSize: 16)

        contentView.addSubview(cityAnima_View)
        cityAnima_View.addSubview(cityName_Label)
        cityAnima_View.addSubview(updateTime_Label)
        cityAnima_View.addSubview(warning_Label)
        cityAnima_View.addSubview(temp_Label)
        cityAnima_View.addSubview(maxTemp_Label)
        cityAnima_View.addSubview(minTemp_Label)
        cityAnima_View.addSubview(warning_ImageV)

        cityAnima_View.layer.cornerRadius = 20
        cityAnima_View.backgroundColor = .purple
        cityAnima_View.frame = CGRect(x: 20, y: 5, width: contentView.frame.width - 40, height: 110)
        cityAnima_View.autoresizingMask = .flexibleWidth
        
        cityName_Label.frame = CGRect(x: 20, y: 10, width: cityAnima_View.frame.width/2, height: 20)
        cityName_Label.backgroundColor = .gray
        
        updateTime_Label.frame = CGRect(x: 20, y: cityName_Label.frame.maxY, width: 40, height: 20)
        updateTime_Label.backgroundColor = .gray
        
        warning_Label.frame = CGRect(x: 20, y: cityAnima_View.frame.maxY - 30, width: cityAnima_View.frame.maxX - 100, height: 16)
        warning_Label.backgroundColor = .gray
        
        warning_ImageV.frame = CGRect(x: 20, y: warning_Label.frame.minY - 20, width: 15, height: 15)
        warning_ImageV.backgroundColor = .gray
        
        temp_Label.frame = CGRect(x: cityAnima_View.frame.maxX - 50, y: 10, width: 80, height: 55)
        temp_Label.backgroundColor = .gray
        
        maxTemp_Label.frame = CGRect(x: cityAnima_View.frame.maxX - 50, y: temp_Label.frame.maxY + 5, width: 80, height: 15)
        maxTemp_Label.backgroundColor = .gray

        minTemp_Label.frame = CGRect(x: cityAnima_View.frame.maxX - 50, y: maxTemp_Label.frame.maxY + 1, width: 80, height: 15)
        minTemp_Label.backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
