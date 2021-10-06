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
let currentUser = Sender(senderId: "Test", displayName: "Lebanon Dollar")
    let otherUsers = Sender(senderId: "users", displayName: "")
    var messages = [MessageType]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        messagesCollectionView.delegate = self
        messages.append(MessageSender(sentDate: Date(), sender: Sender(senderId: "asdasd", displayName: "Mina"), messageId: "sadsdasd", kind: .text("asas")))
    
        messages.append(MessageSender(sentDate: Date().addingTimeInterval(-12123), sender: otherUsers, messageId: "asdasd", kind: .text("Hellle")))
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        // Do any additional setup after loading the view.
    }

    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
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
