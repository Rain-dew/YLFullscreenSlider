//
//  YLFullscreenSliderController.swift
//  YLFullscreenSliderDemo
//
//  Created by shuogao on 2016/11/9.
//  Copyright © 2016年 Yulu Zhang. All rights reserved.
//

import UIKit

class YLFullscreenSliderController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1获取系统的pop手势
        guard let systemGes = interactivePopGestureRecognizer else { return }
        //2获取手势添加的view
        guard let gesView = systemGes.view else { return }
        //3.1获取target action
        //利用运行时机制查看对应属性名称
        /*
         var count : UInt32 = 0
         let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
         for i in 0..<count {
         let ivar = ivars[Int(i)]
         let name = ivar_getName(ivar)
         //打印所有属性
         print(String(cString: name!))
         }
         */
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else { return }
        //        print(targetObjc)//打印拿到到的target字典
        //3.2取出target
        guard let target = targetObjc.value(forKey: "target") else { return }
        //3.3取出target
        let action = Selector(("handleNavigationTransition:"))

        //4 创建自己的手势pan
        let panGes = UIPanGestureRecognizer()
        panGes.delegate = self
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)

    }
}

extension YLFullscreenSliderController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count != 1
    }
}
