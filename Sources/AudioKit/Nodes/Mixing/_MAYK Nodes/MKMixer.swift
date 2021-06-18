// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AVFoundation
import CAudioKit

/// AudioKit version of Apple's Mixer Node. Mixes a variadic list of Nodes.
public class MKMixer: MKNode, Toggleable {
    /// The internal mixer node
    fileprivate var mixerAU = AVAudioMixerNode()

    /// Output Volume (Default 1), values above 1 will have gain applied
    public var volume: AUValue = 1.0 {
        didSet {
            volume = max(volume, 0)
            mixerAU.outputVolume = volume
        }
    }

    /// Output Pan (-1 to 1, Default 0 = center)
    public var pan: AUValue = 0 {
        didSet {
            pan = min(pan, 1)
            pan = max(pan, -1)
            mixerAU.pan = pan
        }
    }

    fileprivate var lastKnownVolume: AUValue = 1.0

    /// Determine if the mixer is serving any output or if it is stopped.
    public var isStarted: Bool {
        return volume != 0.0
    }
    
    // MARK: - Initialization

    /// Initialize this filter node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - fundamentalFrequency: Fundamental frequency of string.
    ///   - feedback: Feedback amount (value between 0-1). A value close to 1 creates a slower decay and a more pronounced resonance. Small values may leave the input signal unaffected. Depending on the filter frequency, typical values are > .9.
    ///
    public init(volume: AUValue = 1.0) {
        super.init(avAudioNode: mixerAU)
        // self.volume = volume
    }

    /// Function to start, play, or activate the node, all do the same thing
    public func start() {
        if isStopped {
            volume = lastKnownVolume
        }
    }

    /// Function to stop or bypass the node, both are equivalent
    public func stop() {
        if isPlaying {
            lastKnownVolume = volume
            volume = 0
        }
    }
}
