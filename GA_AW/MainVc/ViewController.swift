//
//  ViewController.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 02/12/2021.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        let createUIs = ViewVC()
        createUIs.createAllViews(mainView: view)
        createUIs.createAllLabels(mainView: view)
        createUIs.createAllScrolls(mainView: view)
        CreateUIs().createViews(userView: <#T##UIView#>, baseView: <#T##UIView#>, color: <#T##UIColor#>, x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>, cornerRad: <#T##CGFloat#>)
    }
}
