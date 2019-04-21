//
//  MenuController.swift
//  SideMenu
//
//  Created by namtranx on 4/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class MenuController:UIViewController{
    
    var tableView: UITableView!
    private let reuseIdentifier = "MenuOptionCell"
    var menuOptionItems: [String] = ["1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView(){
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.backgroundColor = .darkGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuOptionTblCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
}
extension MenuController: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

extension MenuController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionTblCell
        cell.textLabel?.text = menuOptionItems[indexPath.row]
        return cell
    }
    
    
}
