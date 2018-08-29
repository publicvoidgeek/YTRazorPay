//
//  ViewController.swift
//  RazorTry
//
//  Created by SanamS on 01/12/17.
//  Copyright © 2017 SanamS. All rights reserved.
//

import UIKit
import Razorpay

class ViewController: UIViewController, RazorpayPaymentCompletionProtocol {
   
    
    
    //Outlets
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var paidLbl: UILabel!
    
    
    var razorpay: Razorpay!
    
    let API_KEY = " "

    override func viewDidLoad() {
        super.viewDidLoad()
        
        razorpay = Razorpay.initWithKey(API_KEY, andDelegate: self)
        
    }

    
    
    
    func onPaymentError(_ code: Int32, description str: String) {
        //Handle all the errors
        errorLbl.isHidden = false
        paidLbl.isHidden = true
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        //Handle all the success work here
        errorLbl.isHidden = true
        paidLbl.isHidden = false
    }
    
    
    @IBAction func payNowBtnPressed(_ sender: Any) {
        showPaymentForm()
        
    }
    
    func showPaymentForm(){
        let params: [String:Any] = [
            "amount" : "10000",
            "description" : "Sample Product",
            "image" : "http://www.anblik.com/wp-content/uploads/2016/04/razorpay-logo.png",
            "name" : "Public Void Geek",
            "prefill" : [
                "contact" : "9797979797",
                "email" : "test@test.com"
            ],
            "theme" : [
                "color" : "#F37254"
            ]
        ]
        razorpay.open(params)
        
    }
    
    

}

