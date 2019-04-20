//
//  liveViewController.swift
//  running_casino
//
//  Created by Takuya Kudo on 2019/04/20.
//  Copyright © 2019 Takuya Kudo. All rights reserved.
//

import UIKit

class liveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        drawRectMine(y: 340,w: 60)
        drawRectMine(y: 400,w: 30)
        drawRectMine(y: 460,w: 40)
        drawRectMine(y: 520,w: 70)
        drawRectMine(y: 580,w: 20)
        
        drawRectOther(y: 340,w: 30)
        drawRectOther(y: 400,w: 70)
        drawRectOther(y: 460,w: 80)
        drawRectOther(y: 520,w: 0)
        drawRectOther(y: 580,w: 50)

    }
    
    func drawRectMine(y: Int,w: Int){
        /* --- 四角形を描画 --- */
        let rectangleLayer = CAShapeLayer.init()
        let rectangleFrame = CGRect.init(x: 67, y: y, width: w, height: 20)
        rectangleLayer.frame = rectangleFrame
        
        // 四角形の中の色
        rectangleLayer.fillColor = UIColor(red: 30/255, green: 30/255, blue: 200/255, alpha: 1).cgColor
        
        // 四角形を描画
        rectangleLayer.path = UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: rectangleFrame.size.width, height: rectangleFrame.size.height)).cgPath
        
        self.view.layer.addSublayer(rectangleLayer)
        
    }

    
    func drawRectOther(y: Int,w: Int){
        /* --- 四角形を描画 --- */
        let rectangleLayer = CAShapeLayer.init()
        let rectangleFrame = CGRect.init(x: 259, y: y, width: w, height: 20)
        rectangleLayer.frame = rectangleFrame
        
        // 四角形の中の色
        rectangleLayer.fillColor = UIColor(red: 100/255, green: 100/255, blue: 255/255, alpha: 1).cgColor
        
        // 四角形を描画
        rectangleLayer.path = UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: rectangleFrame.size.width, height: rectangleFrame.size.height)).cgPath
        
        self.view.layer.addSublayer(rectangleLayer)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}