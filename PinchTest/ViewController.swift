//
//  ViewController.swift
//  PinchTest
//
//  Created by 준수김 on 2022/06/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        myView.isUserInteractionEnabled = true
        
    }
    
    var recognizerScale: CGFloat = 1.0 //이미지 스케일의 크기
    var maxScale: CGFloat = 2.0
    var minScale: CGFloat = 1.0
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet var PinchGestureRecognizer: UIPinchGestureRecognizer!// 두 손가락의 거리
    @IBAction func pinchAction(_ sender: Any) {
        
//        myView.transform = myView.transform.scaledBy(x: PinchGestureRecognizer.scale, y: PinchGestureRecognizer.scale)
//
//        PinchGestureRecognizer.scale = 1.0
        
        print("recognizerScale: \(recognizerScale), PinchGestureRecognizer.scale: \(PinchGestureRecognizer.scale) ")
        
        
        if PinchGestureRecognizer.state == .began || PinchGestureRecognizer.state == .changed{
            if recognizerScale < maxScale && PinchGestureRecognizer.scale > 1.0 {
                myView.transform = myView.transform.scaledBy(x: PinchGestureRecognizer.scale, y: PinchGestureRecognizer.scale)
                recognizerScale *= PinchGestureRecognizer.scale
                PinchGestureRecognizer.scale = 1.0
            }
            
            else if recognizerScale > 0.5 && PinchGestureRecognizer.scale < 1.0 {
                myView.transform = myView.transform.scaledBy(x: PinchGestureRecognizer.scale, y: PinchGestureRecognizer.scale)
                recognizerScale *= PinchGestureRecognizer.scale
                PinchGestureRecognizer.scale = 1.0
                
                
            }
            
            
        }
        else {
            if recognizerScale < minScale  {
                myView.transform = CGAffineTransform.identity
                recognizerScale = 1.0
            }
        }
        
    }
    
    
    

}


