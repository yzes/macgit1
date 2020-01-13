//
//  ViewController.swift
//  TestViewAnimation
//
//  Created by 爸爸的mac on 2020/1/6.
//  Copyright © 2020年 爸爸的mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mFirstView: UIView!
    
    @IBOutlet weak var mSecondView: UIView!
    var mOriginFrame1 : CGRect!
    var mOriginFrame2 : CGRect!
    
    var mFirstSubView : UIView!=UIView(frame: CGRect(x: 5, y: 5, width: 50, height: 50))
    var mOriginFrameSubView: CGRect!
    override func viewDidLoad() {
        super.viewDidLoad()
        mOriginFrame1=self.mFirstView.frame
        mOriginFrame2=self.mSecondView.frame
        
        
        self.mFirstSubView.backgroundColor=UIColor.purple
        self.mFirstView.addSubview(self.mFirstSubView)
        mOriginFrameSubView=self.mFirstSubView.frame
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startBtnClicked(_ sender: Any) {
        //self.basicAnimate()
        //self.optionAnimate()
        //self.beginCommitAnimate()
        self.operateSubview()
    }
    @IBAction func fallBackBtnClicked(_ sender: Any) {
        self.mFirstView.frame = mOriginFrame1
        self.mFirstView.layer.removeAllAnimations()
        
        self.mSecondView.frame=mOriginFrame2
        self.mSecondView.layer.removeAllAnimations()
        
        self.mFirstSubView.frame=mOriginFrameSubView
        self.mFirstSubView.layer.removeAllAnimations()
    }
    
    func basicAnimate(){
        UIView.animate(withDuration: 1) {
            self.mFirstView.frame.origin.x+=100
        }
    }
    
    func optionAnimate(){
        UIView.animate(withDuration: 2.0, delay: 0.0, options: UIView.AnimationOptions(rawValue: UIView.AnimationOptions.curveEaseOut.rawValue | UIView.AnimationOptions.repeat.rawValue), animations: {
            self.mFirstView.frame.origin.x+=100
            UIView.animate(withDuration: 3.0, delay: 0.0, options: UIView.AnimationOptions(rawValue: UIView.AnimationOptions.curveEaseInOut.rawValue |
            UIView.AnimationOptions.overrideInheritedDuration.rawValue), animations: {
                self.mSecondView.frame.origin.x+=100
            }, completion: { (Bool) in
                print("inner animate finished")
            })
        }) { (Bool) in
            print("outter animate finished")
        }
    }
    
//    func beginCommitAnimate(){
//        UIView.beginAnimations("testAnimate", context: nil)
//        UIView.setAnimationDuration(2.0)
//        UIView.setAnimationRepeatAutoreverses(true)
//        UIView.setAnimationRepeatCount(1)
//        UIView.setAnimationDelegate(self)
//        UIView.setAnimationWillStart(#selector(UIViewController.viewDidAppear(_:)))
//        UIView.setAnimationDidStop(#selector(UIViewController.viewDidDisappear(_:)))
//
//        self.mFirstView.backgroundColor=UIColor.green
//
//        UIView.commitAnimations()
//    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        print("Animation Start")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        print("Animation Stop")
//    }
    func operateSubview(){
        UIView.transition(with: self.mFirstView, duration: 2.0, options: UIView.AnimationOptions(rawValue: UIView.AnimationOptions.transitionCurlUp.rawValue |
            UIView.AnimationOptions.allowAnimatedContent.rawValue), animations: {
            self.mFirstSubView.frame.origin.x+=200
        }) { (finish) in
            print("finished")
        }
    }
}

