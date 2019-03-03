//
//  MoreViewController.swift
//  SigSag
//
//  Created by 김시환 on 2019. 3. 3..
//  Copyright © 2019년 김시환. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    // MARK: Properties
    private let myTableView: UITableView = UITableView()
    private let items: [String] = ["로그인/회원가입", "공지사항", "설정"]
    
    // MARK: ViewController override method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "시그새그"
        
        // Do any additional setup after loading the view.
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.register(UITableViewCell.self,
                                  forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.myTableView)
        
        self.myTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top,
                                                   multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .bottom, relatedBy: .equal, toItem: self.view,
                                                   attribute: .bottom, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .leading, relatedBy: .equal, toItem: self.view,
                                                   attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .trailing, relatedBy: .equal, toItem: self.view,
                                                   attribute: .trailing, multiplier: 1.0, constant: 0))
    }
    
}

// MARK: UITableViewDelegate
extension MoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(items[indexPath.row])
        
        let didSelect = items[indexPath.row]
        
        if didSelect == "로그인/회원가입" {
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }
        
    }
}

// MARK: UITableViewDataSource
extension MoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")! as UITableViewCell
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
}
