//
//  sharedSongModel.swift
//  singleton
//
//  Created by John Barr on 2/18/15.
//  Copyright (c) 2015 John Barr. All rights reserved.
//

import Foundation

private let _songModelSharedInstance = sharedSongModel()

class sharedSongModel {
    
    let theSong: songModelAvacodo
    var theArray: [songModelAvacodo]
    
    
    init(){
        theSong = songModelAvacodo(title: "a", artist: "a", album: "a", length: "a", year: "a", composer: "a")
        theArray = []
    }
    
    class var theSharedSongModel: sharedSongModel {
        return _songModelSharedInstance
    }
}