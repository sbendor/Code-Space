//
//  sharedPlaylistModel.swift
//  Sound Space by Sound Space
//
//  Created by lab on 2/22/15.
//  Copyright (c) 2015 Sound Space. All rights reserved.
//

import Foundation

private let _playlistModelSharedInstance = sharedPlaylistModel()

class sharedPlaylistModel {
    
    let theAllPlaylist: [songModelAvacodo]
    
    init(){
        theAllPlaylist = playlistModel.listAllSongs(self)
    }
    
    class var theSharedSongModel: sharedSongModel {
        return _songModelSharedInstance
    }
}