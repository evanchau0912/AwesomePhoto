//
//  ContainerController.swift
//  SideMenu
//
//  Created by namtranx on 4/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class ContainerController: UIViewController{
    
    //MARK: properties
    var menuController: UIViewController!
    var centerController: UIViewController!
    var isExpand: Bool = false
    //MARK: init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configHomeController()
    }
    
    //MARK: handlers
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func configHomeController(){
        let homeController = MainPersonalController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configMenuController(){
        if menuController == nil{
            menuController = MenuController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("did add anything menu controller")
        }
    }
    
    func showMenuController(shouldExpand: Bool){
        if shouldExpand{
            //show
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        }else{
            //hide
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }, completion: nil)
        }
    }
}

extension ContainerController: PersonalControllerDelegate{
    func handleMenuToggle() {
        if !isExpand{
            configMenuController()
        }
        isExpand = !isExpand
        showMenuController(shouldExpand: isExpand)
    }
    
    
}
