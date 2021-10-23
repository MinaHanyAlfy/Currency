//
//  ChatViewController.swift
//  Currency
//
//  Created by John Doe on 2021-10-02.
//

import UIKit
import FirebaseCore
import FirebaseDatabase
import Alamofire
import Reachability
class ChatViewController: UIViewController {
    @IBOutlet weak var editNameView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var sendView: UIView!
    @IBOutlet weak var chatTableView: UITableView!
    private let database = Database.database().reference()
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var sendTextField: UITextField!
    let date = Date()
    let calendar = Calendar.current
   
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        sendButton.addTarget(self, action: #selector(sendMessages), for: .touchUpInside)
//        let reachability = try! Reachability()
//        if let check = NetworkReachabilityManager()?.isReachable,check{
////            database
//        }
        // Do any additional setup after loading the view.
        registerCell()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sendButton.clipsToBounds = true
        sendButton.layer.cornerRadius = 12
    }
    func registerCell(){
        chatTableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
    }
    @objc func sendMessages() {
        if sendTextField.text != nil && sendTextField.text != "" {
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            let obj : [String : Any] = [
                "uid":"iOS\(date)\(Int.random(in: 0...100))" as NSString ,
                "uname":"iOS" as NSString,
                "message":"\(sendTextField.text ?? "")" as NSString,
                "messageTime":date as NSDate
        ]
         
            
//            self.ref.child("users").child(user.uid).setValue(["username": username])
        }
    }
}
extension ChatViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        return cell
    }


}

