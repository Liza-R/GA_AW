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
     Creation of UI element (UIButton).
        - userButton: is input button,
        - baseView: is view to host the userButton,
        - color: is color for userButton backgroundColor,
        - x: is x point,
        - y: is y point,
        - width: is width userButton,
        - height: is height userButton,
        - cornerRad: the radius to use when drawing rounded corners for the layer’s background
     */
    func createButtons(userButton: UIButton, baseView: UIView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, cornerRad: CGFloat, color: UIColor){
        userButton.backgroundColor = color
        userButton.frame = CGRect(x: x, y: y, width: width, height: height)
        userButton.autoresizingMask = .flexibleWidth
        userButton.layer.cornerRadius = cornerRad
        baseView.addSubview(userButton)
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
    func createLabels(userLabel: UILabel, baseView: UIView, color: UIColor, text: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, font: UIFont, textAlignment: NSTextAlignment){
        userLabel.text = text
        userLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        userLabel.font = font
        userLabel.textAlignment = textAlignment
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
    func createScroll(baseView: UIView, scroll: UIScrollView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, cornerRad: CGFloat, backColor: UIColor){
        scroll.frame = .zero
        scroll.layer.cornerRadius = cornerRad
        scroll.backgroundColor = backColor
        scroll.autoresizingMask = .flexibleWidth
        baseView.addSubview(scroll)
        scroll.frame = CGRect(x: x, y: y, width: width, height: height)
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
    }
    
    func createContentAreaScroll(scroll: UIScrollView, contentSizeW: CGFloat, contentSizeH: CGFloat, contentView: UIView, color: UIColor){
        let contentViewSize = CGSize(width: contentSizeW, height: contentSizeH)
        scroll.contentSize = contentViewSize
        contentView.backgroundColor = color
        contentView.frame = .zero
        contentView.autoresizingMask = .flexibleWidth
        contentView.frame.size = contentViewSize
        scroll.addSubview(contentView)
    }
    
    /**
     Creation of UI element (UIImageView).
        - imageView: is UIImageView,
        - baseView: is view to host imageView,
        - x: is x point,
        - y: is y point,
        - width: is width imageView,
        - height: is height imageView,
        - color: is color for imageView backgroundColor,
        - icon: is icon for imageView
     */
    func createImage(imageView: UIImageView, baseView: UIView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor, icon: UIImage){
        imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        imageView.image = icon
        imageView.backgroundColor = .yellow
        baseView.addSubview(imageView)
    }
    
    func createTable(table: UITableView, baseView: UIView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, cornerRad: CGFloat, rowHeight: CGFloat, separatorStyle: UITableViewCell.SeparatorStyle, separatorColor: UIColor){
        baseView.addSubview(table)
        table.frame = CGRect(x: x, y: y, width: width, height: height)
        table.layer.cornerRadius = cornerRad
        table.autoresizingMask = .flexibleWidth
        table.rowHeight = rowHeight
        table.separatorStyle = separatorStyle
        table.separatorColor = separatorColor
        table.isScrollEnabled = false
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        table.separatorInset = .init(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    /**
     Creating a header for UIs elements.
        - baseView: is view to host header,
        - text: is text the header title,
        - icon: is image to illustrate the header title,
        - font: is font the header title
     */
    func addHeader(baseView: UIView, text: String, icon: UIImage, font: UIFont){
        let viewHead = UIView(),
            iconHead = UIImageView(),
            labelHead = UILabel()
        createViews(userView: viewHead, baseView: baseView, x: 0, y: 0, width: baseView.frame.width, height: 30, cornerRad: 0, color: .clear)
        createImage(imageView: iconHead, baseView: viewHead, x: 10, y: 10, width: 14, height: 14, color: .yellow, icon: icon)
        createLabels(userLabel: labelHead, baseView: viewHead, color: .black, text: text, x: iconHead.frame.maxX + 5, y: 10, width: baseView.frame.width - 40, height: 15, font: font, textAlignment: .left)
    }
}
