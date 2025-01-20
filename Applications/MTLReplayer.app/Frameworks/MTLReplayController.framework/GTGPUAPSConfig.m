@interface GTGPUAPSConfig
- (NSDictionary)grcTrigger;
- (id)initForCounters;
- (id)initForMinimumInfoCounters;
- (id)initForMinimumInfoProfiling;
- (id)initForMinimumInfoTimeline;
- (id)initForProfiling;
- (id)initForTimeline;
- (id)toDictionary;
- (unint64_t)bufferSizeInKb;
- (unint64_t)cliqueTraceLevel;
- (unint64_t)countPeriod;
- (unint64_t)duration;
- (unint64_t)emitPos;
- (unint64_t)emitThreadControlFlow;
- (unint64_t)eslInstTracing;
- (unint64_t)pulsePeriod;
- (unint64_t)subSamplingMinTraced;
- (unint64_t)subSamplingTargetThreshold;
- (unint64_t)syncDrainMode;
- (unint64_t)systemTimePeriod;
- (unint64_t)tileTracing;
- (void)readConfig:(id)a3;
- (void)setBufferSizeInKb:(unint64_t)a3;
- (void)setCliqueTraceLevel:(unint64_t)a3;
- (void)setCountPeriod:(unint64_t)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setEmitPos:(unint64_t)a3;
- (void)setEmitThreadControlFlow:(unint64_t)a3;
- (void)setEslInstTracing:(unint64_t)a3;
- (void)setPulsePeriod:(unint64_t)a3;
- (void)setSubSamplingMinTraced:(unint64_t)a3;
- (void)setSubSamplingTargetThreshold:(unint64_t)a3;
- (void)setSyncDrainMode:(unint64_t)a3;
- (void)setSystemTimePeriod:(unint64_t)a3;
- (void)setTileTracing:(unint64_t)a3;
@end

@implementation GTGPUAPSConfig

- (id)toDictionary
{
  v29[0] = @"Duration";
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_duration));
  v30[0] = v22;
  v29[1] = @"RingBufferSizeInKB";
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_ringBufferSizeInKb));
  v30[1] = v21;
  v29[2] = @"BufferSizeInKB";
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  10 * self->_ringBufferSizeInKb));
  v30[2] = v20;
  v29[3] = @"SystemTimePeriod";
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_systemTimePeriod));
  v30[3] = v19;
  v29[4] = @"ProfileControl";
  v27[0] = @"CliqueTraceLevel";
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_cliqueTraceLevel));
  v28[0] = v18;
  v27[1] = @"EmitPos";
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_emitPos));
  v28[1] = v17;
  v27[2] = @"EmitThreadControlFlow";
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_emitThreadControlFlow));
  v28[2] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  3LL));
  v30[4] = v15;
  v29[5] = @"SyncDrainMode";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_syncDrainMode));
  v30[5] = v3;
  v29[6] = @"KickAndStateTracing";
  v25[0] = @"PulsePeriod";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_pulsePeriod));
  v26[0] = v4;
  v25[1] = @"CountPeriod";
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_countPeriod));
  v26[1] = v5;
  v25[2] = @"TileTracing";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_tileTracing));
  v26[2] = v6;
  v25[3] = @"ESLInstTracing";
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_eslInstTracing));
  v26[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  4LL));
  v30[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  7LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v9));

  if (*(_OWORD *)&self->_subSamplingMinTraced != 0LL)
  {
    v23[0] = @"MinTraced";
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
    v23[1] = @"TargetThreshold";
    v24[0] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_subSamplingTargetThreshold));
    v24[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
    [v10 setObject:v13 forKeyedSubscript:@"CliqueSubSampling"];
  }

  return v10;
}

- (id)initForProfiling
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTGPUAPSConfig;
  id result = -[GTGPUAPSConfig init](&v3, "init");
  if (result)
  {
    *((void *)result + 1) = 1LL;
    *(_OWORD *)((char *)result + 56) = xmmword_318340;
    *(_OWORD *)((char *)result + 72) = xmmword_318350;
    *((void *)result + 12) = 0LL;
    *((void *)result + 13) = 0LL;
    *((void *)result + 11) = 1LL;
    *(_OWORD *)((char *)result + 24) = xmmword_318360;
    *(int64x2_t *)((char *)result + 40) = vdupq_n_s64(1uLL);
  }

  return result;
}

- (id)initForCounters
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTGPUAPSConfig;
  id result = -[GTGPUAPSConfig init](&v3, "init");
  if (result)
  {
    *((void *)result + 1) = 1LL;
    *(_OWORD *)((char *)result + 56) = xmmword_318370;
    *((void *)result + 10) = 0LL;
    *((void *)result + 11) = 0LL;
    *((void *)result + 9) = 1LL;
    *((int64x2_t *)result + 6) = vdupq_n_s64(1uLL);
    *(_OWORD *)((char *)result + 24) = xmmword_318380;
    *(_OWORD *)((char *)result + 40) = xmmword_318390;
  }

  return result;
}

- (id)initForTimeline
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTGPUAPSConfig;
  id result = -[GTGPUAPSConfig init](&v3, "init");
  if (result)
  {
    *((void *)result + 1) = 1LL;
    *(_OWORD *)((char *)result + 56) = xmmword_318370;
    *(_OWORD *)((char *)result + 72) = xmmword_3183A0;
    *((void *)result + 12) = 0LL;
    *((void *)result + 13) = 0LL;
    *((void *)result + 11) = 1LL;
    *(_OWORD *)((char *)result + 24) = xmmword_318380;
    *(_OWORD *)((char *)result + 40) = xmmword_318390;
  }

  return result;
}

- (id)initForMinimumInfoTimeline
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTGPUAPSConfig;
  id result = -[GTGPUAPSConfig init](&v3, "init");
  if (result)
  {
    *((void *)result + 1) = 1LL;
    *(_OWORD *)((char *)result + 56) = xmmword_318370;
    *((void *)result + 10) = 0LL;
    *((void *)result + 11) = 0LL;
    *((void *)result + 9) = 1LL;
    *((int64x2_t *)result + 6) = vdupq_n_s64(1uLL);
    *(_OWORD *)((char *)result + 24) = xmmword_3183B0;
    *(_OWORD *)((char *)result + 40) = xmmword_318390;
  }

  return result;
}

- (id)initForMinimumInfoCounters
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTGPUAPSConfig;
  id result = -[GTGPUAPSConfig init](&v3, "init");
  if (result)
  {
    *((void *)result + 1) = 1LL;
    *(_OWORD *)((char *)result + 56) = xmmword_318370;
    *((void *)result + 10) = 0LL;
    *((void *)result + 11) = 0LL;
    *((void *)result + 9) = 1LL;
    *((int64x2_t *)result + 6) = vdupq_n_s64(1uLL);
    *(_OWORD *)((char *)result + 24) = xmmword_3183B0;
    *(_OWORD *)((char *)result + 40) = xmmword_318390;
  }

  return result;
}

- (id)initForMinimumInfoProfiling
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GTGPUAPSConfig;
  id result = -[GTGPUAPSConfig init](&v4, "init");
  if (result)
  {
    *((void *)result + 1) = 1LL;
    *(_OWORD *)((char *)result + 56) = xmmword_318340;
    *((void *)result + 10) = 0LL;
    *((void *)result + 11) = 0LL;
    int64x2_t v3 = vdupq_n_s64(1uLL);
    *((void *)result + 9) = 3LL;
    *((int64x2_t *)result + 6) = v3;
    *(_OWORD *)((char *)result + 24) = xmmword_3183B0;
    *(int64x2_t *)((char *)result + 40) = v3;
  }

  return result;
}

- (void)readConfig:(id)a3
{
  id v36 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"SyncDrainMode"]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"SyncDrainMode"]);
    self->_syncDrainMode = (unint64_t)[v5 unsignedIntegerValue];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"Duration"]);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"Duration"]);
    self->_duration = (unint64_t)[v7 unsignedIntegerValue];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"RingBufferSizeInKB"]);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"RingBufferSizeInKB"]);
    self->_ringBufferSizeInKb = (unint64_t)[v9 unsignedIntegerValue];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"SystemTimePeriod"]);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"SystemTimePeriod"]);
    self->_systemTimePeriod = (unint64_t)[v11 unsignedIntegerValue];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"ProfileControl"]);
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"CliqueTraceLevel"]);
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"CliqueTraceLevel"]);
      self->_cliqueTraceLevel = (unint64_t)[v15 unsignedIntegerValue];
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"EmitPos"]);
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"EmitPos"]);
      self->_emitPos = (unint64_t)[v17 unsignedIntegerValue];
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"EmitThreadControlFlow"]);
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"EmitThreadControlFlow"]);
      self->_emitThreadControlFlow = (unint64_t)[v19 unsignedIntegerValue];
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"CliqueSubSampling"]);
  v21 = v20;
  if (v20)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"MinTraced"]);
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"MinTraced"]);
      self->_subSamplingMinTraced = (unint64_t)[v23 unsignedIntegerValue];
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"TargetThreshold"]);
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"TargetThreshold"]);
      self->_subSamplingTargetThreshold = (unint64_t)[v25 unsignedIntegerValue];
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"KickAndStateTracing"]);
  v27 = v26;
  if (v26)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"PulsePeriod"]);
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"PulsePeriod"]);
      self->_pulsePeriod = (unint64_t)[v29 unsignedIntegerValue];
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"CountPeriod"]);
    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"CountPeriod"]);
      self->_countPeriod = (unint64_t)[v31 unsignedIntegerValue];
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"TileTracing"]);
    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"TileTracing"]);
      self->_tileTracing = (unint64_t)[v33 unsignedIntegerValue];
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"ESLInstTracing"]);
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"ESLInstTracing"]);
      self->_eslInstTracing = (unint64_t)[v35 unsignedIntegerValue];
    }
  }
}

- (NSDictionary)grcTrigger
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GTGPUAPSConfig toDictionary](self, "toDictionary"));
  int64x2_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"KickAndStateTracing"]);

  return (NSDictionary *)v3;
}

- (unint64_t)syncDrainMode
{
  return self->_syncDrainMode;
}

- (void)setSyncDrainMode:(unint64_t)a3
{
  self->_syncDrainMode = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (unint64_t)pulsePeriod
{
  return self->_pulsePeriod;
}

- (void)setPulsePeriod:(unint64_t)a3
{
  self->_pulsePeriod = a3;
}

- (unint64_t)countPeriod
{
  return self->_countPeriod;
}

- (void)setCountPeriod:(unint64_t)a3
{
  self->_countPeriod = a3;
}

- (unint64_t)tileTracing
{
  return self->_tileTracing;
}

- (void)setTileTracing:(unint64_t)a3
{
  self->_tileTracing = a3;
}

- (unint64_t)eslInstTracing
{
  return self->_eslInstTracing;
}

- (void)setEslInstTracing:(unint64_t)a3
{
  self->_eslInstTracing = a3;
}

- (unint64_t)bufferSizeInKb
{
  return self->_ringBufferSizeInKb;
}

- (void)setBufferSizeInKb:(unint64_t)a3
{
  self->_ringBufferSizeInKb = a3;
}

- (unint64_t)systemTimePeriod
{
  return self->_systemTimePeriod;
}

- (void)setSystemTimePeriod:(unint64_t)a3
{
  self->_systemTimePeriod = a3;
}

- (unint64_t)cliqueTraceLevel
{
  return self->_cliqueTraceLevel;
}

- (void)setCliqueTraceLevel:(unint64_t)a3
{
  self->_cliqueTraceLevel = a3;
}

- (unint64_t)emitPos
{
  return self->_emitPos;
}

- (void)setEmitPos:(unint64_t)a3
{
  self->_emitPos = a3;
}

- (unint64_t)emitThreadControlFlow
{
  return self->_emitThreadControlFlow;
}

- (void)setEmitThreadControlFlow:(unint64_t)a3
{
  self->_emitThreadControlFlow = a3;
}

- (unint64_t)subSamplingMinTraced
{
  return self->_subSamplingMinTraced;
}

- (void)setSubSamplingMinTraced:(unint64_t)a3
{
  self->_subSamplingMinTraced = a3;
}

- (unint64_t)subSamplingTargetThreshold
{
  return self->_subSamplingTargetThreshold;
}

- (void)setSubSamplingTargetThreshold:(unint64_t)a3
{
  self->_subSamplingTargetThreshold = a3;
}

@end