//
//  CreateUIs.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 03/12/2021.
//

import Foundation
import UIKit

class CreateUIs{
    
    /**
     Creation of UI element (UIView).
        - userView: is input view,
        - baseView: is view to host the userView,
        - color: is color for userView backgroundColor,
        - x: is x point,
        - y: is y point,
        - width: is width userView,
        - height: is height userView,
        - cornerRad: the radius to use when drawing rounded corners for the layer’s background
     */
    func createViews(userView: UIView, baseView: UIView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, cornerRad: CGFloat, color: UIColor){
        userView.backgroundColor = color
        userView.frame = CGRect(x: x, y: y, width: width, height: height)
        userView.autoresizingMask = .flexibleWidth
        userView.layer.cornerRadius = cornerRad
        baseView.addSubview(userView)
    }
    
    /**
     Creation of UI element (UILabels).
        - userLabel: is input label,
        - baseView: is view to host the userLabel,
        - color: is text color for userLabel,
        - text: is text for userLabel,
        - x: is x point,
        - y: is y point,
        - width: is width userLabel,
        - height: is height userLabel,
        - fontName: is font name,
        - fontSize: is font size
     */
    func createLabels(userLabel: UILabel, baseView: UIView, color: UIColor, text: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, font: UIFont){
        userLabel.text = text
        userLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        userLabel.font = font
        userLabel.textAlignment = .center
        userLabel.autoresizingMask = .flexibleWidth
        userLabel.textColor = color
        baseView.addSubview(userLabel)
    }
    
    /**
     Creation of UI element (UIScrollView).
        - baseView: is view to host the userLabel,
        - scroll: is input UIScrollView,
        - x: is x point,
        - y: is y point,
        - width: is width userLabel,
        - height: is height userLabel,
        - contentView: is view for replace content,
        - color: is color for contentView backgroundColor,
        - contentSizeW: is width of contentView,
        - contentSizeH: is heigth of contentView,
        - bounce: is controls whether the scroll view bounces past the edge of content and back again,
        - cornerRad: the radius to use when drawing rounded corners for the layer’s background,
        - backColor: is color for UIScrollView backgroundColor
     */
    func createScroll(baseView: UIView, scroll: UIScrollView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, contentView: UIView, color: UIColor, contentSizeW: CGFloat, contentSizeH: CGFloat, cornerRad: CGFloat, backColor: UIColor){
        let contentViewSize = CGSize(width: contentSizeW, height: contentSizeH)
        scroll.frame = .zero
        scroll.layer.cornerRadius = cornerRad
        scroll.backgroundColor = backColor
        scroll.contentSize = contentViewSize
        scroll.autoresizingMask = .flexibleWidth
        baseView.addSubview(scroll)
        scroll.frame = CGRect(x: x, y: y, width: width, height: height)
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        contentView.backgroundColor = color
        contentView.frame = .zero
        contentView.autoresizingMask = .flexibleWidth
        contentView.frame.size = contentViewSize
        scroll.addSubview(contentView)
    }

    /**
     Creation of UI element (UIView with map).
        - viewForMap: is view for map,
        - baseView: is view to host viewForMap,
        - x: is x point,
        - y: is y point,
        - width: is width viewForMap,
        - height: is height viewForMap,
        - color: is color for viewForMap backgroundColor,
        - cornerRad: the radius to use when drawing rounded corners for the layer’s background
     */
    func createViewMap(viewForMap: UIView, baseView: UIView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor, cornerRad: CGFloat){
        viewForMap.backgroundColor = color
        viewForMap.frame = CGRect(x: x, y: y, width: width, height: height)
        viewForMap.layer.cornerRadius = cornerRad
        viewForMap.autoresizingMask = .flexibleWidth
        baseView.addSubview(viewForMap)
    }
    
    func addHeader(baseView: UIView, text: String, icon: UIImage, font: UIFont){
        let viewHead = UIView(),
            iconHead = UIImageView(),
            labelHead = UILabel()
        viewHead.frame = CGRect(x: 0, y: 0, width: baseView.frame.width, height: 30)
        viewHead.autoresizingMask = .flexibleWidth
        baseView.addSubview(viewHead)
        iconHead.frame = CGRect(x: 10, y: 10, width: 14, height: 14)
        iconHead.image = icon
        iconHead.backgroundColor = .yellow
        labelHead.text = text
        labelHead.font = font
        labelHead.frame = CGRect(x: iconHead.frame.maxX + 5, y: 10, width: baseView.frame.width - 40, height: 15)
        labelHead.backgroundColor = .cyan
        labelHead.textColor = .black
        viewHead.addSubview(iconHead)
        viewHead.addSubview(labelHead)
    }
}
