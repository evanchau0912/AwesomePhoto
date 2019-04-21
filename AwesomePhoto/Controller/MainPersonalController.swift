//
//  MainPersonalController.swift
//  SideMenu
//
//  Created by namtranx on 4/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "personalCollectionViewCell"

class MainPersonalController:UIViewController{
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var avtImageView: UIImageView!
    
    @IBOutlet weak var uploadPhotoImageView: UIImageView!
    
    var delegate: PersonalControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        //view.backgroundColor = .white
        //configNavigationBar()
    }
    
    func updateUI(){
        avtImageView.layer.cornerRadius = avtImageView.frame.height / 2.0
        avtImageView.layer.masksToBounds = true
        uploadPhotoImageView.layer.cornerRadius = uploadPhotoImageView.frame.height/2
        uploadPhotoImageView.layer.masksToBounds = true
    }
    
    func configNavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleMenuToggle))
        
    }
    
    @objc func handleMenuToggle(){
        print("toggle menu..")
        delegate?.handleMenuToggle()
    }
}
