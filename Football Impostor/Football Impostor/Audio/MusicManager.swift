import AVFoundation
import Combine

class MusicManager: ObservableObject {
    static let shared = MusicManager()
    var audioPlayer: AVAudioPlayer?
    private var timer: Timer?
    
    init() {
        do {
            // Rispetterà il volume multimediale e (opzionalmente) il tasto silenzioso imposto da sistema.
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Errore nella configurazione della sessione audio: \(error)")
        }
    }
    
    @Published var isAudioEnabled: Bool = true {
        didSet {
            if isAudioEnabled {
                playBackgroundMusic()
            } else {
                stopMusicWithFade()
            }
        }
    }

    func playBackgroundMusic() {
        
        timer?.invalidate()

        guard isAudioEnabled else { return }
        
        if let bundlePath = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3") {
            let url = URL(fileURLWithPath: bundlePath)
            do {
                if audioPlayer == nil {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.numberOfLoops = -1
                }
                audioPlayer?.volume = 1.0
                audioPlayer?.play()
            } catch {
                print("Errore audio")
            }
        }
    }
    
    func stopMusicWithFade() {
            guard let player = audioPlayer, player.isPlaying else { return }
            
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
                if player.volume > 0.1 {
                    player.volume -= 0.1
                } else {
                    player.stop()
                    player.volume = 1.0
                    timer.invalidate()
                    self?.timer = nil
                }
            }
        }
}
