//
//  ContentView.swift
//  TodayExtensionDemo
//
//  Created by pk on 2017/7/16.
//  Copyright © 2017年 pk. All rights reserved.
//

import UIKit
import SnapKit

open class ContentView: UIView {

    fileprivate lazy var titleLabel = UILabel()
    fileprivate lazy var desLabel   = UILabel()

    open var title: String? {
        didSet {
            self.titleLabel.text = title
        }
    }

    open var brief: String? {
        didSet {
            self.desLabel.text = brief
        }
    }
    
    deinit {
        debugPrint("\(type(of:self)) deinit")
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ContentView {
    fileprivate func setup() {
        self.setupViews()
        self.setupConstraints()
    }

    private func setupViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.desLabel)

        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
    }

    private func setupConstraints() {
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.right.equalTo(self).offset(-16)
            make.left.equalTo(16)
        }

        self.desLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(20)
            make.bottom.equalTo(self).offset(-5)
            make.right.equalTo(self).offset(-16)
            make.left.equalTo(16)
        }
    }
    
}
