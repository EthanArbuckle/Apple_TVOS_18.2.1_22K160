@interface DYGPUTimelineInfo
+ (BOOL)supportsSecureCoding;
- (DYGPUTimelineInfo)init;
- (DYGPUTimelineInfo)initWithCoder:(id)a3;
- (NSArray)derivedCounterNames;
- (NSData)activeCoreInfoMasksPerPeriodicSample;
- (NSData)activeShadersPerPeriodicSample;
- (NSData)derivedCounters;
- (NSData)encoderTimelineInfos;
- (NSData)metalFXTimelineInfo;
- (NSData)numActiveShadersPerPeriodicSample;
- (NSData)timestamps;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)numPeriodicSamples;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateActiveShadersForAllSamples:(id)a3;
- (void)enumerateActiveShadersForSampleAtIndex:(unsigned int)a3 withBlock:(id)a4;
- (void)setActiveCoreInfoMasksPerPeriodicSample:(id)a3;
- (void)setActiveShadersPerPeriodicSample:(id)a3;
- (void)setDerivedCounterNames:(id)a3;
- (void)setDerivedCounters:(id)a3;
- (void)setEncoderTimelineInfos:(id)a3;
- (void)setMetalFXTimelineInfo:(id)a3;
- (void)setNumActiveShadersPerPeriodicSample:(id)a3;
- (void)setNumPeriodicSamples:(unsigned int)a3;
- (void)setTimestamps:(id)a3;
@end

@implementation DYGPUTimelineInfo

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setNumPeriodicSamples:", -[DYGPUTimelineInfo numPeriodicSamples](self, "numPeriodicSamples"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo timestamps](self, "timestamps"));
  id v6 = [v5 copy];
  [v4 setTimestamps:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo derivedCounters](self, "derivedCounters"));
  id v8 = [v7 copy];
  [v4 setDerivedCounters:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo derivedCounterNames](self, "derivedCounterNames"));
  id v10 = [v9 copy];
  [v4 setDerivedCounterNames:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo activeShadersPerPeriodicSample](self, "activeShadersPerPeriodicSample"));
  id v12 = [v11 copy];
  [v4 setActiveShadersPerPeriodicSample:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo numActiveShadersPerPeriodicSample](self, "numActiveShadersPerPeriodicSample"));
  id v14 = [v13 copy];
  [v4 setNumActiveShadersPerPeriodicSample:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo encoderTimelineInfos](self, "encoderTimelineInfos"));
  id v16 = [v15 copy];
  [v4 setEncoderTimelineInfos:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUTimelineInfo metalFXTimelineInfo](self, "metalFXTimelineInfo"));
  id v18 = [v17 copy];
  [v4 setMetalFXTimelineInfo:v18];

  return v4;
}

- (DYGPUTimelineInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)&OBJC_CLASS___DYGPUTimelineInfo;
  v5 = -[DYGPUTimelineInfo init](&v66, "init");
  if (v5)
  {
    v5->_numPeriodicSamples = [v4 decodeIntForKey:@"numPeriodicSamples"];
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData, v6);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  objc_opt_class(&OBJC_CLASS___NSMutableData, v8),  0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"timestamps"]);
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSData *)v11;

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSData, v13);
    id v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  objc_opt_class(&OBJC_CLASS___NSMutableData, v15),  0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"derivedCounters"]);
    derivedCounters = v5->_derivedCounters;
    v5->_derivedCounters = (NSData *)v18;

    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray, v20);
    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v22);
    v25 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v21,  v23,  objc_opt_class(&OBJC_CLASS___NSString, v24),  0LL);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v26 forKey:@"derivedCounterNames"]);
    derivedCounterNames = v5->_derivedCounterNames;
    v5->_derivedCounterNames = (NSArray *)v27;

    uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSData, v29);
    v32 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v30,  objc_opt_class(&OBJC_CLASS___NSMutableData, v31),  0LL);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    uint64_t v34 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v33 forKey:@"activeShadersPerPeriodicSample"]);
    activeShadersPerPeriodicSample = v5->_activeShadersPerPeriodicSample;
    v5->_activeShadersPerPeriodicSample = (NSData *)v34;

    uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSData, v36);
    v39 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v37,  objc_opt_class(&OBJC_CLASS___NSMutableData, v38),  0LL);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    uint64_t v41 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v40 forKey:@"activeCoreInfoMasksPerPeriodicSample"]);
    activeCoreInfoMasksPerPeriodicSample = v5->_activeCoreInfoMasksPerPeriodicSample;
    v5->_activeCoreInfoMasksPerPeriodicSample = (NSData *)v41;

    uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSData, v43);
    v46 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v44,  objc_opt_class(&OBJC_CLASS___NSMutableData, v45),  0LL);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    uint64_t v48 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v47 forKey:@"numActiveShadersPerPeriodicSample"]);
    numActiveShadersPerPeriodicSample = v5->_numActiveShadersPerPeriodicSample;
    v5->_numActiveShadersPerPeriodicSample = (NSData *)v48;

    uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSData, v50);
    v53 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v51,  objc_opt_class(&OBJC_CLASS___NSMutableData, v52),  0LL);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    uint64_t v55 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v54 forKey:@"encoderTimelineInfos"]);
    encoderTimelineInfos = v5->_encoderTimelineInfos;
    v5->_encoderTimelineInfos = (NSData *)v55;

    uint64_t v58 = objc_opt_class(&OBJC_CLASS___NSData, v57);
    v60 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v58,  objc_opt_class(&OBJC_CLASS___NSMutableData, v59),  0LL);
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    uint64_t v62 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v61 forKey:@"metalFXTimelineInfo"]);
    metalFXTimelineInfo = v5->_metalFXTimelineInfo;
    v5->_metalFXTimelineInfo = (NSData *)v62;

    v64 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_numPeriodicSamples forKey:@"numPeriodicSamples"];
  [v4 encodeObject:self->_timestamps forKey:@"timestamps"];
  [v4 encodeObject:self->_derivedCounters forKey:@"derivedCounters"];
  [v4 encodeObject:self->_derivedCounterNames forKey:@"derivedCounterNames"];
  [v4 encodeObject:self->_activeShadersPerPeriodicSample forKey:@"activeShadersPerPeriodicSample"];
  [v4 encodeObject:self->_activeCoreInfoMasksPerPeriodicSample forKey:@"activeCoreInfoMasksPerPeriodicSample"];
  [v4 encodeObject:self->_numActiveShadersPerPeriodicSample forKey:@"numActiveShadersPerPeriodicSample"];
  [v4 encodeObject:self->_encoderTimelineInfos forKey:@"encoderTimelineInfos"];
  [v4 encodeObject:self->_metalFXTimelineInfo forKey:@"metalFXTimelineInfo"];
}

- (DYGPUTimelineInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DYGPUTimelineInfo;
  v2 = -[DYGPUTimelineInfo init](&v6, "init");
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (void)enumerateActiveShadersForAllSamples:(id)a3
{
  id v4 = (void (**)(id, NSUInteger, char *, uint64_t, uint64_t, char *))a3;
  v5 = -[NSData bytes](self->_activeShadersPerPeriodicSample, "bytes");
  NSUInteger v6 = -[NSData length](self->_activeShadersPerPeriodicSample, "length");
  uint64_t v7 = -[NSData bytes](self->_activeCoreInfoMasksPerPeriodicSample, "bytes");
  NSUInteger v8 = -[NSData length](self->_activeCoreInfoMasksPerPeriodicSample, "length");
  uint64_t v21 = -[NSData bytes](self->_numActiveShadersPerPeriodicSample, "bytes");
  NSUInteger v9 = -[NSData length](self->_numActiveShadersPerPeriodicSample, "length");
  char v22 = 0;
  if (v9 >= 8)
  {
    uint64_t v10 = 0LL;
    NSUInteger v11 = v6 >> 3;
    NSUInteger v20 = v9 >> 3;
    do
    {
      id v12 = (unsigned int *)&v21[8 * v10];
      unsigned int v13 = *v12;
      if (*v12)
      {
        uint64_t v14 = 0LL;
        do
        {
          NSUInteger v15 = v14 + v12[1];
          BOOL v17 = v8 < 8 || v8 >> 3 > v15;
          if (v11 > v15 && v17)
          {
            if (v8 >= 8) {
              v19 = &v7[8 * v15];
            }
            else {
              v19 = 0LL;
            }
            v4[2](v4, (NSUInteger)v5 + 8 * v15, v19, v10, v14, &v22);
            if (v22) {
              goto LABEL_2;
            }
            unsigned int v13 = *v12;
          }

          uint64_t v14 = (v14 + 1);
        }

        while (v14 < v13);
      }

      ++v10;
    }

    while (v10 != v20);
  }

- (void)enumerateActiveShadersForSampleAtIndex:(unsigned int)a3 withBlock:(id)a4
{
  NSUInteger v6 = (void (**)(id, NSUInteger, char *, uint64_t, char *))a4;
  uint64_t v7 = -[NSData bytes](self->_activeShadersPerPeriodicSample, "bytes");
  NSUInteger v8 = -[NSData length](self->_activeShadersPerPeriodicSample, "length");
  NSUInteger v9 = -[NSData bytes](self->_activeCoreInfoMasksPerPeriodicSample, "bytes");
  NSUInteger v10 = -[NSData length](self->_activeCoreInfoMasksPerPeriodicSample, "length");
  NSUInteger v11 = -[NSData bytes](self->_numActiveShadersPerPeriodicSample, "bytes");
  if (a3 < -[NSData length](self->_numActiveShadersPerPeriodicSample, "length") >> 3)
  {
    char v21 = 0;
    id v12 = (unsigned int *)&v11[8 * a3];
    unsigned int v13 = *v12;
    if (*v12)
    {
      uint64_t v14 = 0LL;
      NSUInteger v15 = v8 >> 3;
      do
      {
        NSUInteger v16 = v14 + v12[1];
        BOOL v18 = v10 < 8 || v10 >> 3 > v16;
        if (v15 > v16 && v18)
        {
          if (v10 >= 8) {
            NSUInteger v20 = &v9[8 * v16];
          }
          else {
            NSUInteger v20 = 0LL;
          }
          v6[2](v6, (NSUInteger)v7 + 8 * v16, v20, v14, &v21);
          if (v21) {
            break;
          }
          unsigned int v13 = *v12;
        }

        uint64_t v14 = (v14 + 1);
      }

      while (v14 < v13);
    }
  }
}

- (unsigned)numPeriodicSamples
{
  return self->_numPeriodicSamples;
}

- (void)setNumPeriodicSamples:(unsigned int)a3
{
  self->_numPeriodicSamples = a3;
}

- (NSData)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
}

- (NSData)derivedCounters
{
  return self->_derivedCounters;
}

- (void)setDerivedCounters:(id)a3
{
}

- (NSArray)derivedCounterNames
{
  return self->_derivedCounterNames;
}

- (void)setDerivedCounterNames:(id)a3
{
}

- (NSData)activeShadersPerPeriodicSample
{
  return self->_activeShadersPerPeriodicSample;
}

- (void)setActiveShadersPerPeriodicSample:(id)a3
{
}

- (NSData)activeCoreInfoMasksPerPeriodicSample
{
  return self->_activeCoreInfoMasksPerPeriodicSample;
}

- (void)setActiveCoreInfoMasksPerPeriodicSample:(id)a3
{
}

- (NSData)numActiveShadersPerPeriodicSample
{
  return self->_numActiveShadersPerPeriodicSample;
}

- (void)setNumActiveShadersPerPeriodicSample:(id)a3
{
}

- (NSData)encoderTimelineInfos
{
  return self->_encoderTimelineInfos;
}

- (void)setEncoderTimelineInfos:(id)a3
{
}

- (NSData)metalFXTimelineInfo
{
  return self->_metalFXTimelineInfo;
}

- (void)setMetalFXTimelineInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end