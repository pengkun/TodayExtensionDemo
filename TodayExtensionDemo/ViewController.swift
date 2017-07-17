//
//  ViewController.swift
//  TodayExtensionDemo
//
//  Created by pk on 2017/7/16.
//  Copyright © 2017年 pk. All rights reserved.
//

import UIKit
import TEKit

class ViewController: UIViewController {

    fileprivate lazy var contentView: ContentView = ContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.contentView)
        self.contentView.title = "Hello, world!"
        self.contentView.brief = "简介简介简介简介简介简介简介简介简介简介简介"

        self.contentView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.center.equalTo(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

