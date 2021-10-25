//
//  SideMenuViewController.swift
//  Currency
//
//  Created by John Doe on 2021-10-23.
//

import UIKit
import SideMenu
class SideMenuViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        registerCell()
        menuTableView.backgroundColor = UIColor.clear
        designBar()
        // Do any additional setup after loading the view.
    }
    func designBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .white
    }
    func registerCell(){
        menuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
    }
    
}
extension SideMenuViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath ) as! MenuTableViewCell
        cell.cellFill(index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "DollarViewController") as! DollarViewController
            secondViewController.title = "العملات المحليه"
            self.navigationController?.pushViewController(secondViewController , animated: true)
        case 1:
            let vc = ChattViewController()
            vc.title = "الدردشه"
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            let vc = GasViewController()
            vc.title = "المحروقات"
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = InternationalViewController()
            vc.title = "العملات العالميه"
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 5:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let convertVC = storyboard.instantiateViewController(identifier: "ConverterViewController") as! ConverterViewController
            //            let vc = EmptyViewController()
//            convertVC.title = "محول العملات"
            self.navigationController?.pushViewController(convertVC, animated: true)
        case 4:
            let vc = NewsViewController()
            vc.title = "الاخبار"
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let privacyVc = PrivacyViewController()
            privacyVc.title = "سياسة الخصوصيه"
            self.navigationController?.pushViewController(privacyVc, animated: true)
        }
    }
}

