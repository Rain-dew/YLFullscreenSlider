# YLFullscreenSlider Swift
给导航控制器添加一个全屏滑动返回的手势。类似QQ.微博的效果
##如何使用？
###YLFullscreenSlider文件夹拖入你的项目
###需要的导航栏继承YLFullscreenSliderController即可
###你也可以拷贝下面代码到你的控制器实现
##实现代码
  ```Swift
     //1获取系统的pop手势
        guard let systemGes = interactivePopGestureRecognizer else { return }
        //2获取手势添加的view
        guard let gesView = systemGes.view else { return }
        //3.1获取target action
  ```
  target和action不能够直接拿到。因此要使用运行时和KVO
    ```Swift
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
```
在运行时中我们找到了target
[image](http://og3u5glro.bkt.clouddn.com/all.png?imageView2/2/w/308/h/210/interlace/1/q/100)

 ```Swift
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else { return }
        //        print(targetObjc)//打印拿到到的target字典
```
使用KVO取出需要的属性
[image](http://og3u5glro.bkt.clouddn.com/pan.png?imageView2/2/w/308/h/210/interlace/1/q/100)
拿到了pan的key
```Swift
        //3.2取出target
        guard let target = targetObjc.value(forKey: "target") else { return }
 
        //3.3取出target
        let action = Selector(("handleNavigationTransition:"))
```
 添加进去
```Swift
        //4 创建自己的手势pan
        let panGes = UIPanGestureRecognizer()
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
```
##效果
[image](http://og3u5glro.bkt.clouddn.com/push.gif)
