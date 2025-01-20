@interface NIVisionInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)majorRelocalization;
- (BOOL)minorRelocalization;
- (NIVisionInput)initWithCoder:(id)a3;
- (NIVisionInput)initWithTimestamp:(__n128)a3 devicePose:(__n128)a4 trackingState:(__n128)a5 lightEstimate:(__n128)a6 majorRelocalization:(double)a7 minorRelocalization:(uint64_t)a8;
- (double)devicePose;
- (double)lightEstimate;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)trackingState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)overrideTimestamp:(double)a3;
@end

@implementation NIVisionInput

- (NIVisionInput)initWithTimestamp:(__n128)a3 devicePose:(__n128)a4 trackingState:(__n128)a5 lightEstimate:(__n128)a6 majorRelocalization:(double)a7 minorRelocalization:(uint64_t)a8
{
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_CLASS___NIVisionInput;
  v16 = -[NIVisionInput init](&v24, "init");
  v17 = v16;
  if (v16)
  {
    v16->_timestamp = a2;
    *(__n128 *)&v16[1].super.isa = a3;
    *(__n128 *)&v16[1]._timestamp = a4;
    *(__n128 *)&v16[1]._lightEstimate = a5;
    *(__n128 *)&v16[2].super.isa = a6;
    v16->_trackingState = a9;
    v16->_lightEstimate = a7;
    v16->_majorRelocalization = a10;
    v16->_minorRelocalization = a11;
    v18 = v16;
  }

  return v17;
}

- (void)overrideTimestamp:(double)a3
{
  self->_timestamp = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _objc_msgSend( v4,  "initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:",  self->_trackingState,  self->_majorRelocalization,  self->_minorRelocalization,  self->_timestamp,  *(double *)&self[1].super.isa,  self[1]._timestamp,  self[1]._lightEstimate,  *(double *)&self[2].super.isa,  self->_lightEstimate);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"timestamp" forKey:self->_timestamp];
  objc_msgSend( v4,  "encodeMatrix4x4:forKey:",  @"devicePose",  *(double *)&self[1].super.isa,  self[1]._timestamp,  self[1]._lightEstimate,  *(double *)&self[2].super.isa);
  [v4 encodeInteger:self->_trackingState forKey:@"trackingState"];
  [v4 encodeDouble:@"lightEstimate" forKey:self->_lightEstimate];
  [v4 encodeBool:self->_majorRelocalization forKey:@"majorRelocalization"];
  [v4 encodeBool:self->_minorRelocalization forKey:@"minorRelocalization"];
}

- (NIVisionInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NIVisionInput;
  v5 = -[NIVisionInput init](&v14, "init");
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v6;
    [v4 decodeMatrix4x4ForKey:@"devicePose"];
    *(_OWORD *)&v5[1].super.isa = v7;
    *(_OWORD *)&v5[1]._timestamp = v8;
    *(_OWORD *)&v5[1]._lightEstimate = v9;
    *(_OWORD *)&v5[2].super.isa = v10;
    v5->_trackingState = (int64_t)[v4 decodeIntegerForKey:@"trackingState"];
    [v4 decodeDoubleForKey:@"lightEstimate"];
    v5->_lightEstimate = v11;
    v5->_majorRelocalization = [v4 decodeBoolForKey:@"majorRelocalization"];
    v5->_minorRelocalization = [v4 decodeBoolForKey:@"minorRelocalization"];
    v12 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    __int128 v7 = (NIVisionInput *)v4;
    __int128 v8 = v7;
    if (v7 == self)
    {
      BOOL v25 = 1;
    }

    else
    {
      double timestamp = self->_timestamp;
      -[NIVisionInput timestamp](v7, "timestamp");
      double v11 = v10;
      float32x4_t v32 = *(float32x4_t *)&self[1]._timestamp;
      float32x4_t v33 = *(float32x4_t *)&self[1].super.isa;
      float32x4_t v34 = *(float32x4_t *)&self[2].super.isa;
      float32x4_t v35 = *(float32x4_t *)&self[1]._lightEstimate;
      -[NIVisionInput devicePose](v8, "devicePose");
      float32x4_t v28 = v13;
      float32x4_t v29 = v12;
      float32x4_t v30 = v15;
      float32x4_t v31 = v14;
      int64_t trackingState = self->_trackingState;
      id v17 = -[NIVisionInput trackingState](v8, "trackingState");
      double lightEstimate = self->_lightEstimate;
      -[NIVisionInput lightEstimate](v8, "lightEstimate");
      double v20 = v19;
      int majorRelocalization = self->_majorRelocalization;
      unsigned int v22 = -[NIVisionInput majorRelocalization](v8, "majorRelocalization");
      int minorRelocalization = self->_minorRelocalization;
      unsigned int v24 = -[NIVisionInput minorRelocalization](v8, "minorRelocalization");
      BOOL v25 = 0;
      if (timestamp == v11
        && (vminvq_u32((uint32x4_t)vandq_s8( vandq_s8((int8x16_t)vceqq_f32(v33, v29), (int8x16_t)vceqq_f32(v32, v28)),  vandq_s8((int8x16_t)vceqq_f32(v35, v31), (int8x16_t)vceqq_f32(v34, v30)))) & 0x80000000) != 0 && (id)trackingState == v17 && lightEstimate == v20)
      {
        BOOL v25 = majorRelocalization == v22 && minorRelocalization == v24;
      }
    }
  }

  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  float32x4_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &self[1], 64LL));
  unint64_t v14 = (unint64_t)[v15 hash];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_timestamp));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_trackingState));
  unint64_t v6 = (unint64_t)[v5 hash];
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_lightEstimate));
  unint64_t v8 = (unint64_t)[v7 hash];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_majorRelocalization));
  unint64_t v10 = (unint64_t)[v9 hash];
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_minorRelocalization));
  unint64_t v12 = v4 ^ v14 ^ v6 ^ v8 ^ v10 ^ (unint64_t)[v11 hash];

  return v12;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)devicePose
{
  return *(double *)&v2;
}

- (int64_t)trackingState
{
  return self->_trackingState;
}

- (double)lightEstimate
{
  return self->_lightEstimate;
}

- (BOOL)majorRelocalization
{
  return self->_majorRelocalization;
}

- (BOOL)minorRelocalization
{
  return self->_minorRelocalization;
}

@end