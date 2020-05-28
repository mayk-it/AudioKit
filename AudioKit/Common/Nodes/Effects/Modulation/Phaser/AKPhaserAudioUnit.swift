// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AVFoundation

public class AKPhaserAudioUnit: AKAudioUnitBase {

    let notchMinimumFrequency = AUParameter(
        identifier: "notchMinimumFrequency",
        name: "Notch Minimum Frequency",
        address: AKPhaserParameter.notchMinimumFrequency.rawValue,
        range: AKPhaser.notchMinimumFrequencyRange,
        unit: .hertz,
        flags: .default)

    let notchMaximumFrequency = AUParameter(
        identifier: "notchMaximumFrequency",
        name: "Notch Maximum Frequency",
        address: AKPhaserParameter.notchMaximumFrequency.rawValue,
        range: AKPhaser.notchMaximumFrequencyRange,
        unit: .hertz,
        flags: .default)

    let notchWidth = AUParameter(
        identifier: "notchWidth",
        name: "Between 10 and 5000",
        address: AKPhaserParameter.notchWidth.rawValue,
        range: AKPhaser.notchWidthRange,
        unit: .hertz,
        flags: .default)

    let notchFrequency = AUParameter(
        identifier: "notchFrequency",
        name: "Between 1.1 and 4",
        address: AKPhaserParameter.notchFrequency.rawValue,
        range: AKPhaser.notchFrequencyRange,
        unit: .hertz,
        flags: .default)

    let vibratoMode = AUParameter(
        identifier: "vibratoMode",
        name: "Direct or Vibrato (default)",
        address: AKPhaserParameter.vibratoMode.rawValue,
        range: AKPhaser.vibratoModeRange,
        unit: .generic,
        flags: .default)

    let depth = AUParameter(
        identifier: "depth",
        name: "Between 0 and 1",
        address: AKPhaserParameter.depth.rawValue,
        range: AKPhaser.depthRange,
        unit: .generic,
        flags: .default)

    let feedback = AUParameter(
        identifier: "feedback",
        name: "Between 0 and 1",
        address: AKPhaserParameter.feedback.rawValue,
        range: AKPhaser.feedbackRange,
        unit: .generic,
        flags: .default)

    let inverted = AUParameter(
        identifier: "inverted",
        name: "1 or 0",
        address: AKPhaserParameter.inverted.rawValue,
        range: AKPhaser.invertedRange,
        unit: .generic,
        flags: .default)

    let lfoBPM = AUParameter(
        identifier: "lfoBPM",
        name: "Between 24 and 360",
        address: AKPhaserParameter.lfoBPM.rawValue,
        range: AKPhaser.lfoBPMRange,
        unit: .generic,
        flags: .default)

    public override func createDSP() -> AKDSPRef {
        return createPhaserDSP()
    }

    public override init(componentDescription: AudioComponentDescription,
                  options: AudioComponentInstantiationOptions = []) throws {
        try super.init(componentDescription: componentDescription, options: options)

        parameterTree = AUParameterTree.createTree(withChildren: [notchMinimumFrequency, notchMaximumFrequency, notchWidth, notchFrequency, vibratoMode, depth, feedback, inverted, lfoBPM])
    }
}
