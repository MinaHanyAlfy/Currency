//
//  ChartViewController.swift
//  Currency
//
//  Created by Petra Software on 28/09/2021.
//

import UIKit
//import Charts
import Alamofire
import Reachability
class ChartViewController: UIViewController {
    @IBOutlet weak var noChartLabel: UILabel!
//    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet var mainView: UIView!
    //link api https://win1withus.com/del/api/historythree-2-month
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func setUpChartOffline(){
    
        let net = NetworkReachabilityManager()
        
        if net?.isReachable == false {
            mainView.isHidden = true
            noChartLabel.isHidden = false
        }else{
            mainView.isHidden = false
            noChartLabel.isHidden = true
        }
        
        
    }
}
