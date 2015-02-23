//
//  ViewController.swift
//  j
//
//  Created by Taylor LeBlanc on 2/16/15.
//  Copyright (c) 2015 TAYLOR LEBLNAC. All rights reserved.
//

import UIKit

class removeController: UIViewController {
    
    

    @IBOutlet weak var removeSOng: UIButton!
    @IBOutlet weak var SongTOBERemoved: UITextField!
    
     var songArray : [songModelAvacodo] = []
    
    func refreshUI() {
        
        
    }
    
    @IBAction func removeSongTapped(sender: AnyObject){ //ERROR CHECKING IF FIELD IS EMPTY, NOTIFY USER TO ENTER SONG NAME
        
        var i = 0
        
        for x in songArray {
            if SongTOBERemoved.text == x.title{
                songArray.removeAtIndex(i)
            }
            i++
        }
        
        
        
        
        
        SongTOBERemoved.text = ""
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

