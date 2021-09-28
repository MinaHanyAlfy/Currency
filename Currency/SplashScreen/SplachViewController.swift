//
//  SplachViewController.swift
//  Currency
//
//  Created by John Doe on 2021-09-26.
//

import UIKit
import SwiftyGif
@available(iOS 13.0, *)
class SplachViewController: UIViewController,SwiftyGifDelegate {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let gif = try UIImage(gifName: "dollar.gif")
            let imageview = UIImageView(gifImage: gif, loopCount: 2) // Will loop 3 times
            imageview.frame = gifImageView.frame
            view.addSubview(imageview)
            gifImageView = imageview
            self.gifImageView.delegate = self
        } catch {
            print(error)
        }
        // Do any additional setup after loading the view.
    }
    func gifURLDidFinish(sender: UIImageView) {
        print("gifURLDidFinish")
    }
    
    func gifURLDidFail(sender: UIImageView) {
        print("gifURLDidFail")
    }
    
    func gifDidStart(sender: UIImageView) {
        print("gifDidStart")
    }
    
    func gifDidLoop(sender: UIImageView) {
        print("gifDidLoop")
    }
    
    func gifDidStop(sender: UIImageView) {
        print("gifDidStop")
//        let vc =   self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
////        self.navigationController?.pushViewController(vc, animated: true)
//                self.present(vc, animated: false, completion: nil)
//        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let secondVC = storyboard.instantiateViewController(identifier: "NavigationControllerID")
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
//               show(secondVC, sender: self)
    }
    
}




