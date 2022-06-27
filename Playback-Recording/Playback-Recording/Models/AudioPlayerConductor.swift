//
//  AudioPlayerConductor.swift
//  Playback-Recording
//
//  Created by The YooGle on 27/06/22.
//

import AVFoundation

class AudioPlayerConductor: ObservableObject {
    
    var playing = false
    
    var playbackRate: Float = 1.0 {
        didSet {
            setPlaybackRate(playbackRate)
        }
    }
    
    var players: [AVAudioPlayer]!
    var playerImages = ["guitar", "bass", "drums"]
    
    init() {
        
        let guitarPlayer = playerForFile("guitar")
        let bassPlayer = playerForFile("bass")
        let drumsPlayer = playerForFile("drums")
        
        players = [guitarPlayer, bassPlayer, drumsPlayer]
    }
    
    func playerForFile(_ name: String) -> AVAudioPlayer {
        let url = Bundle.main.url(forResource: name, withExtension: "caf")!
        do {
            
            let player = try AVAudioPlayer(contentsOf: url)
            
            // enable controlling playback rate
            player.enableRate = true
            // Infinite Loop
            player.numberOfLoops = -1
            // preparing the player upon creation minimizes the latency between
            // calling the play method and hearing audio output
            player.prepareToPlay()
            
            return player
            
        } catch let err {
            print("Error creating player: \(err.localizedDescription)")
            fatalError()
        }
    }
    
    func play() {
        if !playing {
            for player in players {
                player.play()
            }
            playing = true
        }
    }
    
    func stop() {
        if playing {
            for player in players {
                player.stop()
            }
            playing = false
        }
    }
    
    func setPlaybackRate(_ rate: Float) {
        for player in players {
            player.rate = rate
        }
    }
    
    func isValidIndex(_ i: Int) -> Bool {
        return i >= 0 && i < players.count
    }
    
    func setVolume(_ volume: Float, playerIndex i: Int) {
        if isValidIndex(i) {
            players[i].volume = volume
        }
    }
    
    func setPan(_ pan: Float, playerIndex i: Int) {
        if isValidIndex(i) {
            players[i].pan = pan
        }
    }
    
}
