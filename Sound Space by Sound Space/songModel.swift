//
//  SoundSPaceModel.swift
//  Sound Space by Sound Space
//
//  Created by Taylor LeBlanc on 2/4/15.
//  Copyright (c) 2015 Sound Space. All rights reserved.
//

import Foundation



class songModel {
    
    var title: String
    var artist: String
    var year: Int
    var length: Float
    var composer: String
    var album: String
    
    
    init(title:String, artist:String, year: Int,length:Float,composer:String,album:String){
        self.title = title
        self.artist = artist
        self.year = year
        self.length = length
        self.composer = composer
        self.album = album
        }
}
