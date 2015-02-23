//
//  ViewController.swift
//  Sound Space by Sound Space
//
//  Created by lab on 2/4/15.
//  Copyright (c) 2015 Sound Space. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    

    @IBOutlet weak var songNameField : UITextField!
    @IBOutlet weak var artistField : UITextField!
    @IBOutlet weak var albumField : UITextField!
    @IBOutlet weak var composerField : UITextField!
    @IBOutlet weak var lengthSlider : UISlider!
    @IBOutlet weak var lengthLabel : UILabel!
    @IBOutlet weak var yearStepper : UIStepper!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var artistView : UITextView!
    @IBOutlet weak var songView : UITextView!
    @IBOutlet weak var removeSong : UITextField!
    @IBOutlet weak var findSongBy : UITextField!
    
    var songArray : [songModelAvacodo] = []
    
    var theSongModel: sharedSongModel = sharedSongModel.theSharedSongModel
    var mySong:songModelAvacodo = songModelAvacodo(title: "", artist: "", album: "", length: "", year: "", composer: "")
    
    //var mySong:songModelAvacodo = songModelAvacodo()
    
    func refreshUI() {
        songNameField.text = ""
        artistField.text = ""
        albumField.text = ""
        composerField.text = ""
        artistView.text = ""
        songView.text = ""
        for x in songArray {
            artistView.text.extend(x.artist+"\n\n\n\n\n\n")
            songView.text.extend(x.title+"\n")
            songView.text.extend(x.album+"\n")
            songView.text.extend(x.composer+"\n")
            songView.text.extend(x.length+"\n") //Work Around : Need to display length of song properly
            songView.text.extend(String(x.year)+"\n\n")
            
        }
        theSongModel.theArray = songArray
    }
    
    
    @IBAction func REMOVE(sender: AnyObject) {
    }
    
    @IBAction func removeSongTapped(sender: AnyObject){
    }
    
    @IBAction func StepperValueChanged(sender: UIStepper) {
        yearLabel.text = Int(sender.value).description
        
    }
    
    @IBAction func sliderValueChange(sender: UISlider) {
        var currentValue = Int(sender.value)
        let (h,m,s) = secondsToHoursMinutesSeconds(currentValue)
        
        lengthLabel.text = "Len \(m):" + String(format: "%02d", s)
        
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    
    }
    
    @IBAction func findSongByArtist(sender: AnyObject){ //ERROR CHECKING: CHECK IF FORM IS BLANK, IF IT IS, NOTIFY USER TO PUT IN ARTIST NAME
        var artistSongs : [songModelAvacodo] = []
        for x in songArray{
            if x.artist == findSongBy.text{
                artistSongs.append(x)
            }
        }
        refreshUI()
        findSongBy.text = ""
    }
    
    @IBAction func sortSongs(sender: AnyObject) {
        songArray = songArray.sorted{$0.title < $1.title} //Sort list alphabetically
        songNameField.text = ""
        artistField.text = ""
        albumField.text = ""
        composerField.text = ""
        artistView.text = ""
        songView.text = ""
        for x in songArray {
            artistView.text.extend(x.artist+"\n\n\n\n\n\n")
            songView.text.extend(x.title+"\n")
            songView.text.extend(x.album+"\n")
            songView.text.extend(x.composer+"\n")
            songView.text.extend(x.length+"\n") //Work Around : Need to display length of song properly
            songView.text.extend(String(x.year)+"\n\n")
            
        }
    }
   /*
    @IBAction func removeSongTapped(sender: AnyObject){ //ERROR CHECKING IF FIELD IS EMPTY, NOTIFY USER TO ENTER SONG NAME
        
        var i = 0
        
        for x in songArray {
            if removeSong.text == x.title{
                songArray.removeAtIndex(i)
            }
            i++
        }
        refreshUI()
        removeSong.text = ""
    
    
    }
*/
    @IBAction func addSongTapped(sender: AnyObject){ //ERROR HANDLING, IF THEY TRY TO ADD WITHOUT INFORMATION, NOTIFY THEM TO FILL ALL FIELDS
            let (h,m,s) = secondsToHoursMinutesSeconds(Int(lengthSlider.value))
        
            var songResults = "\(songNameField.text) \(albumField.text) \(composerField.text) Len \(m):\(s) \(Int(yearStepper.value))"
            
            var artistResult = "\(artistField.text)"
            
            if !songNameField.text.isEmpty & !artistField.text.isEmpty & !albumField.text.isEmpty & !composerField.text.isEmpty {
                
                var thisSong = songModelAvacodo(title: songNameField.text, artist: artistField.text, album: albumField.text, length: "\(lengthSlider.value)", year: "\(yearStepper.value)", composer: composerField.text)
                songArray.append(thisSong)
            }
            else {
                //Call error function
                print("Thats not working")
            }
            refreshUI()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySong = theSongModel.theSong
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        artistView.text = mySong.title
        
    }


}



