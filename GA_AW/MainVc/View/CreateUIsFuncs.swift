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
        - userView: UIView is input view,
        - baseView: UIView is view to host the userView,
        - color: UIColor is color for userView backgroundColor,
        - x: CGFloat is x point,
        - y: CGFloat is y point,
        - width: CGFloat is width userView,
        - height: CGFloat is height userView,
        - cornerRad: CGFloat the radius to use when drawing rounded corners for the layer’s background
     */
    func createViews(userView: UIView, baseView: UIView, color: UIColor, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, cornerRad: CGFloat){
        userView.backgroundColor = color
        userView.frame = CGRect(x: x, y: y, width: width, height: height)
        userView.autoresizingMask = .flexibleWidth
        userView.layer.cornerRadius = cornerRad
        baseView.addSubview(userView)
    }
    
    /**
     Creation of UI element (UILabels).
        - userLabel: UILabel is input label,
        - baseView: UIView is view to host the userLabel,
        - text: String is text for userLabel,
        - x: CGFloat is x point,
        - y: CGFloat is y point,
        - width: CGFloat is width userLabel,
        - height: CGFloat is height userLabel,
        - fontName: String is font name,
        - fontSize: CGFloat is font size
     */
    func createLabels(userLabel: UILabel, baseView: UIView, text: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, fontName: String, fontSize: CGFloat){
        userLabel.text = text
        userLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        userLabel.font = UIFont(name: fontName, size: fontSize)
        userLabel.textAlignment = .center
        userLabel.autoresizingMask = .flexibleWidth
        baseView.addSubview(userLabel)
    }
    
    /**
     Creation of UI element (UIScrollView).
        - baseView: UIView is view to host the userLabel,
        - scroll: UIScrollView is input UIScrollView,
        - x: CGFloat is x point,
        - y: CGFloat is y point,
        - width: CGFloat is width userLabel,
        - height: CGFloat is height userLabel,
        - contentView: UIView is view for replace content,
        - color: UIColor is color for contentView backgroundColor,
        - contentSizeW: CGFloat is width of contentView,
        - contentSizeH: CGFloat is heigth of contentView,
        - bounce: Bool is controls whether the scroll view bounces past the edge of content and back again,
        - cornerRad: CGFloat the radius to use when drawing rounded corners for the layer’s background
     */
    func createScroll(baseView: UIView, scroll: UIScrollView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, contentView: UIView, color: UIColor, contentSizeW: CGFloat, contentSizeH: CGFloat, bounce: Bool, cornerRad: CGFloat){
        let contentViewSize = CGSize(width: contentSizeW, height: contentSizeH)
        scroll.frame = .zero
        scroll.bounces = bounce
        scroll.layer.cornerRadius = cornerRad
        scroll.backgroundColor = .clear
        scroll.contentSize = contentViewSize
        scroll.autoresizingMask = .flexibleWidth
        baseView.addSubview(scroll)
        scroll.frame = CGRect(x: x, y: y, width: width, height: height)
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        contentView.backgroundColor = color
        contentView.frame = .zero
        contentView.autoresizingMask = .flexibleHeight
        contentView.frame.size = contentViewSize
        scroll.addSubview(contentView)
    }
}
