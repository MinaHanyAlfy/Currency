//
//  ChattViewController.swift
//  Currency
//
//  Created by John Doe on 2021-10-06.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import FirebaseAuth
import FirebaseFirestore
import SDWebImage
import FirebaseDatabase

struct Messanger  {
    var message : String?
    var messageTime: Date?
    var uid: String?
    var uname: String?
}

struct Sender :SenderType {
    var senderId: String
    var displayName: String
}

struct MessageSender : MessageType {
    var sentDate: Date
    var sender: SenderType
    var messageId: String
    var kind: MessageKind
}

class ChattViewController: MessagesViewController, MessagesDataSource,MessagesLayoutDelegate,MessagesDisplayDelegate ,InputBarAccessoryViewDelegate{
    var database :DatabaseReference?
    
    let currentUser = Sender(senderId: "Test", displayName: "Lebanon Dollar")
    let otherUsers = Sender(senderId: "users", displayName: "")
    var messages : [MessageType] = []{
        didSet{
            DispatchQueue.main.async {
                
                self.messagesCollectionView.reloadData()
            }
        }
    }
    //    database
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database = Database.database().reference()
        //        messagesCollectionView.delegate = self
        //        messages.append(MessageSender(sentDate: Date(), sender: Sender(senderId: "asdasd", displayName: "Mina"), messageId: "sadsdasd", kind: .text("asas")))
        
        //        messages.append(MessageSender(sentDate: Date().addingTimeInterval(-12123), sender: otherUsers, messageId: "asdasd", kind: .text("Hellle")))
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        
        let controller = MessagesViewController()
        controller.resignFirstResponder()
        controller.setTypingIndicatorViewHidden(true, animated: true)
        controller.hidesBottomBarWhenPushed = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
        self.messagesCollectionView.scrollToBottom()
        //        DispatchQueue.main.async {
        //
        //                self.messagesCollectionView.scrollToLastItem()
        //
        //        }
        
    }
    override func viewDidLayoutSubviews() {
        messagesCollectionView.contentInset.bottom = messageInputBar.frame.height
        messagesCollectionView.scrollIndicatorInsets.bottom = messageInputBar.frame.height//input bar put in********
    }
    
    
    func getData(){
        let ref =  database?.child("message")
        ref?.observe(.childAdded, with: { (snapshot) in
            print("asdasda")
            let dic = snapshot.value as? [String:Any]
            let uid = dic?["uid"]
            let uname = dic?["uname"]
            let date = dic?["messageTime"] as? Date
            
            let message = dic?["message"]
            self.messages.append(MessageSender(sentDate: date ?? Date()
                                               , sender: Sender(senderId: "Id", displayName: "\(uname ?? "")"), messageId: "\(uid)", kind: .text("\(message ?? "")")))
            //            chatMessages.append((snapshot.value as? [String:Any]) ?? [:])
        })
        
    }
    
    func currentSender() -> SenderType {
        
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType{
        //        messageForItem(at: <#T##IndexPath#>, in: <#T##<<error type>>#>)
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    func avatarSize(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return .zero
    }
    
    func footerViewSize(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize(width: 0, height: 8)
    }
    
    func heightForLocation(message: MessageType, at indexPath: IndexPath, with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        
        return 0
    }
    
}

//extension ChattViewController {
//    private func insertNewMessage(_ message: Message) {
//    //add the message to the messages array and reload it
//    messages.append(MessageSender())
//    messagesCollectionView.reloadData()
//    DispatchQueue.main.async {
//    self.messagesCollectionView.scrollToLastItem(at: .bottom, animated: true)
//    }
//    }
//    private func save(_ message: MessageSender) {
//    //Preparing the data as per our firestore collection
//    let data: [String: Any] = [
//        "content": message.kind,
//    "created": message.sentDate,
//    "id": message.messageId,
//        "senderID": message.sender,
//    "senderName": message.sender
//    ]
//    //Writing it to the thread using the saved document reference we saved in load chat function
//    docReference?.collection("thread").addDocument(data: data, completion: { (error) in
//    if let error = error {
//    print("Error Sending message: \(error)")
//    return
//    }
//    self.messagesCollectionView.scrollToLastItem(at: .bottom, animated: true)
//    })
//    }
//}
