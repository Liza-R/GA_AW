//
//  ForecastTableViewCell.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 03/12/2021.
//

import UIKit

class ForecastTableViewCell: UITableViewCell{

    let date_Label = UILabel(),
        iconWeather_Image = UIImageView(),
        fallsNum_Label = UILabel(),
        minTemp_Label = UILabel(),
        //xzxz
        maxTempLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        date_Label.textColor = .white
        date_Label.frame = CGRect(x: 10, y: 10, width: 100, height: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
