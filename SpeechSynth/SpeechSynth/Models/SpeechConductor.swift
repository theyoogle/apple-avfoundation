//
//  SpeechConductor.swift
//  SpeechSynth
//
//  Created by The YooGle on 27/06/22.
//

import AVFoundation

class SpeechConductor: ObservableObject {
    
    private var synth: AVSpeechSynthesizer
    private var voices: [AVSpeechSynthesisVoice]
    
    private let speechStrings = [
        "Hey Harry, how have you been? Long time no see!",
        "Hey! What a surprise! Yes, you are right, we haven’t seen each other in a long time. How have you been?",
        "There is an important campaign next week which is keeping me busy otherwise rest is going good in my life. How about you?",
        "Oh! I just finished a meeting with a very important client of mine and now I finally have some free time. I feel relieved that I’m done with it.",
        "Good for you then. Hey! Let’s make a plan and catch up with each other after next week. What do you say?",
        "Sure, why not? Give me a call when you are done with your project.",
        "Sure, then. Bye, take care.",
        "Bye buddy."
    ]
    
    init() {
        synth = AVSpeechSynthesizer()
        voices = [
            AVSpeechSynthesisVoice(language: "en-US")!,
            AVSpeechSynthesisVoice(language: "en-GB")!
        ]
        // print(AVSpeechSynthesisVoice.speechVoices())
    }
    
    func beginConversation() {
        for i in 0..<speechStrings.count {
            let utterence = AVSpeechUtterance(string: speechStrings[i])
            utterence.voice = voices[i % 2]
            utterence.rate = 0.5
            utterence.pitchMultiplier = 1.5
            utterence.postUtteranceDelay = 0.1
            synth.speak(utterence)
        }
    }
    
}
