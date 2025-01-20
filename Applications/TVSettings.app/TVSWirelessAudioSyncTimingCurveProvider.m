@interface TVSWirelessAudioSyncTimingCurveProvider
- (TVSWirelessAudioSyncTimingCurveProvider)initWithCoder:(id)a3;
- (TVSWirelessAudioSyncTimingCurveProvider)initWithTimingCurveProviderType:(unint64_t)a3;
- (UICubicTimingParameters)cubicTimingParameters;
- (UISpringTimingParameters)springTimingParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)timingCurveType;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TVSWirelessAudioSyncTimingCurveProvider

- (TVSWirelessAudioSyncTimingCurveProvider)initWithTimingCurveProviderType:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSWirelessAudioSyncTimingCurveProvider;
  v4 = -[TVSWirelessAudioSyncTimingCurveProvider init](&v12, "init");
  v5 = v4;
  if (v4)
  {
    -[TVSWirelessAudioSyncTimingCurveProvider setType:](v4, "setType:", a3);
    v5->timingCurveType = 2LL;
    id v6 = -[TVSWirelessAudioSyncTimingCurveProvider type](v5, "type");
    if (v6 == (id)1)
    {
      v7 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
      double v8 = 36.0;
      goto LABEL_6;
    }

    if (!v6)
    {
      v7 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
      double v8 = 1000.0;
LABEL_6:
      v9 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v7,  "initWithMass:stiffness:damping:initialVelocity:",  3.0,  500.0,  v8,  0.0,  0.0);
      springTimingParameters = v5->springTimingParameters;
      v5->springTimingParameters = v9;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[TVSWirelessAudioSyncTimingCurveProvider type](self, "type")));
  [v4 encodeObject:v5 forKey:@"TVSWirelessAudioSyncTimingCurveProviderTypeKey"];
}

- (TVSWirelessAudioSyncTimingCurveProvider)initWithCoder:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 decodeObjectForKey:@"TVSWirelessAudioSyncTimingCurveProviderTypeKey"]);
  id v5 = [v4 integerValue];

  id v6 = -[TVSWirelessAudioSyncTimingCurveProvider initWithTimingCurveProviderType:]( objc_alloc(&OBJC_CLASS___TVSWirelessAudioSyncTimingCurveProvider),  "initWithTimingCurveProviderType:",  v5);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TVSWirelessAudioSyncTimingCurveProvider initWithTimingCurveProviderType:]( objc_alloc(&OBJC_CLASS___TVSWirelessAudioSyncTimingCurveProvider),  "initWithTimingCurveProviderType:",  -[TVSWirelessAudioSyncTimingCurveProvider type](self, "type"));
}

- (int64_t)timingCurveType
{
  return self->timingCurveType;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  return self->cubicTimingParameters;
}

- (UISpringTimingParameters)springTimingParameters
{
  return self->springTimingParameters;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end