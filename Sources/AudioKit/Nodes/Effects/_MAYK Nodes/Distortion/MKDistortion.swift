// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation

/// AudioKit version of Apple's Distortion Audio Unit
///
open class MKDistortion: MKNode, Toggleable {

    fileprivate let effectAU = AVAudioUnitEffect(
    audioComponentDescription:
    AudioComponentDescription(appleEffect: kAudioUnitSubType_Distortion))

    /// Delay (Milliseconds) ranges from 0.1 to 500 (Default: 0.1)
    @Parameter public var delay: AUValue

    /// Decay (Rate) ranges from 0.1 to 50 (Default: 1.0)
    @Parameter public var decay: AUValue

    /// Delay Mix (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter public var delayMix: AUValue

    /// Decimation (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter public var decimation: AUValue

    /// Rounding (Percent) ranges from 0 to 100 (Default: 0)
    @Parameter public var rounding: AUValue

    /// Decimation Mix (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter public var decimationMix: AUValue

    /// Linear Term (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter public var linearTerm: AUValue

    /// Squared Term (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter public var squaredTerm: AUValue

    /// Cubic Term (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter public var cubicTerm: AUValue

    /// Polynomial Mix (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter public var polynomialMix: AUValue

    /// Ring Mod Freq1 (Hertz) ranges from 0.5 to 8000 (Default: 100)
    @Parameter public var ringModFreq1: AUValue

    /// Ring Mod Freq2 (Hertz) ranges from 0.5 to 8000 (Default: 100)
    @Parameter public var ringModFreq2: AUValue

    /// Ring Mod Balance (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter public var ringModBalance: AUValue

    /// Ring Mod Mix (Percent) ranges from 0 to 100 (Default: 0)
    @Parameter public var ringModMix: AUValue

    /// Soft Clip Gain (dB) ranges from -80 to 20 (Default: -6)
    @Parameter public var softClipGain: AUValue

    /// Final Mix (Percent) ranges from 0 to 100 (Default: 50)
    @Parameter public var finalMix: AUValue

    /// Tells whether the node is processing (ie. started, playing, or active)
    public var isStarted = true

    /// Initialize the distortion node
    ///
    /// - parameter input: Input node to process
    /// - parameter delay: Delay (Milliseconds) ranges from 0.1 to 500 (Default: 0.1)
    /// - parameter decay: Decay (Rate) ranges from 0.1 to 50 (Default: 1.0)
    /// - parameter delayMix: Delay Mix (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter decimation: Decimation (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter rounding: Rounding (Percent) ranges from 0 to 100 (Default: 0)
    /// - parameter decimationMix: Decimation Mix (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter linearTerm: Linear Term (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter squaredTerm: Squared Term (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter cubicTerm: Cubic Term (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter polynomialMix: Polynomial Mix (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter ringModFreq1: Ring Mod Freq1 (Hertz) ranges from 0.5 to 8000 (Default: 100)
    /// - parameter ringModFreq2: Ring Mod Freq2 (Hertz) ranges from 0.5 to 8000 (Default: 100)
    /// - parameter ringModBalance: Ring Mod Balance (Percent) ranges from 0 to 100 (Default: 50)
    /// - parameter ringModMix: Ring Mod Mix (Percent) ranges from 0 to 100 (Default: 0)
    /// - parameter softClipGain: Soft Clip Gain (dB) ranges from -80 to 20 (Default: -6)
    /// - parameter finalMix: Final Mix (Percent) ranges from 0 to 100 (Default: 50)
    ///
    public init(
        delay: AUValue = 0.1,
        decay: AUValue = 1.0,
        delayMix: AUValue = 50,
        decimation: AUValue = 50,
        rounding: AUValue = 0,
        decimationMix: AUValue = 50,
        linearTerm: AUValue = 50,
        squaredTerm: AUValue = 50,
        cubicTerm: AUValue = 50,
        polynomialMix: AUValue = 50,
        ringModFreq1: AUValue = 100,
        ringModFreq2: AUValue = 100,
        ringModBalance: AUValue = 50,
        ringModMix: AUValue = 0,
        softClipGain: AUValue = -6,
        finalMix: AUValue = 50) {
        super.init(avAudioNode: effectAU)

        self.$delay.associate(with: effectAU, index: 0)
        self.$decay.associate(with: effectAU, index: 1)
        self.$delayMix.associate(with: effectAU, index: 2)
        self.$ringModFreq1.associate(with: effectAU, index: 3)
        self.$ringModFreq2.associate(with: effectAU, index: 4)
        self.$ringModBalance.associate(with: effectAU, index: 5)
        self.$ringModMix.associate(with: effectAU, index: 6)
        self.$decimation.associate(with: effectAU, index: 7)
        self.$rounding.associate(with: effectAU, index: 8)
        self.$decimationMix.associate(with: effectAU, index: 9)
        self.$linearTerm.associate(with: effectAU, index: 10)
        self.$squaredTerm.associate(with: effectAU, index: 11)
        self.$cubicTerm.associate(with: effectAU, index: 12)
        self.$polynomialMix.associate(with: effectAU, index: 13)
        self.$softClipGain.associate(with: effectAU, index: 14)
        self.$finalMix.associate(with: effectAU, index: 15)

        self.delay = delay
        self.decay = decay
        self.delayMix = delayMix
        self.decimation = decimation
        self.rounding = rounding
        self.decimationMix = decimationMix
        self.linearTerm = linearTerm
        self.squaredTerm = squaredTerm
        self.cubicTerm = cubicTerm
        self.polynomialMix = polynomialMix
        self.ringModFreq1 = ringModFreq1
        self.ringModFreq2 = ringModFreq2
        self.ringModBalance = ringModBalance
        self.ringModMix = ringModMix
        self.softClipGain = softClipGain
        self.finalMix = finalMix
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
