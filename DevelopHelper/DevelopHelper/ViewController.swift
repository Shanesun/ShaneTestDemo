//
//  ViewController.swift
//  DevelopHelper
//
//  Created by Shane on 16/8/2.
//  Copyright © 2016年 Shane. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var fileManager = NSFileManager.defaultManager();

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func replaceImage(originImagePath:NSURL, toImagePath:NSURL){
        let originName = originImagePath.pathExtension
        let toImageName = toImagePath.pathExtension
        
        
        if originName == toImageName {
    
            do {
                try fileManager.moveItemAtURL(originImagePath,toURL: toImagePath)
            }catch{ }
            
            
            
        }
    }

}

