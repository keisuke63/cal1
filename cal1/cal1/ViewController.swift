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
        
        // Labelを作成.
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        
        // 背景をオレンジ色にする.
        myLabel.backgroundColor = UIColor.orangeColor()
        
        // 枠を丸くする.
        myLabel.layer.masksToBounds = true
        
        // コーナーの半径.
        myLabel.layer.cornerRadius = 20.0
        
        // Labelに文字を代入.
        myLabel.text = "Hello Swift!!"
        
        // 文字の色を白にする.
        myLabel.textColor = UIColor.whiteColor()
        
        // 文字の影の色をグレーにする.
        myLabel.shadowColor = UIColor.grayColor()
        
        // Textを中央寄せにする.
        myLabel.textAlignment = NSTextAlignment.Center
        
        // 配置する座標を設定する.
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        
        // ViewにLabelを追加.
        self.view.addSubview(myLabel)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton()
        
        //表示されるテキスト
        button.setTitle("Tap Me!", forState: .Normal)
        
        //テキストの色
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        //タップした状態のテキスト
        button.setTitle("Tapped!", forState: .Highlighted)
        
        //タップした状態の色
        button.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        
        //サイズ
        button.frame = CGRectMake(0, 0, 300, 50)
        
        //配置場所
        button.layer.position = CGPoint(x: self.view.frame.width/2, y:100)
        
        //背景色
        button.backgroundColor = UIColor(red: 0.7, green: 0.2, blue: 0.2, alpha: 0.2)
        
        //角丸
        button.layer.cornerRadius = 10
        
        //ボーダー幅
        button.layer.borderWidth = 1
        
        //ボタンをタップした時に実行するメソッドを指定
        //button.addTarget(self, action: "tapped:", forControlEvents:.TouchUpInside)
        
        //viewにボタンを追加する
        self.view.addSubview(button)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

