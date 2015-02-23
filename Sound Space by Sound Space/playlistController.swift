//
//  ViewController.swift
//  j
//
//  Created by Taylor LeBlanc on 2/16/15.
//  Copyright (c) 2015 TAYLOR LEBLNAC. All rights reserved.
//

import UIKit

class playlistController: UIViewController, UIPickerViewDelegate  {
    
    @IBOutlet weak var PlaylistScroll: UIScrollView!
    @IBOutlet var PlaylistData: UITextView!
    @IBOutlet weak var addPlaylist: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!

    //add playlist popup
    
    let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
    @IBAction func present(sender: AnyObject) {
        var inputTextField: UITextField?
        presentViewController(alertController, animated: true, completion: nil)
        let Add = UIAlertAction(title: "Add", style: .Default, handler: { (action) -> Void in
            var toAdd = playlistModel(name: "\(inputTextField?.text)", list: [])
            self.addPlaylistToModel(toAdd)
            self.refreshUI()
            
            // Do whatever you want with inputTextField?.text
            println("\(inputTextField?.text)")
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
        }
        alertController.addAction(Add)
        alertController.addAction(cancel)
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            inputTextField = textField
        }
    }

    var theSongModel: sharedSongModel = sharedSongModel.theSharedSongModel
    var mySong:songModelAvacodo = songModelAvacodo(title: "", artist: "", album: "", length: "", year: "", composer: "")
        
    //testing picker view. WILL NOT HAVE THESE VALUES
    var songArray : [songModelAvacodo] = []
    var testArray = ["All", "blue", "green", "yellow", "purple", "brown"]
    var playlistArray: [playlistModel] = []

    
    func addPlaylistToModel (playlist: playlistModel){
        playlistArray.append(playlist)
    }
    
    func refreshUI() {
        myPickerView.reloadAllComponents()

    }
    
    @IBAction func test(sender: AnyObject) {
        PlaylistData.text = "NOOO"
        for x in songArray {
            PlaylistData.text.extend(x.title+"\n")
            PlaylistData.text.extend(x.album+"\n")
            PlaylistData.text.extend(x.composer+"\n")
            PlaylistData.text.extend(x.length+"\n") //Work Around : Need to display length of song properly
            PlaylistData.text.extend(String(x.year)+"\n\n")
            
        }

        }
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for x in theSongModel.theArray {
            songArray.append(x)
        }
        var theAll = playlistModel(name:"All", list: songArray)
        playlistArray.append(theAll)
        refreshUI()
        mySong = theSongModel.theSong
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playlistArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return playlistArray[row].name
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        var itemSelected = playlistArray[row]

    }
    
}

