// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AVFoundation
import CAudioKit

/// AudioKIt connection point
open class MKNode {
    /// The internal AVAudioEngine AVAudioNode
    open var avAudioNode: AVAudioNode

    /// The internal AVAudioUnit, which is a subclass of AVAudioNode with more capabilities
    open var avAudioUnit: AVAudioUnit? {
        didSet {
            guard let avAudioUnit = avAudioUnit else { return }

            let mirror = Mirror(reflecting: self)

            for child in mirror.children {
                if let param = child.value as? ParameterBase, let label = child.label {
                    // Property wrappers create a variable with an underscore
                    // prepended. Drop the underscore to look up the parameter.
                    let name = String(label.dropFirst())
                    param.projectedValue.associate(with: avAudioUnit,
                                                   identifier: name)
                }
            }
        }
    }

    /// Returns either the avAudioUnit or avAudioNode (prefers the avAudioUnit if it exists)
    open var avAudioUnitOrNode: AVAudioNode {
        return avAudioUnit ?? avAudioNode
    }

    /// Initialize the node from an AVAudioUnit
    /// - Parameter avAudioUnit: AVAudioUnit to initialize with
    public init(avAudioUnit: AVAudioUnit) {
        self.avAudioUnit = avAudioUnit
        self.avAudioNode = avAudioUnit
    }

    /// Initialize the node from an AVAudioNode
    /// - Parameter avAudioNode: AVAudioNode to initialize with
    public init(avAudioNode: AVAudioNode) {
        self.avAudioNode = avAudioNode
    }

    /// Reset the internal state of the unit
    /// Fixes issues such as https://github.com/AudioKit/AudioKit/issues/2046
    public func reset() {
        if let avAudioUnit = self.avAudioUnit {
            AudioUnitReset(avAudioUnit.audioUnit, kAudioUnitScope_Global, 0)
        }
    }

    /// Work-around for an AVAudioEngine bug.
    func initLastRenderTime() {
        // We don't have a valid lastRenderTime until we query it.
        _ = avAudioNode.lastRenderTime
    }
}
