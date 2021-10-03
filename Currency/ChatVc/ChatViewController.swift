//
//  ChatViewController.swift
//  Currency
//
//  Created by John Doe on 2021-10-02.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var editNameView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var sendView: UIView!
    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var sendTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        chatTableView.delegate = self
//        chatTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}
//extension ChatViewController: UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}

