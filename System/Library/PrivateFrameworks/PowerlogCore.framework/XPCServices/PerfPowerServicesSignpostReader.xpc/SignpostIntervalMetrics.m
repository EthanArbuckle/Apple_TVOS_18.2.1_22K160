@interface SignpostIntervalMetrics
- (SignpostIntervalMetrics)initWithBeginSnapshot:(id)a3 endSnapshot:(id)a4 animationInterval:(id)a5;
- (id)getMetricDictionary;
- (void)updateSummary:(id)a3 endSnapshot:(id)a4 animationInterval:(id)a5;
@end

@implementation SignpostIntervalMetrics

- (SignpostIntervalMetrics)initWithBeginSnapshot:(id)a3 endSnapshot:(id)a4 animationInterval:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___SignpostIntervalMetrics;
  v11 = -[SignpostIntervalMetrics init](&v53, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 metrics]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 metrics]);
    v14 = v13;
    if (v12 && v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 cpuTimeNsec]);
      [v15 doubleValue];
      double v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v12 cpuTimeNsec]);
      [v18 doubleValue];
      v11->cpuTimeSec = (v17 - v19) / 1000000000.0;

      v20 = (void *)objc_claimAutoreleasedReturnValue([v14 dirtyMemoryLifetimePeakKB]);
      [v20 doubleValue];
      double v22 = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue([v12 dirtyMemoryLifetimePeakKB]);
      [v23 doubleValue];
      double v25 = v24;

      if (v22 >= v25) {
        double v26 = v22;
      }
      else {
        double v26 = v25;
      }
      v11->peakMemoryKB = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue([v14 dirtyMemoryKB]);
      [v27 doubleValue];
      double v29 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue([v12 dirtyMemoryKB]);
      [v30 doubleValue];
      v11->averageMemoryKB = (v29 + v31) * 0.5;

      v32 = (void *)objc_claimAutoreleasedReturnValue([v14 storageDirtiedKB]);
      [v32 doubleValue];
      double v34 = v33;
      v35 = (void *)objc_claimAutoreleasedReturnValue([v12 storageDirtiedKB]);
      [v35 doubleValue];
      v11->diskLogicalWritesKB = v34 - v36;

      uint64_t v37 = objc_claimAutoreleasedReturnValue([v12 cpuInstructionsKI]);
      if (!v37
        || (v38 = (void *)v37,
            v39 = (void *)objc_claimAutoreleasedReturnValue([v14 cpuInstructionsKI]),
            v39,
            v38,
            !v39))
      {
        v11->cpuInstructionsKI = 0.0;
        if (v10) {
          goto LABEL_11;
        }
        goto LABEL_13;
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue([v14 cpuInstructionsKI]);
      [v40 doubleValue];
      double v42 = v41;
      v43 = (void *)objc_claimAutoreleasedReturnValue([v12 cpuInstructionsKI]);
      [v43 doubleValue];
      v11->cpuInstructionsKI = v42 - v44;
    }

    if (v10)
    {
LABEL_11:
      v45 = (void *)objc_claimAutoreleasedReturnValue([v10 glitches]);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_100004EBC;
      v51[3] = &unk_100010370;
      v46 = v11;
      v52 = v46;
      [v45 enumerateObjectsUsingBlock:v51];

      [v10 durationSeconds];
      v46[7] = (float)(v47 * 1000.0);

LABEL_14:
      *(_OWORD *)&v11->countInstances = xmmword_10000D1F0;
      [v8 startMs];
      v11->prevStartMs = v48;
      [v9 endMs];
      v11->prevEndMs = v49;

      goto LABEL_15;
    }

- (void)updateSummary:(id)a3 endSnapshot:(id)a4 animationInterval:(id)a5
{
  id v47 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v47 metrics]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 metrics]);
  v12 = v11;
  ++self->countInstances;
  if (v10 && v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 dirtyMemoryKB]);
    [v13 doubleValue];
    double v15 = v14;
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v10 dirtyMemoryKB]);
    [v16 doubleValue];
    double v18 = (v15 + v17) * 0.5;

    double v19 = (void *)objc_claimAutoreleasedReturnValue([v12 cpuTimeNsec]);
    [v19 doubleValue];
    double v21 = v20;
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v10 cpuTimeNsec]);
    [v22 doubleValue];
    self->cpuTimeSec = self->cpuTimeSec + (v21 - v23) / 1000000000.0;

    double peakMemoryKB = self->peakMemoryKB;
    double v25 = (void *)objc_claimAutoreleasedReturnValue([v12 dirtyMemoryLifetimePeakKB]);
    [v25 doubleValue];
    double v27 = v26;

    double v28 = (void *)objc_claimAutoreleasedReturnValue([v10 dirtyMemoryLifetimePeakKB]);
    [v28 doubleValue];
    double v30 = v29;

    if (v27 >= v30) {
      double v31 = v27;
    }
    else {
      double v31 = v30;
    }
    if (peakMemoryKB >= v31) {
      double v31 = peakMemoryKB;
    }
    double v32 = self->averageMemoryKB + (v18 - self->averageMemoryKB) / (double)self->countInstances;
    self->double peakMemoryKB = v31;
    self->averageMemoryKB = v32;
    double v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storageDirtiedKB", v47));
    [v33 doubleValue];
    double v35 = v34;
    double v36 = (void *)objc_claimAutoreleasedReturnValue([v10 storageDirtiedKB]);
    [v36 doubleValue];
    self->diskLogicalWritesKB = self->diskLogicalWritesKB + v35 - v37;
  }

  if (v9)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue([v9 glitches]);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_1000051C8;
    v49[3] = &unk_100010370;
    v49[4] = self;
    [v38 enumerateObjectsUsingBlock:v49];

    [v9 durationSeconds];
    self->animationDuration = self->animationDuration + (float)(v39 * 1000.0);
  }

  double prevStartMs = self->prevStartMs;
  objc_msgSend(v47, "startMs", v47);
  if (prevStartMs <= v41)
  {
    double prevEndMs = self->prevEndMs;
    [v48 startMs];
    if (prevEndMs > v44) {
      ++self->countIntervalOverlaps;
    }
    double v45 = self->prevEndMs;
    [v8 endMs];
    if (v45 >= v42) {
      double v42 = v45;
    }
  }

  else
  {
    [v8 endMs];
  }

  self->double prevEndMs = v42;
  [v48 startMs];
  self->double prevStartMs = v46;
}

- (id)getMetricDictionary
{
  v13[0] = @"cpuTime";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->cpuTimeSec));
  v14[0] = v3;
  v13[1] = @"peakMemory";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->peakMemoryKB));
  v14[1] = v4;
  v13[2] = @"averageMemory";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->averageMemoryKB));
  v14[2] = v5;
  v13[3] = @"diskIO";
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->diskLogicalWritesKB));
  v14[3] = v6;
  v13[4] = @"hitchDuration";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->hitchDuration));
  v14[4] = v7;
  v13[5] = @"animationDuration";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->animationDuration));
  v14[5] = v8;
  v13[6] = @"countInstances";
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)self->countInstances));
  v14[6] = v9;
  v13[7] = @"countIntervalOverlaps";
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)self->countIntervalOverlaps));
  v14[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  8LL));

  return v11;
}

@end