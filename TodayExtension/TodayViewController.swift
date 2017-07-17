//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by pk on 2017/7/16.
//  Copyright © 2017年 pk. All rights reserved.
//

import UIKit
import NotificationCenter
import TEKit

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var contentView: ContentView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentView.title = "Hello, world!"
        self.contentView.brief = "简介简介简介简介简介简介简介简介简介简介简介"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
