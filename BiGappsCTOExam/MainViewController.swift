//
//  MainViewController.swift
//  BiGappsCTOExam
//
//  Created by user on 23/09/2016.
//  Copyright © 2016 RegolioLS. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, BWWalkthroughViewControllerDelegate {

    var needWalkthrough:Bool = true
    var walkthrough:BWWalkthroughViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if needWalkthrough {
            self.presentWalkthrough()
        }
    }

    @IBAction func presentWalkthrough(){
        
        let stb = UIStoryboard(name: "Main", bundle: nil)
        walkthrough = stb.instantiateViewControllerWithIdentifier("container") as! BWWalkthroughViewController
        let page_one = stb.instantiateViewControllerWithIdentifier("page_1")
        let page_two = stb.instantiateViewControllerWithIdentifier("page_2")
        let page_three = stb.instantiateViewControllerWithIdentifier("page_3")
        let page_four = stb.instantiateViewControllerWithIdentifier("page_4")
        
        // Attach the pages to the master
        walkthrough.delegate = self
        walkthrough.addViewController(page_one)
        walkthrough.addViewController(page_two)
        walkthrough.addViewController(page_three)
        walkthrough.addViewController(page_four)
    
        
        self.presentViewController(walkthrough, animated: true) {
            ()->() in
            self.needWalkthrough = false
        }
    }
}


extension MainViewController{
    
    func walkthroughCloseButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func walkthroughPageDidChange(pageNumber: Int) {
            self.walkthrough.closeButton?.hidden = false
    }
    
}