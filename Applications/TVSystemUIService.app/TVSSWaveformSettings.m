@interface TVSSWaveformSettings
+ (TVSSWaveformSettings)ambientSettings;
+ (TVSSWaveformSettings)currentSettings;
- (NSArray)adjustmentCoefficients;
- (NSArray)stops;
- (float)amplitudeGain;
- (float)animationDuration;
- (float)artworkBlur;
- (float)artworkSaturation;
- (float)exponentialGain;
- (float)framerateThreshold;
- (float)frequencyExponent;
- (float)maxArtworkLuminance;
- (float)minArtworkLuminance;
- (float)opacity;
- (float)pausedAnimationDuration;
- (float)pausedSpringDamping;
- (float)samplingRefreshRate;
- (float)springDamping;
- (float)xScaleMultiplier;
- (int)maximumFramerate;
- (int)minimumFramerate;
- (void)setAdjustmentCoefficients:(id)a3;
- (void)setAmplitudeGain:(float)a3;
- (void)setAnimationDuration:(float)a3;
- (void)setArtworkBlur:(float)a3;
- (void)setArtworkSaturation:(float)a3;
- (void)setExponentialGain:(float)a3;
- (void)setFramerateThreshold:(float)a3;
- (void)setFrequencyExponent:(float)a3;
- (void)setMaxArtworkLuminance:(float)a3;
- (void)setMaximumFramerate:(int)a3;
- (void)setMinArtworkLuminance:(float)a3;
- (void)setMinimumFramerate:(int)a3;
- (void)setOpacity:(float)a3;
- (void)setPausedAnimationDuration:(float)a3;
- (void)setPausedSpringDamping:(float)a3;
- (void)setSamplingRefreshRate:(float)a3;
- (void)setSpringDamping:(float)a3;
- (void)setStops:(id)a3;
- (void)setXScaleMultiplier:(float)a3;
@end

@implementation TVSSWaveformSettings

+ (TVSSWaveformSettings)currentSettings
{
  v4 = (dispatch_once_t *)&unk_100221CA0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B8510);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (TVSSWaveformSettings *)(id)qword_100221CA8;
}

+ (TVSSWaveformSettings)ambientSettings
{
  v4 = (dispatch_once_t *)&unk_100221CB0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B8530);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (TVSSWaveformSettings *)(id)qword_100221CB8;
}

- (NSArray)stops
{
  return self->_stops;
}

- (void)setStops:(id)a3
{
}

- (float)amplitudeGain
{
  return self->_amplitudeGain;
}

- (void)setAmplitudeGain:(float)a3
{
  self->_amplitudeGain = a3;
}

- (float)exponentialGain
{
  return self->_exponentialGain;
}

- (void)setExponentialGain:(float)a3
{
  self->_exponentialGain = a3;
}

- (float)frequencyExponent
{
  return self->_frequencyExponent;
}

- (void)setFrequencyExponent:(float)a3
{
  self->_frequencyExponent = a3;
}

- (float)samplingRefreshRate
{
  return self->_samplingRefreshRate;
}

- (void)setSamplingRefreshRate:(float)a3
{
  self->_samplingRefreshRate = a3;
}

- (NSArray)adjustmentCoefficients
{
  return self->_adjustmentCoefficients;
}

- (void)setAdjustmentCoefficients:(id)a3
{
}

- (float)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(float)a3
{
  self->_animationDuration = a3;
}

- (float)springDamping
{
  return self->_springDamping;
}

- (void)setSpringDamping:(float)a3
{
  self->_springDamping = a3;
}

- (float)pausedAnimationDuration
{
  return self->_pausedAnimationDuration;
}

- (void)setPausedAnimationDuration:(float)a3
{
  self->_pausedAnimationDuration = a3;
}

- (float)pausedSpringDamping
{
  return self->_pausedSpringDamping;
}

- (void)setPausedSpringDamping:(float)a3
{
  self->_pausedSpringDamping = a3;
}

- (float)xScaleMultiplier
{
  return self->_xScaleMultiplier;
}

- (void)setXScaleMultiplier:(float)a3
{
  self->_xScaleMultiplier = a3;
}

- (int)maximumFramerate
{
  return self->_maximumFramerate;
}

- (void)setMaximumFramerate:(int)a3
{
  self->_maximumFramerate = a3;
}

- (int)minimumFramerate
{
  return self->_minimumFramerate;
}

- (void)setMinimumFramerate:(int)a3
{
  self->_minimumFramerate = a3;
}

- (float)framerateThreshold
{
  return self->_framerateThreshold;
}

- (void)setFramerateThreshold:(float)a3
{
  self->_framerateThreshold = a3;
}

- (float)artworkBlur
{
  return self->_artworkBlur;
}

- (void)setArtworkBlur:(float)a3
{
  self->_artworkBlur = a3;
}

- (float)artworkSaturation
{
  return self->_artworkSaturation;
}

- (void)setArtworkSaturation:(float)a3
{
  self->_artworkSaturation = a3;
}

- (float)minArtworkLuminance
{
  return self->_minArtworkLuminance;
}

- (void)setMinArtworkLuminance:(float)a3
{
  self->_minArtworkLuminance = a3;
}

- (float)maxArtworkLuminance
{
  return self->_maxArtworkLuminance;
}

- (void)setMaxArtworkLuminance:(float)a3
{
  self->_maxArtworkLuminance = a3;
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (void).cxx_destruct
{
}

@end