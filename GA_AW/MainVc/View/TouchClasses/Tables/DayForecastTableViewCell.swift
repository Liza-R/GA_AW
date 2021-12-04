//
//  DayForecastTableViewCell.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 04/12/2021.
//

import UIKit

class DayForecastTableViewCell: UITableViewCell {

    let hourWeather_Label = UILabel(),
        iconWeather_ImageV = UIImageView(),
        tempMinWeather_Label = UILabel(),
        tempMaxWeather_Label = UILabel(),
        tempHumWeather_Label = UILabel(),
        fallWeather_Base = UIView(),
        fallWeather_Color = UIView(),
        fallWeather_Circle = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        hourWeather_Label.font = UIFont.systemFont(ofSize: 18)
        tempMinWeather_Label.font = UIFont.boldSystemFont(ofSize: 20)
        tempMaxWeather_Label.font = UIFont.boldSystemFont(ofSize: 20)
        tempHumWeather_Label.font = UIFont.boldSystemFont(ofSize: 16)

        contentView.addSubview(hourWeather_Label)
        contentView.addSubview(iconWeather_ImageV)
        contentView.addSubview(tempMinWeather_Label)
        contentView.addSubview(tempMaxWeather_Label)
        contentView.addSubview(tempHumWeather_Label)
        contentView.addSubview(fallWeather_Base)
        
        fallWeather_Base.addSubview(fallWeather_Color)
        fallWeather_Color.addSubview(fallWeather_Circle)

        hourWeather_Label.frame = CGRect(x: 10, y: 0, width: 100, height: 60)
        hourWeather_Label.backgroundColor = .gray
        
        iconWeather_ImageV.frame = CGRect(x: hourWeather_Label.frame.maxX + 18, y: 10, width: 23, height: 23)
        iconWeather_ImageV.backgroundColor = .red
        
        tempHumWeather_Label.frame = CGRect(x: hourWeather_Label.frame.maxX + 5, y: iconWeather_ImageV.frame.maxY + 5, width: 50, height: 18)
        tempHumWeather_Label.backgroundColor = .purple
        tempHumWeather_Label.textAlignment = .center
        tempHumWeather_Label.textColor = .blue
        
        tempMinWeather_Label.frame = CGRect(x: tempHumWeather_Label.frame.maxX + 17, y: 0, width: 40, height: 60)
        tempMinWeather_Label.backgroundColor = .green
        tempMinWeather_Label.textAlignment = .center
        tempMinWeather_Label.textColor = .lightGray
        
        fallWeather_Base.frame = CGRect(x: tempMinWeather_Label.frame.maxX + 10, y: contentView.frame.height/2 + 4, width: 60, height: 4)
        fallWeather_Base.layer.cornerRadius = 2
        fallWeather_Base.backgroundColor = .white
        
        fallWeather_Color.frame = CGRect(x: 5, y: 0, width: 30, height: 4)
        fallWeather_Color.layer.cornerRadius = 2
        fallWeather_Color.backgroundColor = .blue
        
        fallWeather_Circle.frame = CGRect(x: 10, y: 0, width: 6, height: 6)
        fallWeather_Circle.layer.cornerRadius = 3
        fallWeather_Circle.backgroundColor = .white
        
        if #available(iOS 13.0, *) {
            fallWeather_Circle.layer.borderWidth = 1
            fallWeather_Circle.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        }
        
        tempMaxWeather_Label.frame = CGRect(x: fallWeather_Base.frame.maxX + 10, y: 0, width: 40, height: 60)
        tempMaxWeather_Label.backgroundColor = .green
        tempMaxWeather_Label.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
