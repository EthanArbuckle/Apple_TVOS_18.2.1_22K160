@interface HMDMutableNaturalLightingCurve
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMDMutableNaturalLightingCurve

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDNaturalLightingCurve allocWithZone:](&OBJC_CLASS___HMDNaturalLightingCurve, "allocWithZone:", a3);
  unint64_t v5 = -[HMDNaturalLightingCurve version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints"));
  v7 = -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:]( v4,  "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:",  v5,  v6,  -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"),  -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"),  -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"),  -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"));

  -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:]( v7,  "setColorTemperatureUpdateIntervalInMilliseconds:",  -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds]( self,  "colorTemperatureUpdateIntervalInMilliseconds"));
  -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:]( v7,  "setColorTemperatureNotifyIntervalThresholdInMilliseconds:",  -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds]( self,  "colorTemperatureNotifyIntervalThresholdInMilliseconds"));
  -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:]( v7,  "setColorTemperatureNotifyValueChangeThreshold:",  -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold]( self,  "colorTemperatureNotifyValueChangeThreshold"));
  return v7;
}

@end