//
//  OrderPlacedViewController.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 14/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import UIKit

class OrderPlacedViewController: UIViewController {

    @IBOutlet weak var continueShoppingButton: UIButton!
    
    @IBOutlet weak var loadingView: UIView!
    
    @IBOutlet weak var indicatorview: UIActivityIndicatorView!
    
    @IBOutlet weak var loadingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    func setUpUI(){
        self.continueShoppingButton.layer.cornerRadius = self.continueShoppingButton.frame.height/2
        self.loadingView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            self.loadingView.isHidden = true
        }
    }
    
    @IBAction func continueShoppingAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
