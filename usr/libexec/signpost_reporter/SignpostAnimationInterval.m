@interface SignpostAnimationInterval
- (id)coreAnalyticsPayload;
- (id)signpostType;
@end

@implementation SignpostAnimationInterval

- (id)signpostType
{
  return @"AnimationInterval";
}

- (id)coreAnalyticsPayload
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SignpostAnimationInterval;
  id v3 = -[SignpostAnimationInterval coreAnalyticsPayload](&v9, "coreAnalyticsPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    -[SignpostAnimationInterval glitchTimeRatio](self, "glitchTimeRatio");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v4 setObject:v5 forKeyedSubscript:@"FrameRate"];

    -[SignpostAnimationInterval glitchTimeRatioMsPerS](self, "glitchTimeRatioMsPerS");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v4 setObject:v6 forKeyedSubscript:@"HitchMsPerSec"];

    -[SignpostAnimationInterval nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS]( self,  "nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v4 setObject:v7 forKeyedSubscript:@"NonFirstFrameHitchAdjustedMsPerSec"];
  }

  return v4;
}

@end