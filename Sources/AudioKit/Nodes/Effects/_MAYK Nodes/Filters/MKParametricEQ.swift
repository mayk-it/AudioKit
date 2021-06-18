// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation

/// AudioKit version of Apple's ParametricEQ Audio Unit
///
open class MKParametricEQ: Node, Toggleable {

    fileprivate let effectAU = AVAudioUnitEffect(audioComponentDescription: AudioComponentDescription(appleEffect: kAudioUnitSubType_ParametricEQ))

    /// Center Freq (Hz) ranges from 20 to 22050 (Default: 2000)
    @Parameter public var centerFreq: AUValue

    /// Q (Hz) ranges from 0.1 to 20 (Default: 1.0)
    @Parameter public var q: AUValue

    /// Gain (dB) ranges from -20 to 20 (Default: 0)
    @Parameter public var gain: AUValue

    /// Tells whether the node is processing (ie. started, playing, or active)
    public var isStarted = true

    /// Initialize the parametric eq node
    ///
    /// - parameter input: Input node to process
    /// - parameter centerFreq: Center Freq (Hz) ranges from 20 to 22050 (Default: 2000)
    /// - parameter q: Q (Hz) ranges from 0.1 to 20 (Default: 1.0)
    /// - parameter gain: Gain (dB) ranges from -20 to 20 (Default: 0)
    ///
    public init(
        centerFreq: AUValue = 2000,
        q: AUValue = 1.0,
        gain: AUValue = 0) {
        super.init(avAudioNode: effectAU)

        self.$centerFreq.associate(with: effectAU, index: 0)
        self.$q.associate(with: effectAU, index: 1)
        self.$gain.associate(with: effectAU, index: 2)

        self.centerFreq = centerFreq
        self.q = q
        self.gain = gain
    }

    /// Function to start, play, or activate the node, all do the same thing
    public func start() {
        effectAU.bypass = false
        isStarted = true
    }

    /// Function to stop or bypass the node, both are equivalent
    public func stop() {
        effectAU.bypass = true
        isStarted = false
    }
}
