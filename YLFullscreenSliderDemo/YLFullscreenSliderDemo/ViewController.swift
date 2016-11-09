//
//  ViewController.swift
//  YLFullscreenSliderDemo
//
//  Created by shuogao on 2016/11/9.
//  Copyright © 2016年 Yulu Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func pushVC(_ sender: Any) {

        self.navigationController?.pushViewController(secondeViewController(), animated: true)
    }


}

