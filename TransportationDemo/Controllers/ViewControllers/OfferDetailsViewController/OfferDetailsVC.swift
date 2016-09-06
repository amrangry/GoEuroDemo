//
//  OfferDetailsVC.swift
//  TransportationDemo
//
//  Created by Amr Elghadban on 9/1/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

import UIKit

class OfferDetailsVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
     // self.hidesBottomBarWhenPushed=true
       // self.tabBarController?.hidesBottomBarWhenPushed=true
      //  self.navigationController?.setNavigationBarHidden(true, animated: true )
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtnPressed(sender: AnyObject) {
        
       self.dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
