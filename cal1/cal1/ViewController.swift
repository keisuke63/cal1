//
//  ViewController.swift
//  cal1
//
//  Created by 佐藤 圭祐 on 2015/05/04.
//  Copyright (c) 2015年 佐藤 圭祐. All rights reserved.
//  aaaaaaa

import UIKit

class ViewController: UIViewController {

    //計算結果を表示するラベルを宣言
    var resultLabel = UILabel()
    
    
    //画面の横サイズを格納するメンバ変数
    let screenWidth:Double = Double(UIScreen.mainScreen().bounds.size.width)
    //画面の縦幅
    let screenHidth:Double = Double(UIScreen.mainScreen().bounds.size.height)
    //ボタン間の余白（縦）＆（横）
    let buttonmargin = 10.0
    //計算結果表示エリアの縦幅
    var resultArea = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //画面全体の縦幅に応じて計算結果表示エリアの縦幅を決定
        switch screenHidth {
        case 480:
            resultArea = 200.0
        case 568:
            resultArea = 250.0
        case 667:
            resultArea = 300.0
        case 736:
            resultArea = 350.0
        default:
            resultArea = 0.0
        }
        
        
        //計算結果ラベルのフレームを設定。横幅は端末の画面サイズから左右の隙間20ポイントを引く
        resultLabel.frame = CGRect(x: 10, y: 30, width: screenWidth-20, height: resultArea - 30)
        //計算結果ラベルの背景色を灰色にする
        resultLabel.backgroundColor = UIColor.grayColor()
//      　計算結果ラベルのフォントと文字サイズを設定
        resultLabel.font = UIFont(name: "LetsgoDigital-Regular", size: 50)
//        計算結果ラベルのアラインメントを右揃えに設定
        resultLabel.textAlignment = NSTextAlignment.Right
        //計算結果ラベルの表示行数を4桁に設定
        resultLabel.numberOfLines = 4
        //計算結果ラベルの初期値を"0"に設定
        resultLabel.text = "0"
        //計算結果ラベルをviewcontrollerクラスのviewに設置
        self.view.addSubview(resultLabel)
        
        //計算機のボタンを作成
        var button = UIButton()
        //ボタンの横幅作成
        var buttonWidth =
            (screenWidth - (buttonmargin*(Duble(xButtonCount)+1)))
         / Double(xButtonCount)
        //ボタンの縦幅サイズ作成
        var buttonHeight = (screenHidth - resultArea - ((buttonmargin*Double(yButtonCount+1))) / Double(yButtonCount)
    
        
        //ボタンのX座標
        var buttonPositionX = buttonmargin
        //ボタンのY座標
        var buttonPositionY = resultArea + buttonmargin
        //ボタンの縦幅サイズの作成
            button.frame = CGRect(x: buttonPositionX, y: buttonPositionY,
                width: buttonWidth, height: buttonHeight)
        //ボタン背景色設定
        
        //ボタン配置
        
        //
        
        
    //画面の横幅のサイズを格納するメンバ変数
//        let screenWidth:Double = Double(UIScreen.mainScreen().bounds.size.width)
        
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

