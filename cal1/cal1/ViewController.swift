//
//  ViewController.swift
//  cal1
//
//  Created by 佐藤 圭祐 on 2015/05/04.
//  Copyright (c) 2015年 佐藤 圭祐. All rights reserved.
//  aaaaaaa

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Labelを作成.計算結果
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,9,10))
        
        // 背景をgray色にする.
        myLabel.backgroundColor = UIColor.brownColor()
        
        // 枠を丸くする.
        myLabel.layer.masksToBounds = true
        
        // コーナーの半径.
        myLabel.layer.cornerRadius = 0
        
        // Labelに文字を代入.
        myLabel.text = "0"
        
        // 文字の色を白にする.
        myLabel.textColor = UIColor.whiteColor()
        
        // 文字の影の色をグレーにする.
        myLabel.shadowColor = UIColor.grayColor()
        
        // Textを右寄せにする.
        myLabel.textAlignment = NSTextAlignment.Right
        
        // 配置する座標を設定する.
        myLabel.layer.position = CGPoint(x: 46,y: 46)
        
        // ViewにLabelを追加.
        self.view.addSubview(myLabel)
        
        
        // Labelを作成.1
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,93,94))
        
        // 背景をgray色にする.
        myLabel.backgroundColor = UIColor.brownColor()
        
        // 枠を丸くする.
        myLabel.layer.masksToBounds = true
        
        // コーナーの半径.
        myLabel.layer.cornerRadius = 0
        
        // Labelに文字を代入.
        myLabel.text = "0"
        
        // 文字の色を白にする.
        myLabel.textColor = UIColor.whiteColor()
        
        // 文字の影の色をグレーにする.
        myLabel.shadowColor = UIColor.grayColor()
        
        // Textを右寄せにする.
        myLabel.textAlignment = NSTextAlignment.Right
        
        // 配置する座標を設定する.
        myLabel.layer.position = CGPoint(x: 46,y: 141)
        
        // ViewにLabelを追加.
        self.view.addSubview(myLabel)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

