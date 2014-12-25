//
//  AKLinearControlEnvelope.m
//  AudioKit
//
//  Auto-generated on 12/24/14.
//  Copyright (c) 2014 Aurelius Prochazka. All rights reserved.
//
//  Implementation of Csound's linen:
//  http://www.csounds.com/manual/html/linen.html
//

#import "AKLinearControlEnvelope.h"
#import "AKManager.h"

@implementation AKLinearControlEnvelope

- (instancetype)initWithRiseTime:(AKConstant *)riseTime
                       decayTime:(AKConstant *)decayTime
                   totalDuration:(AKConstant *)totalDuration
                       amplitude:(AKParameter *)amplitude
{
    self = [super initWithString:[self operationName]];
    if (self) {
        _riseTime = riseTime;
        _decayTime = decayTime;
        _totalDuration = totalDuration;
        _amplitude = amplitude;
    }
    return self;
}

- (instancetype)init
{
    self = [super initWithString:[self operationName]];
    if (self) {
        // Default Values
        _riseTime = akp(0.33);    
        _decayTime = akp(0.33);    
        _totalDuration = akp(1);    
        _amplitude = akp(1);    
    }
    return self;
}

+ (instancetype)control
{
    return [[AKLinearControlEnvelope alloc] init];
}

- (void)setOptionalRiseTime:(AKConstant *)riseTime {
    _riseTime = riseTime;
}
- (void)setOptionalDecayTime:(AKConstant *)decayTime {
    _decayTime = decayTime;
}
- (void)setOptionalTotalDuration:(AKConstant *)totalDuration {
    _totalDuration = totalDuration;
}
- (void)setOptionalAmplitude:(AKParameter *)amplitude {
    _amplitude = amplitude;
}

- (NSString *)stringForCSD {
    return [NSString stringWithFormat:
            @"%@ linen AKControl(%@), %@, %@, %@",
            self,
            _amplitude,
            _riseTime,
            _totalDuration,
            _decayTime];
}

@end
