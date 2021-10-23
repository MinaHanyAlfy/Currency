//
//  ShareViewController.swift
//  Currency
//
//  Created by Mina Hany on 5/19/21.
//

import UIKit

class ShareViewController: UIViewController {
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    var recivedData = Currency()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setUPBtnUI()
        fetchData(clientRequest: .getDefault())
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var viewToShare: UIView!
    var data : CurrencyModel?{
        didSet{
            DispatchQueue.main.async {
                self.screenShareTableView.reloadData()
            }
        }
    }
    func setUPBtnUI(){
        closeBtn.layer.cornerRadius = 10
        closeBtn.clipsToBounds = true
        shareBtn.layer.cornerRadius = 10
        shareBtn.clipsToBounds = true
    }
    @IBAction func closeActionBtn(_ sender: Any) {

        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var screenShareTableView: UITableView!
    
    @IBAction func shareActionBtn(_ sender: Any) {
//
        let items = ["This Screen from Lebanon doller application",viewToShare.asImage()] as [Any]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        ac.popoverPresentationController?.sourceView = self.view
        self.present(ac, animated: true, completion: nil)
       // let text = "This screen for Application Lebanon Dollar"
            //let image = UIImage(named: "")
            //let myWebsite = NSURL(string:"")
            //let shareAll= [text , image! , myWebsite]
//////////            let activityViewController = UIActivityViewController(activityItems: text, applicationActivities: nil)
//////            activityViewController.popoverPresentationController?.sourceView = self.view
////////            self.present(activityViewController, animated: true, completion: nil)
        
  
    }
    
    // MARK: - Register Cells
    
    private func registerCells(){
        screenShareTableView.register(UINib(nibName: "DateTableViewCell", bundle: nil), forCellReuseIdentifier: "DateTableViewCell")
        screenShareTableView.register(UINib(nibName: "CurrencyTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrencyTableViewCell")
        screenShareTableView.register(UINib(nibName: "ExchangerTableViewCell", bundle: nil), forCellReuseIdentifier: "ExchangerTableViewCell")
        
        
    }
    //MARK :- FetchData
    private func fetchData(clientRequest: Curriencies){
        NetworkLayer.shared.getResults(clientRequest: clientRequest, decodingModel: CurrencyModel.self) { [weak self] (response) in
            switch response{
            case .success(let data):
                self?.data = data
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
//MARK:- TableViewDelegate , TableViewDataSource ,

extension ShareViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(screenShareTableView.frame.height / 3 )
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = screenShareTableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath) as! DateTableViewCell

            return cell
        case 1:
            let cellCurrency = screenShareTableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as! CurrencyTableViewCell
            return cellCurrency
        default:
            let cellExchanger = screenShareTableView.dequeueReusableCell(withIdentifier: "ExchangerTableViewCell", for: indexPath) as! ExchangerTableViewCell
            return cellExchanger
        }
    }
    
}
extension UIView {

    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
