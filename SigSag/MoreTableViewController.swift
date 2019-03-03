//
//  MoreTableViewController.swift
//  SigSag
//
//  Created by 김시환 on 2019. 3. 3..
//  Copyright © 2019년 김시환. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {
    
    private let more = ["로그인/회원가입", "공지사항", "설정"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "시그새그"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return more.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        cell.textLabel?.text = more[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let didSelect = more[indexPath.row]
        
        if didSelect == "로그인/회원가입" {
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }

}
