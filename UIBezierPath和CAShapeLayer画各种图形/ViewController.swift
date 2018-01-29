//
//  ViewController.swift
//  UIBezierPath和CAShapeLayer画各种图形
//
//  Created by Dxc_iOS on 2018/1/29.
//  Copyright © 2018年 代星创. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//UIBezierPath和CAShapeLayer画各种图形，比如很多APP首页、个人中心轮播图的下面那一段弧线
       demo1()
       demo2()
       demo3()
        demo4()
        demo5()
        demo6()
    }
    func  demo1(){
        //  CAShapeLayer 是 CALayer 的子类，但是比 CALayer 更灵活，可以画出各种图形
        let layer = CAShapeLayer()
        layer.frame = CGRect.init(x: 30, y: 100, width: 100, height: 100)
        layer.backgroundColor = UIColor.black.cgColor
        
        view.layer.addSublayer(layer)
        
    }
     func  demo2(){
//        UIBezierPath 用贝塞尔曲线的方式来构建一段弧线，你可以用任意条弧线来组成你想要的形状
//   比如，你想用它来和上面一样画一个矩形，那就可以这样子来做：
        let path = UIBezierPath(rect: CGRect.init(x: 150, y: 100, width: 100, height: 100))
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor// Layer 的填充色
        layer.strokeColor = UIColor.red.cgColor//边框色
        view.layer.addSublayer(layer)
    }
    func  demo3(){
//你可以画一个带圆角的图形
        let path = UIBezierPath(roundedRect: CGRect.init(x: 30, y: 250, width: 150, height: 100), cornerRadius: 50)
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.black.cgColor
        view.layer.addSublayer(layer)
        
    
        
    }
    func  demo4(){
        //你可以画一个带圆角的图形  指定起始角和半径画圆
        let radius: CGFloat = 60.0
        let startAngle: CGFloat = 0.0//起始角
        let endAngle: CGFloat = CGFloat(Double.pi / 2)//结束角
        let path = UIBezierPath(arcCenter: view.center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.black.cgColor
        view.layer.addSublayer(layer)
       
        
        
    }
    func  demo5(){
        //      画曲线: 贝塞尔曲线的画法是由起点、终点、控制点三个参数来画的
//        (50, 300)
//       定义了 三个红色小矩形，为了清楚显示它们的位置
        let startPoint = CGPoint.init(x: 50, y: 500)
        let endPoint = CGPoint.init(x: 300, y: 500)
        
        let controlPoint = CGPoint.init(x: 170, y: 400)
        
        let layer1 = CALayer()

        layer1.frame = CGRect.init(x: startPoint.x, y: startPoint.y, width: 5, height: 5)
        layer1.backgroundColor = UIColor.red.cgColor
        
        let layer2 = CALayer()

        layer2.frame = CGRect.init(x: endPoint.x, y: endPoint.y, width: 5, height: 5)
        layer2.backgroundColor = UIColor.red.cgColor
        
        let layer3 = CALayer()

        layer3.frame = CGRect.init(x: controlPoint.x, y: controlPoint.y, width: 5, height: 5)
        layer3.backgroundColor = UIColor.red.cgColor
//
        
        let path = UIBezierPath()
        let layer = CAShapeLayer()
        
        path.move(to: startPoint)//移动到起始点
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)//告诉它结束点和控制点
        
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.black.cgColor
        
        view.layer.addSublayer(layer)
        view.layer.addSublayer(layer1)
        view.layer.addSublayer(layer2)
        view.layer.addSublayer(layer3)
        
     
    }
    func  demo6(){
//        淘宝首页轮播图下面的 弧线
//       思路大概是这样，先移动到左上方的位置，然后向下划线，然后往右划线，然后往上划线，还剩一个盖子，这个盖子就用一个控制点控制曲率
        let finalSize = CGSize.init(width:  self.view.bounds.width, height: 700)
        let layerHeight = finalSize.height * 0.2
        let layer = CAShapeLayer()
        let bezier = UIBezierPath()

        bezier.move(to: CGPoint.init(x: 0, y: finalSize.height - layerHeight))

        bezier.addLine(to: CGPoint.init(x: 0, y: finalSize.height - 1))

        bezier.addLine(to: CGPoint.init(x: finalSize.width, y: finalSize.height - 1))

        bezier.addLine(to: CGPoint.init(x: finalSize.width, y: finalSize.height - layerHeight))

        bezier.addQuadCurve(to: CGPoint.init(x: 0, y: finalSize.height - layerHeight),
                                   controlPoint: CGPoint.init(x: finalSize.width / 2,y: (finalSize.height - layerHeight) - 40))

        layer.path = bezier.cgPath
        layer.fillColor = UIColor.black.cgColor
        view.layer.addSublayer(layer)
        
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

