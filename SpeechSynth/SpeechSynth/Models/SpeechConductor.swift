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
        "Mere paas maa hai.",
        "Pushpa, I hate tears…",
        "Kitne aadmi the!",
        "Rishtey mein toh hum tumhare baap lagte hai, naam hai Shahenshaah!",
        "Babumoshai, zindagi badi honi chahiye, lambi nahi.",
        "Dosti ka ek usool hai madam – no sorry, no thank you.",
        "Kutte kaminey main tera khoon pee jaunga.",
        "Mogambo khush hua!",
        "Hum jahan khade hote hain line yahi se shuru hoti hai.",
        "Bade bade deshon mein aisi choti-choti baatein hoti rehti hai, Senorita.",
        "Haar kar jeetne wale ko baazigar kehte hai.",
        "Mere Karan Arjun aayenge.",
        "Agar maa ka doodh piya hai toh samne aa!",
        "Crime Master Gogo naam hai mera, aankhen nikal ke gotiyan khelta hun main.",
        "Tareekh pe tareekh, tareekh pe tareekh, tareekh pe tareekh milti gayi My Lord, par insaaf nahi mila!",
        "Picture abhi baaki hai mere dost!"
    ]
    
    init() {
        synth = AVSpeechSynthesizer()
        
        voices = [
            AVSpeechSynthesisVoice(language: "en-US")!,
            AVSpeechSynthesisVoice(language: "en-GB")!
        ]
        
        print(AVSpeechSynthesisVoice.speechVoices())
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
    
    func code() {
        let utterance = AVSpeechUtterance(string: "I am a robot.")
        synth.speak(utterance)
    }
}
