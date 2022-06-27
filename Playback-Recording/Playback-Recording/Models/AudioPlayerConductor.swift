//
//  AudioPlayerConductor.swift
//  Playback-Recording
//
//  Created by The YooGle on 27/06/22.
//

import AVFoundation

struct AudioPlayerData {
    var volume: Float = 1.0
    var pan: Float = 0.0
    var playbackRate: Float = 1.0
}

class AudioPlayerConductor: ObservableObject {
    
    var player: AVAudioPlayer
    
    init() {
        let url = Bundle.main.url(forResource: "drums", withExtension: "caf")!

        do {
            player = try AVAudioPlayer.init(contentsOf: url)
            
            // preparing the player upon creation minimizes the latency between
            // calling the play method and hearing audio output
            player.prepareToPlay()
            
            // enable controlling playback rate
            player.enableRate = true
            
            // Infinite Loop
            player.numberOfLoops = -1
        } catch let err {
            print("Error creating player: \(err.localizedDescription)")
            fatalError()
        }
        
    }
    
    @Published var data = AudioPlayerData() {
        didSet {
            player.volume = data.volume
            player.pan = data.pan
            player.rate = data.playbackRate
        }
    }
    
}
