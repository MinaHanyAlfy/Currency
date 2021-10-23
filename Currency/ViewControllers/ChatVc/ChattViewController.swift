
import UIKit
import MessageKit
import InputBarAccessoryView
import FirebaseAuth
import FirebaseFirestore
import SDWebImage
import FirebaseDatabase
import Kingfisher
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
    let date = Date()
    let calendar = Calendar.current
//    private let database = Database.database().reference()
    //    func didTapBackground(in cell: MessageCollectionViewCell) {
    //        <#code#>
    //    }
    //
    //    func didTapMessage(in cell: MessageCollectionViewCell) {
    //        <#code#>
    //    }
    //
    //    func didTapAvatar(in cell: MessageCollectionViewCell) {
    //        <#code#>
    //    }
    //
    //    func didTapCellTopLabel(in cell: MessageCollectionViewCell) {
    //        <#code#>
    //    }
    //
    //    func didTapCellBottomLabel(in cell: MessageCollectionViewCell) {
    //        <#code#>
    //    }
    //
    //    func didTapMessageTopLabel(in cell: MessageCollectionViewCell) {
    //        <#code#>
    //    }
    //
    //    func didTapMessageBottomLabel(in cell: MessageCollectionViewCell) {
    //        <#code#>
    //    }
    //
    //    func didTapAccessoryView(in cell: MessageCollectionViewCell) {
    //        <#code#>
    //    }
    //
    //    func didTapImage(in cell: MessageCollectionViewCell) {
    //        <#code#>
    //    }
    //
    //    func didTapPlayButton(in cell: AudioMessageCell) {
    //        <#code#>
    //    }
    //
    //    func didStartAudio(in cell: AudioMessageCell) {
    //        <#code#>
    //    }
    //
    //    func didPauseAudio(in cell: AudioMessageCell) {
    //        <#code#>
    //    }
    //
    //    func didStopAudio(in cell: AudioMessageCell) {
    //        <#code#>
    //    }
    //
    var database :DatabaseReference?
    
    let currentUser = Sender(senderId: "Test", displayName: "Lebanon Dollar")
    let otherUsers = Sender(senderId: "users", displayName: "")
    var messages = [MessageType]()
    //    database
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database = Database.database().reference()
   
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDataSource = self
        //messagesCollectionView.messageCellDelegate = self
        messageInputBar.delegate = self
        let controller = MessagesViewController()
        controller.resignFirstResponder()
        controller.setTypingIndicatorViewHidden(true, animated: true)
        controller.hidesBottomBarWhenPushed = true
        //        getMessages()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        getMessages()
    }
    override func viewDidLayoutSubviews() {
        messagesCollectionView.contentInset.bottom = messageInputBar.frame.height
        messagesCollectionView.scrollIndicatorInsets.bottom = messageInputBar.frame.height//input bar put in********
    }
    //    private func sendMessage(message: String,messageType: String,toId: String,toName: String){
    //        let refChats = database!.child("messages").
    //           let companyChat = refChats.child(UserManager.shared.getCompanyId() ?? "")
    //           let df = DateFormatter()
    //           df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    //
    //           let chatId = companyChat.child(currentUser.senderId).child(toId).childByAutoId()
    //           let messageDic: [String: Any] = ["message_content": message,"from": currentUser.displayName,"from_id": currentUser.senderId ,"to": toName ,"to_id": toId,"type": messageType,"date": df.string(from: Date()),"user_image": userImage ?? "","company_image": UserManager.shared.getUserImage()?.absoluteString ?? ""]
    //           chatId.setValue(messageDic)
    //           checkChat()
    //           let notMessage = messageType == "text" ? message : "Sent photo"
    //           sendNotification(message: notMessage)
    //       }
    
    func getData(){
        let ref =  database?.child("message")
        ref?.observe(.childAdded, with: { (snapshot) in
         
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
    private func checkChat(){
//        let ref = database?.child("message").
//           let refChats = ref!.child("messages_count").child(companyId)
           
//           refChats.getData { error, data in
//               if let SnapData = data.value as? [String: Any] ,  let messageCount = SnapData["count"] as? Int{
//                   if messageCount == 50{
//                       refChats.updateChildValues(["count": 1])
//                       self.sendCoin()
//                   }
//                   else{
//                       refChats.updateChildValues(["count": messageCount + 1])
//                   }
//               }
//               else{
//                   let messageDic: [String: Any] = ["count": 1]
//                   refChats.setValue(messageDic)
//               }
//           }
       }
    private func getMessages(){
        let ref =  database?.child("message").queryLimited(toLast: 200)
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        ref?.observe(.childAdded, with: { [weak self] (DataSnapshot) in
            guard let self = self else { return }
            
            if let item = DataSnapshot.value as? [String: Any] {
                let senderId = item["uid"] as? String
                
                let dateString = item["messageTime"] as? String
                
                let date = df.date(from: dateString ?? "")
                
                let name = item["uname"] as? String
                let messageText = item["message"] as? String
                
                var kind : MessageKind = .text(messageText ?? "")
                
                let message = MessageSender(sentDate: date ?? Date(), sender: Sender(senderId: senderId ?? "", displayName: name ?? ""), messageId: "\(Int.random(in: 0...100))", kind: kind)
              
                self.messages.append(message)
                DispatchQueue.main.async {
                    self.messagesCollectionView.reloadData()
                    self.messagesCollectionView.scrollToLastItem()
                }
            }
        })
    }
    
    func currentSender() -> SenderType {
        
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType{
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        //        let sortedArray = messages.sort(by: { $0.sentDate.compare($1.sentDate) == ComparisonResult.orderedDescending})
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
extension ChattViewController{
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else { return}
        let hour = calendar.component(.hour, from: date)
//        let minutes = calendar.component(.minute, from: date)
//        let seconds = calendar.component(.second, from: date)
        let obj : [String : Any] = [
            "uid":"iOS\(date)\(Int.random(in: 0...100))" as NSString ,
            "uname":"iOS" as NSString,
            "message":"\(text ?? "")" as NSString,
            "messageTime":"\(date)" as NSString
    ]
     
        let ref = database?.child("message")
   
         ref?.child("\(obj["uid"])").setValue(obj)

        print("tapped")
        //        sendMessage(message: text, messageType: "text",toId: "\(userId ?? 0)",toName: userName ?? "")
        inputBar.inputTextView.text = nil
    }
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        if message.sender.senderId == currentUser.senderId{
            return .systemOrange
        }
        return .lightGray
    }
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        if message.sender.senderId == currentUser.senderId{
            avatarView.kf.setImage(with: URL(string: ""), placeholder: UIImage.init(systemName: "person.circle.fill"))
        }
        else{
            avatarView.kf.setImage(with: URL(string: ""), placeholder: UIImage.init(systemName: "person.circle.fill"))
        }
        avatarView.backgroundColor = .clear
        avatarView.tintColor = .systemOrange
    }
    
    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return .white
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
