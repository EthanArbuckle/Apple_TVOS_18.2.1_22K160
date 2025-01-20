@interface CLMetricEventBins
- (BOOL)createAggPeriodIfApplicable:(double)a3;
- (CLMetricEventBins)initWithAnalyticsEvent:(id)a3 binPeriod:(int)a4 atCurrentTime:(double)a5;
- (CLMetricEventBins)initWithIdentifier:(id)a3 asExternal:(BOOL)a4 binPeriod:(int)a5 aggregationPeriod:(int)a6 atCurrentTime:(double)a7 andSubmit:(BOOL)a8;
- (CLMetricEventBins)initWithInternalName:(id)a3 binPeriod:(int)a4 aggregationPeriod:(int)a5 atCurrentTime:(double)a6 andSubmit:(BOOL)a7;
- (NSString)dimensionStr;
- (id)testGetCurrentMode;
- (id)testGetSubmissions;
- (int)binIndex:(double)a3;
- (int)countMatchesInA:(id)a3 andB:(id)a4;
- (int)dimensionInt;
- (int)fuzzPrivacyHours:(int)a3;
- (int)localSecondsIntoDay:(double)a3;
- (int)periodIndex:(double)a3;
- (int)testGetCountForMode:(id)a3 andPeriod:(int)a4;
- (int)testGetDailyCount;
- (int)testGetDailyTotal;
- (int)testGetDistributionBinAnchor;
- (int)testGetModeReferenceBin;
- (int)testModeCountAtPeriod:(int)a3;
- (void)checkSubmissionAtPeriod:(int)a3;
- (void)computeIntervalDistributionsForPeriod:(int)a3;
- (void)computeModeSubmissionForPeriod:(int)a3;
- (void)computePercentageAndSubmit:(int)a3;
- (void)dealloc;
- (void)fillModesUptoTime:(double)a3 atChange:(BOOL)a4;
- (void)processEventTime:(double)a3;
- (void)processEventTimeRangeFrom:(double)a3 to:(double)a4;
- (void)processEventTimes:(id)a3;
- (void)removeLingeringEntriesAtPeriod:(int)a3;
- (void)reset:(double)a3;
- (void)setDimensionInt:(int)a3;
- (void)setDimensionStr:(id)a3;
- (void)setHourAmbiguity:(int)a3;
- (void)setIndependentMode:(id)a3 atTime:(double)a4 startingWith:(id)a5;
- (void)setIntervalDistributions:(id)a3;
- (void)setMetricDimensions:(id)a3;
- (void)setRelatedModes:(id)a3 atTime:(double)a4 startingWith:(id)a5 andTransitions:(BOOL)a6;
- (void)submitIntervalMetricsForEvent:(id)a3;
- (void)submitModeMetricsForEvent:(id)a3;
- (void)submitPercentageMetricsForEvent:(id)a3;
- (void)testClearSubmissions;
- (void)testSkipSumbission;
- (void)updateIndependentMode:(id)a3 toState:(id)a4 atTime:(double)a5;
- (void)updateRelatedModesTo:(id)a3 atTime:(double)a4;
- (void)updateToCurrentTime:(double)a3;
@end

@implementation CLMetricEventBins

- (CLMetricEventBins)initWithInternalName:(id)a3 binPeriod:(int)a4 aggregationPeriod:(int)a5 atCurrentTime:(double)a6 andSubmit:(BOOL)a7
{
  return -[CLMetricEventBins initWithIdentifier:asExternal:binPeriod:aggregationPeriod:atCurrentTime:andSubmit:]( self,  "initWithIdentifier:asExternal:binPeriod:aggregationPeriod:atCurrentTime:andSubmit:",  a3,  0LL,  *(void *)&a4,  *(void *)&a5,  a7,  a6);
}

- (CLMetricEventBins)initWithAnalyticsEvent:(id)a3 binPeriod:(int)a4 atCurrentTime:(double)a5
{
  return -[CLMetricEventBins initWithIdentifier:asExternal:binPeriod:aggregationPeriod:atCurrentTime:andSubmit:]( self,  "initWithIdentifier:asExternal:binPeriod:aggregationPeriod:atCurrentTime:andSubmit:",  a3,  1LL,  *(void *)&a4,  3600LL,  1LL,  a5);
}

- (CLMetricEventBins)initWithIdentifier:(id)a3 asExternal:(BOOL)a4 binPeriod:(int)a5 aggregationPeriod:(int)a6 atCurrentTime:(double)a7 andSubmit:(BOOL)a8
{
  if (a6 > 86400 || (int v11 = a6 / a5, a6 % a5) || a6 < 300 || 86400 % a6)
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    v24 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289795;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2081;
      v34 = (const char *)[a3 UTF8String];
      __int16 v35 = 1026;
      int v36 = a5;
      __int16 v37 = 1026;
      int v38 = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#cabin init, invalid bin/aggregation periods, returning nil, id:%{private, location :escape_only}s, bin:%{public}d, aggregation:%{public}d}",  buf,  0x28u);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_1018687E8);
      }
    }

    v25 = (os_log_s *)qword_1019349A8;
    if (os_signpost_enabled((os_log_t)qword_1019349A8))
    {
      v26 = (const char *)[a3 UTF8String];
      *(_DWORD *)buf = 68289795;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2081;
      v34 = v26;
      __int16 v35 = 1026;
      int v36 = a5;
      __int16 v37 = 1026;
      int v38 = a6;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#cabin init, invalid bin/aggregation periods, returning nil",  "{msg%{public}.0s:#cabin init, invalid bin/aggregation periods, returning nil, id:%{private, location :escape_only}s, bin:%{public}d, aggregation:%{public}d}",  buf,  0x28u);
    }

    return 0LL;
  }

  else
  {
    v28.receiver = self;
    v28.super_class = (Class)&OBJC_CLASS___CLMetricEventBins;
    v15 = -[CLMetricEventBins init](&v28, "init");
    v16 = v15;
    if (v15)
    {
      v15->_isExternal = a4;
      v15->_metricId = (NSString *)a3;
      v15->_int binPeriod = a5;
      v15->_int aggregationPeriod = a6;
      v15->_int periodsInDay = 0x15180u / a6;
      v15->_int nBins = v11;
      v15->_BOOL submitMetrics = a8;
      v15->_aggregationDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v16->_percentMetrics = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v16->_privacyHours = -1;
      v16->_intervalDistributions = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v16->_intervalDistributionStrings = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v16->_intervalMetrics = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      *(void *)&v16->_modeRefBin = -1LL;
      v16->_modeAggregation = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v16->_modeDailyMatch = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v16->_modeDailyTotal = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v16->_modeMetrics = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v16->_testSubmissions = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_1018687E8);
      }
      v17 = (os_log_s *)qword_1019349A8;
      if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
      {
        v18 = -[NSString UTF8String](v16->_metricId, "UTF8String");
        int binPeriod = v16->_binPeriod;
        int aggregationPeriod = v16->_aggregationPeriod;
        int periodsInDay = v16->_periodsInDay;
        int nBins = v16->_nBins;
        BOOL submitMetrics = v16->_submitMetrics;
        *(_DWORD *)buf = 68290819;
        __int16 v31 = 2082;
        int v30 = 0;
        v32 = "";
        __int16 v33 = 2081;
        v34 = v18;
        __int16 v35 = 1026;
        int v36 = binPeriod;
        __int16 v37 = 1026;
        int v38 = aggregationPeriod;
        __int16 v39 = 1026;
        int v40 = (int)a7;
        __int16 v41 = 1026;
        int v42 = periodsInDay;
        __int16 v43 = 1026;
        int v44 = nBins;
        __int16 v45 = 1026;
        BOOL v46 = submitMetrics;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin init, id:%{private, location:escape_only}s, bin:%{public}d, aggregat e:%{public}d, now:%{public}d, periods:%{public}d, bins:%{public}d, submit:%{public}d}",  buf,  0x40u);
      }

      -[CLMetricEventBins reset:](v16, "reset:", a7);
    }
  }

  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMetricEventBins;
  -[CLMetricEventBins dealloc](&v3, "dealloc");
}

- (void)setHourAmbiguity:(int)a3
{
  if (self->_isExternal) {
    self->_privacyHours = a3;
  }
}

- (void)setMetricDimensions:(id)a3
{
  if (self->_isExternal)
  {
    -[NSMutableDictionary removeAllObjects](self->_dimensionDict, "removeAllObjects");

    self->_dimensionDict = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a3);
    -[NSMutableDictionary removeAllObjects](self->_percentMetrics, "removeAllObjects");
    -[NSMutableDictionary addEntriesFromDictionary:](self->_percentMetrics, "addEntriesFromDictionary:", a3);
    -[NSMutableDictionary removeAllObjects](self->_intervalMetrics, "removeAllObjects");
    -[NSMutableDictionary addEntriesFromDictionary:](self->_intervalMetrics, "addEntriesFromDictionary:", a3);
    -[NSMutableDictionary removeAllObjects](self->_modeMetrics, "removeAllObjects");
    -[NSMutableDictionary addEntriesFromDictionary:](self->_modeMetrics, "addEntriesFromDictionary:", a3);
  }

  else
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    v5 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_ERROR))
    {
      v6 = -[NSString UTF8String](self->_metricId, "UTF8String");
      int v9 = 68289283;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2081;
      v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#cabin setMetricDimensions only for external events, id:%{private, location:escape_only}s}",  (uint8_t *)&v9,  0x1Cu);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_1018687E8);
      }
    }

    v7 = (os_log_s *)qword_1019349A8;
    if (os_signpost_enabled((os_log_t)qword_1019349A8))
    {
      v8 = -[NSString UTF8String](self->_metricId, "UTF8String");
      int v9 = 68289283;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2081;
      v14 = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#cabin setMetricDimensions only for external events",  "{msg%{public}.0s:#cabin setMetricDimensions only for external events, id:%{private, location:escape_only}s}",  (uint8_t *)&v9,  0x1Cu);
    }
  }

- (void)setIntervalDistributions:(id)a3
{
  id v22 = a3;
  v5 = -[NSArray sortedArrayUsingSelector:]( -[NSSet allObjects](+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", a3), "allObjects"),  "sortedArrayUsingSelector:",  "compare:");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v39,  16LL);
  if (v6)
  {
    id v7 = v6;
    int v8 = -1;
    uint64_t v9 = *(void *)v24;
    do
    {
      int v10 = 0LL;
      int v11 = v8;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(id *)(*((void *)&v23 + 1) + 8LL * (void)v10);
        int v8 = (int)[v12 intValue] / self->_binPeriod;
        -[NSMutableArray addObject:]( self->_intervalDistributions,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (v8 + 1)));
        id v13 = -[NSArray firstObject](v5, "firstObject");
        intervalDistributionStrings = self->_intervalDistributionStrings;
        int binPeriod = self->_binPeriod;
        if (v12 == v13) {
          v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(0 - %d]"),  (binPeriod * v8),  v21;
        }
        else {
          v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%d - %d]"),  (binPeriod * v11),  (binPeriod * v8);
        }
        -[NSMutableArray addObject:](intervalDistributionStrings, "addObject:", v16);
        if (v12 == -[NSArray lastObject](v5, "lastObject")) {
          -[NSMutableArray addObject:]( self->_intervalDistributionStrings,  "addObject:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"> %d",  (self->_binPeriod * v8)));
        }
        int v10 = (char *)v10 + 1;
        int v11 = v8;
      }

      while (v7 != v10);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v39,  16LL);
    }

    while (v7);
  }

  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_1018687E8);
  }
  v17 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = -[NSString UTF8String](self->_metricId, "UTF8String");
    intervalDistributions = self->_intervalDistributions;
    v20 = self->_intervalDistributionStrings;
    *(_DWORD *)buf = 68290050;
    int v28 = 0;
    __int16 v29 = 2082;
    int v30 = "";
    __int16 v31 = 2082;
    v32 = v18;
    __int16 v33 = 2114;
    id v34 = v22;
    __int16 v35 = 2114;
    int v36 = intervalDistributions;
    __int16 v37 = 2114;
    int v38 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin provide dist, id:%{public, location:escape_only}s, in:%{public, location:e scape_only}@, dist:%{public, location:escape_only}@, str:%{public, location:escape_only}@}",  buf,  0x3Au);
  }

- (void)setRelatedModes:(id)a3 atTime:(double)a4 startingWith:(id)a5 andTransitions:(BOOL)a6
{
  BOOL v6 = a6;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  modeAggregation = self->_modeAggregation;
  id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modeAggregation,  "countByEnumeratingWithState:objects:count:",  &v33,  v56,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(modeAggregation);
        }
        uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
        objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_modeAggregation, "objectForKeyedSubscript:", v16),  "removeAllObjects");
        objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_modeDailyMatch, "objectForKeyedSubscript:", v16),  "removeAllObjects");
        objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_modeDailyTotal, "objectForKeyedSubscript:", v16),  "removeAllObjects");
      }

      id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modeAggregation,  "countByEnumeratingWithState:objects:count:",  &v33,  v56,  16LL);
    }

    while (v13);
  }

  -[NSMutableDictionary removeAllObjects](self->_modeAggregation, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_modeDailyMatch, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_modeDailyTotal, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_modeMetrics, "removeAllObjects");
  -[NSMutableDictionary addEntriesFromDictionary:]( self->_modeMetrics,  "addEntriesFromDictionary:",  self->_dimensionDict);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v17 = [a3 countByEnumeratingWithState:&v29 objects:v55 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(a3);
        }
        uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)j);
        -[NSMutableDictionary setObject:forKey:]( self->_modeAggregation,  "setObject:forKey:",  objc_alloc_init(&OBJC_CLASS___NSMutableDictionary),  v21);
        -[NSMutableDictionary setObject:forKey:](self->_modeDailyMatch, "setObject:forKey:", &off_1018D3E48, v21);
        -[NSMutableDictionary setObject:forKey:](self->_modeDailyTotal, "setObject:forKey:", &off_1018D3E48, v21);
      }

      id v18 = [a3 countByEnumeratingWithState:&v29 objects:v55 count:16];
    }

    while (v18);
  }

  if (v6)
  {
    -[NSMutableDictionary setObject:forKey:]( self->_modeAggregation,  "setObject:forKey:",  objc_alloc_init(&OBJC_CLASS___NSMutableDictionary),  @"transition");
    -[NSMutableDictionary setObject:forKey:]( self->_modeDailyMatch,  "setObject:forKey:",  &off_1018D3E48,  @"transition");
    -[NSMutableDictionary setObject:forKey:]( self->_modeDailyTotal,  "setObject:forKey:",  &off_1018D3E48,  @"transition");
  }

  self->_int initModePeriod = -[CLMetricEventBins periodIndex:](self, "periodIndex:", a4);
  self->_int modeRefBin = -[CLMetricEventBins binIndex:](self, "binIndex:", a4);
  self->_BOOL modeTransitions = v6;
  self->_currentMode = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  a5);
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_1018687E8);
  }
  id v22 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v23 = -[NSString UTF8String](self->_metricId, "UTF8String");
    int modeRefBin = self->_modeRefBin;
    int initModePeriod = self->_initModePeriod;
    BOOL modeTransitions = self->_modeTransitions;
    id v27 = -[NSMutableString UTF8String](self->_currentMode, "UTF8String");
    dimensionDict = self->_dimensionDict;
    *(_DWORD *)buf = 68290819;
    int v38 = 0;
    __int16 v39 = 2082;
    int v40 = "";
    __int16 v41 = 2081;
    int v42 = v23;
    __int16 v43 = 1026;
    int v44 = initModePeriod;
    __int16 v45 = 1026;
    int v46 = modeRefBin;
    __int16 v47 = 1026;
    BOOL v48 = modeTransitions;
    __int16 v49 = 2114;
    id v50 = a3;
    __int16 v51 = 2082;
    id v52 = v27;
    __int16 v53 = 2114;
    v54 = dimensionDict;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin related modes, id:%{private, location:escape_only}s, period:%{public}d,  refbin:%{public}d, transitions:%{public}d, modes:%{public, location:escape_only}@, start:%{public, l ocation:escape_only}s, dimdict:%{public, location:escape_only}@}",  buf,  0x4Cu);
  }

- (void)fillModesUptoTime:(double)a3 atChange:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[NSMutableDictionary count](self->_modeAggregation, "count"))
  {
    if (-[CLMetricEventBins periodIndex:](self, "periodIndex:", a3) > self->_initModePeriod)
    {
      unsigned int v7 = -[CLMetricEventBins binIndex:](self, "binIndex:", a3);
      signed int v8 = v7;
      if (v4)
      {
        BOOL modeTransitions = self->_modeTransitions;
        signed int v10 = v7 - modeTransitions;
        signed int v11 = v7 + modeTransitions;
      }

      else
      {
        signed int v10 = v7 - 1;
        signed int v11 = v7;
      }

      uint64_t v14 = self;
      int v15 = v11 - self->_modeRefBin;
      v57 = v14;
      p_int binPeriod = &v14->_binPeriod;
      LODWORD(v14) = v14->_binPeriod;
      int v17 = 3 * (p_binPeriod[1] / (int)v14);
      if (v15 <= 6 * (p_binPeriod[1] / (int)v14))
      {
        if (qword_1019349A0 != -1) {
          dispatch_once(&qword_1019349A0, &stru_1018687E8);
        }
        __int128 v23 = (os_log_s *)qword_1019349A8;
        if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v24 = -[NSString UTF8String](v57->_metricId, "UTF8String");
          id v25 = -[NSMutableString UTF8String](v57->_currentMode, "UTF8String");
          unsigned int modeRefBin = v57->_modeRefBin;
          uint64_t buf = 68291075LL;
          __int16 v66 = 2082;
          v67 = "";
          __int16 v68 = 2081;
          v69 = v24;
          __int16 v70 = 2082;
          *(void *)v71 = v25;
          *(_WORD *)&v71[8] = 1026;
          *(_DWORD *)v72 = (int)a3;
          *(_WORD *)&v72[4] = 1026;
          *(_DWORD *)&v72[6] = v4;
          __int16 v73 = 1026;
          unsigned int v74 = modeRefBin;
          __int16 v75 = 1026;
          *(_DWORD *)v76 = v8;
          *(_WORD *)&v76[4] = 1026;
          *(_DWORD *)&v76[6] = v10;
          __int16 v77 = 1026;
          signed int v78 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin mode fill, id:%{private, location:escape_only}s, state:%{public, loc ation:escape_only}s, time:%{public}d, change:%{public}d, ref:%{public}d, bin:%{public}d, e nd:%{public}d, newref:%{public}d}",  (uint8_t *)&buf,  0x4Au);
        }

        obj = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        signed int v27 = v57->_modeRefBin;
        int v28 = 0;
        if (v27 <= v10)
        {
          do
          {
            id v29 = (id)-[CLMetricEventBins periodIndex:](v57, "periodIndex:", (double)(v57->_binPeriod * v27));
            if ((int)v29 > v57->_initModePeriod)
            {
              id v30 = v29;
              if (!objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v57->_modeAggregation,  "objectForKeyedSubscript:",  v57->_currentMode),  "objectForKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v29)))
              {
                objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v57->_modeAggregation,  "objectForKeyedSubscript:",  v57->_currentMode),  "setObject:forKey:",  objc_alloc_init(NSMutableSet),  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v30));
                ++v28;
              }

              objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v57->_modeAggregation,  "objectForKeyedSubscript:",  v57->_currentMode),  "objectForKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v30)),  "addObject:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v27 % v57->_nBins)));
              -[NSMutableSet addObject:]( obj,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v30));
            }

            ++v27;
          }

          while (v10 + 1 != v27);
        }

        if (v57->_modeTransitions)
        {
          p_vtable = (void **)(&OBJC_METACLASS___CLPrivacyManager + 24);
          if (v4)
          {
            id v32 = (id)-[CLMetricEventBins periodIndex:](v57, "periodIndex:", a3);
            if ((int)v32 > v57->_initModePeriod)
            {
              id v33 = v32;
              if (!objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v57->_modeAggregation,  "objectForKeyedSubscript:",  @"transition"),  "objectForKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32)))
              {
                objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v57->_modeAggregation,  "objectForKeyedSubscript:",  @"transition"),  "setObject:forKey:",  objc_alloc_init(NSMutableSet),  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v33));
                ++v28;
              }

              objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v57->_modeAggregation,  "objectForKeyedSubscript:",  @"transition"),  "objectForKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v33)),  "addObject:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v8 % v57->_nBins)));
              if (qword_1019349A0 != -1) {
                dispatch_once(&qword_1019349A0, &stru_1018687E8);
              }
              __int128 v34 = (os_log_s *)qword_1019349A8;
              if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
              {
                __int128 v35 = -[NSString UTF8String](v57->_metricId, "UTF8String");
                id v36 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v57->_modeAggregation,  "objectForKeyedSubscript:",  @"transition"),  "objectForKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v33));
                unsigned int v37 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v57->_modeAggregation,  "objectForKeyedSubscript:",  @"transition"),  "objectForKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v33)),  "count");
                unsigned int v38 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v57->_modeAggregation,  "objectForKeyedSubscript:",  @"transition"),  "count");
                uint64_t buf = 68290051LL;
                __int16 v66 = 2082;
                v67 = "";
                __int16 v68 = 2081;
                v69 = v35;
                __int16 v70 = 2114;
                *(void *)v71 = v36;
                *(_WORD *)&v71[8] = 1026;
                *(_DWORD *)v72 = v37;
                *(_WORD *)&v72[4] = 1026;
                *(_DWORD *)&v72[6] = v38;
                _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#cabin mode fill trans, id:%{private, location:escape_only}s, agg:%{p ublic, location:escape_only}@, count:%{public}d, totalbins:%{public}d}",  (uint8_t *)&buf,  0x32u);
              }

              p_vtable = (void **)(&OBJC_METACLASS___CLPrivacyManager + 24);
            }
          }
        }

        else
        {
          p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
        }

        if (v57->_modeRefBin < v11) {
          v57->_unsigned int modeRefBin = v11;
        }
        __int16 v39 = (os_log_s *)qword_1019349A8;
        if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
        {
          int v40 = -[NSString UTF8String](v57->_metricId, "UTF8String");
          int v41 = v57->_modeRefBin;
          uint64_t buf = 68290051LL;
          __int16 v66 = 2082;
          v67 = "";
          __int16 v68 = 2081;
          v69 = v40;
          __int16 v70 = 1026;
          *(_DWORD *)v71 = v41;
          *(_WORD *)&v71[4] = 1026;
          *(_DWORD *)&v71[6] = v28;
          *(_WORD *)v72 = 2114;
          *(void *)&v72[2] = obj;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin mode fill period, id:%{private, location:escape_only}s, moderef:%{pu blic}d, alloc:%{public}d, modified:%{public, location:escape_only}@}",  (uint8_t *)&buf,  0x32u);
        }

        __int128 v62 = 0u;
        __int128 v63 = 0u;
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        id v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v60,  v64,  16LL);
        if (v42)
        {
          id v44 = v42;
          uint64_t v45 = *(void *)v61;
          *(void *)&__int128 v43 = 68290563LL;
          __int128 v56 = v43;
          do
          {
            for (i = 0LL; i != v44; i = (char *)i + 1)
            {
              if (*(void *)v61 != v45) {
                objc_enumerationMutation(obj);
              }
              __int16 v47 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
              BOOL v48 = (os_log_s *)qword_1019349A8;
              if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
              {
                __int16 v49 = v57;
                v59 = -[NSString UTF8String](v57->_metricId, "UTF8String");
                id v50 = -[NSMutableString UTF8String](v57->_currentMode, "UTF8String");
                unsigned int v51 = [v47 intValue];
                uint64_t v52 = v45;
                unsigned int v53 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v49->_modeAggregation,  "objectForKeyedSubscript:",  v49->_currentMode),  "count");
                unsigned int v54 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v49->_modeAggregation,  "objectForKeyedSubscript:",  v49->_currentMode),  "objectForKeyedSubscript:",  v47),  "count");
                id v55 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v49->_modeAggregation,  "objectForKeyedSubscript:",  v49->_currentMode),  "objectForKeyedSubscript:",  v47);
                uint64_t buf = v56;
                __int16 v66 = 2082;
                v67 = "";
                __int16 v68 = 2081;
                v69 = v59;
                p_vtable = (void **)(&OBJC_METACLASS___CLPrivacyManager + 24);
                __int16 v70 = 2082;
                *(void *)v71 = v50;
                *(_WORD *)&v71[8] = 1026;
                *(_DWORD *)v72 = v51;
                *(_WORD *)&v72[4] = 1026;
                *(_DWORD *)&v72[6] = v53;
                uint64_t v45 = v52;
                __int16 v73 = 1026;
                unsigned int v74 = v54;
                __int16 v75 = 2114;
                *(void *)v76 = v55;
                _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#cabin mode fill iter, id:%{private, location:escape_only}s, state:%{ public, location:escape_only}s, period:%{public}d, totalbins:%{public}d, n:%{public}d, c atdict:%{public, location:escape_only}@}",  (uint8_t *)&buf,  0x42u);
              }
            }

            id v44 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v60,  v64,  16LL);
          }

          while (v44);
        }

        -[CLMetricEventBins removeLingeringEntriesAtPeriod:]( v57,  "removeLingeringEntriesAtPeriod:",  -[CLMetricEventBins periodIndex:](v57, "periodIndex:", a3, v56));
      }

      else
      {
        if (qword_1019349A0 != -1) {
          dispatch_once(&qword_1019349A0, &stru_1018687E8);
        }
        id v18 = (os_log_s *)qword_1019349A8;
        if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 2 * v17;
          v20 = -[NSString UTF8String](v57->_metricId, "UTF8String");
          id v21 = -[NSMutableString UTF8String](v57->_currentMode, "UTF8String");
          unsigned int v22 = v57->_modeRefBin;
          uint64_t buf = 68291587LL;
          __int16 v66 = 2082;
          v67 = "";
          __int16 v68 = 2081;
          v69 = v20;
          __int16 v70 = 2082;
          *(void *)v71 = v21;
          *(_WORD *)&v71[8] = 1026;
          *(_DWORD *)v72 = (int)a3;
          *(_WORD *)&v72[4] = 1026;
          *(_DWORD *)&v72[6] = v4;
          __int16 v73 = 1026;
          unsigned int v74 = v22;
          __int16 v75 = 1026;
          *(_DWORD *)v76 = v8;
          *(_WORD *)&v76[4] = 1026;
          *(_DWORD *)&v76[6] = v10;
          __int16 v77 = 1026;
          signed int v78 = v11;
          __int16 v79 = 1026;
          int v80 = v15;
          __int16 v81 = 1026;
          int v82 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin mode fill forceref, id:%{private, location:escape_only}s, state:%{pu blic, location:escape_only}s, time:%{public}d, change:%{public}d, ref:%{public}d, bin:%{publ ic}d, end:%{public}d, newref:%{public}d, delta:%{public}d, thresh:%{public}d}",  (uint8_t *)&buf,  0x56u);
        }

        v57->_unsigned int modeRefBin = v11;
      }

      return;
    }

    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    id v12 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026LL;
      __int16 v66 = 2082;
      v67 = "";
      id v13 = "{msg%{public}.0s:#cabin mode submit notinit}";
      goto LABEL_13;
    }
  }

  else
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    id v12 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026LL;
      __int16 v66 = 2082;
      v67 = "";
      id v13 = "{msg%{public}.0s:#cabin mode fill empty}";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&buf, 0x12u);
    }
  }

- (int)countMatchesInA:(id)a3 andB:(id)a4
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  int v7 = 0;
  uint64_t v18 = *(void *)v24;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(a3);
      }
      uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v10 = [a4 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        while (2)
        {
          for (j = 0LL; j != v11; j = (char *)j + 1)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(a4);
            }
            uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)j);
            unsigned int v15 = [v9 intValue];
            if (v15 == [v14 intValue])
            {
              ++v7;
              goto LABEL_16;
            }
          }

          id v11 = [a4 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

- (void)computeModeSubmissionForPeriod:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
  if (-[NSMutableDictionary count](self->_modeAggregation, "count"))
  {
    if (self->_initModePeriod < (int)v4)
    {
      ++self->_modeDailyCount;
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_1018687E8);
      }
      int v7 = (os_log_s *)qword_1019349A8;
      if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
      {
        signed int v8 = -[NSString UTF8String](self->_metricId, "UTF8String");
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:]( self->_aggregationDict,  "objectForKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
        int modeDailyCount = self->_modeDailyCount;
        *(_DWORD *)uint64_t buf = 68290051;
        int v60 = 0;
        __int16 v61 = 2082;
        __int128 v62 = "";
        __int16 v63 = 2081;
        v64 = v8;
        __int16 v65 = 1026;
        *(_DWORD *)__int16 v66 = v4;
        *(_WORD *)&v66[4] = 2114;
        *(void *)&v66[6] = v9;
        __int16 v67 = 1026;
        int v68 = modeDailyCount;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin mode submit, id:%{private, location:escape_only}s, period:%{public}d, aggdict:%{public, location:escape_only}@, daily:%{public}d}",  buf,  0x32u);
      }

      signed int v11 = -[CLMetricEventBins localSecondsIntoDay:]( self,  "localSecondsIntoDay:",  (double)(self->_aggregationPeriod * (int)v4));
      uint64_t aggregationPeriod = self->_aggregationPeriod;
      unint64_t v13 = (v11 / (int)aggregationPeriod);
      if (self->_isExternal)
      {
        unint64_t v13 = -[CLMetricEventBins fuzzPrivacyHours:](self, "fuzzPrivacyHours:", v13);
        __int16 v49 = -[NSString stringByAppendingString:](self->_metricId, "stringByAppendingString:", @".modes");
        int v42 = v13;
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13),  @"hour");
      }

      else
      {
        if ((_DWORD)aggregationPeriod != 3600) {
          unint64_t v13 = ((int)v4 % self->_periodsInDay);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%dx%d",  self->_metricId,  self->_binPeriod,  aggregationPeriod),  @"name");
        int v42 = v13;
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13),  @"aggPeriod");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_dimensionInt),  @"dimensionInt");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  self->_dimensionStr,  @"dimensionStr");
        __int16 v49 = @"com.apple.locationd.metricbins.modes";
      }

      id v16 = objc_msgSend( -[NSMutableDictionary allKeys](self->_modeAggregation, "allKeys"),  "sortedArrayUsingSelector:",  "compare:");
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      id obj = v16;
      id v47 = [v16 countByEnumeratingWithState:&v54 objects:v73 count:16];
      if (v47)
      {
        uint64_t v46 = *(void *)v55;
        do
        {
          for (i = 0LL; i != v47; i = (char *)i + 1)
          {
            if (*(void *)v55 != v46) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
            int v19 = -[CLMetricEventBins countMatchesInA:andB:]( self,  "countMatchesInA:andB:",  -[NSMutableDictionary objectForKeyedSubscript:]( self->_aggregationDict,  "objectForKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4)),  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_modeAggregation,  "objectForKeyedSubscript:",  v18),  "objectForKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4)));
            int v20 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_modeAggregation,  "objectForKeyedSubscript:",  v18),  "objectForKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4)),  "count");
            LODWORD(v3) = llround((double)v20 * 100.0 / (double)self->_nBins);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  v18,  @"mode");
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3),  @"modepct");
            if (v20)
            {
              LODWORD(v21) = llround((double)v19 * 100.0 / (double)v20);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v21),  @"percentage");
            }

            else
            {
              -[NSMutableDictionary removeObjectForKey:](self->_modeMetrics, "removeObjectForKey:", @"percentage");
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeDailyMatch,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_modeDailyMatch,  "objectForKeyedSubscript:",  v18),  "intValue")
              + v19),
              v18);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeDailyTotal,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_modeDailyTotal,  "objectForKeyedSubscript:",  v18),  "intValue")
              + v20),
              v18);
            objc_super v3 = (os_log_s *)qword_1019349A8;
            if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
            {
              __int128 v22 = -[NSString UTF8String](self->_metricId, "UTF8String");
              id v44 = [v18 UTF8String];
              id v45 = -[NSMutableDictionary objectForKeyedSubscript:]( self->_modeAggregation,  "objectForKeyedSubscript:",  v18);
              int v23 = v19;
              __int128 v24 = p_vtable;
              aggregationDict = self->_aggregationDict;
              __int128 v26 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4);
              signed int v27 = aggregationDict;
              p_vtable = v24;
              unsigned int v28 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v27,  "objectForKeyedSubscript:",  v26),  "count");
              *(_DWORD *)uint64_t buf = 68290819;
              int v60 = 0;
              __int16 v61 = 2082;
              __int128 v62 = "";
              __int16 v63 = 2081;
              v64 = v22;
              __int16 v65 = 2082;
              *(void *)__int16 v66 = v44;
              *(_WORD *)&v66[8] = 1026;
              *(_DWORD *)&v66[10] = v23;
              __int16 v67 = 1026;
              int v68 = v20;
              __int16 v69 = 1026;
              *(_DWORD *)__int16 v70 = v42;
              *(_WORD *)&v70[4] = 2114;
              *(void *)&v70[6] = v45;
              __int16 v71 = 1026;
              unsigned int v72 = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#cabin mode submit iter, id:%{private, location:escape_only}s, mode:%{p ublic, location:escape_only}s, match:%{public}d, count:%{public}d, local:%{public}d, modea gg:%{public, location:escape_only}@, aggcount:%{public}d}",  buf,  0x48u);
            }

            -[CLMetricEventBins submitModeMetricsForEvent:](self, "submitModeMetricsForEvent:", v49);
            objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_modeAggregation, "objectForKeyedSubscript:", v18),  "removeObjectForKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
            HIDWORD(v13) = 1079574528;
          }

          id v47 = [obj countByEnumeratingWithState:&v54 objects:v73 count:16];
        }

        while (v47);
      }

      if (self->_modeDailyCount == self->_periodsInDay)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  &off_1018D3E60,  @"hour");
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        id v29 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v29)
        {
          id v30 = v29;
          __int128 v31 = @"mode";
          uint64_t v48 = *(void *)v51;
          do
          {
            id v32 = 0LL;
            do
            {
              if (*(void *)v51 != v48) {
                objc_enumerationMutation(obj);
              }
              id v33 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v32);
              int v34 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_modeDailyMatch,  "objectForKeyedSubscript:",  v33),  "intValue");
              int v35 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_modeDailyTotal,  "objectForKeyedSubscript:",  v33),  "intValue");
              LODWORD(v13) = llround((double)v35 * 100.0 / (double)(24 * self->_nBins));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  v33,  v31);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13),  @"modepct");
              if (v35)
              {
                LODWORD(v36) = llround((double)v34 * 100.0 / (double)v35);
                -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v36),  @"percentage");
              }

              else
              {
                -[NSMutableDictionary removeObjectForKey:]( self->_modeMetrics,  "removeObjectForKey:",  @"percentage");
              }

              if (qword_1019349A0 != -1) {
                dispatch_once(&qword_1019349A0, &stru_1018687E8);
              }
              unsigned int v37 = (os_log_s *)qword_1019349A8;
              if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
              {
                unsigned int v38 = -[NSString UTF8String](self->_metricId, "UTF8String");
                __int16 v39 = v31;
                id v40 = [v33 UTF8String];
                id v41 = -[NSMutableDictionary objectForKeyedSubscript:]( self->_modeAggregation,  "objectForKeyedSubscript:",  v33);
                *(_DWORD *)uint64_t buf = 68290307;
                int v60 = 0;
                __int16 v61 = 2082;
                __int128 v62 = "";
                __int16 v63 = 2081;
                v64 = v38;
                __int16 v65 = 2082;
                *(void *)__int16 v66 = v40;
                __int128 v31 = v39;
                *(_WORD *)&v66[8] = 1026;
                *(_DWORD *)&v66[10] = v34;
                __int16 v67 = 1026;
                int v68 = v35;
                __int16 v69 = 2114;
                *(void *)__int16 v70 = v41;
                _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#cabin mode submit daily, id:%{private, location:escape_only}s, mode: %{public, location:escape_only}s, match:%{public}d, count:%{public}d, agg:%{public, locati on:escape_only}@}",  buf,  0x3Cu);
              }

              -[CLMetricEventBins submitModeMetricsForEvent:](self, "submitModeMetricsForEvent:", v49);
              unint64_t v13 = (unint64_t)&off_1018D3E48;
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeDailyMatch,  "setObject:forKeyedSubscript:",  &off_1018D3E48,  v33);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_modeDailyTotal,  "setObject:forKeyedSubscript:",  &off_1018D3E48,  v33);
              id v32 = (char *)v32 + 1;
            }

            while (v30 != v32);
            id v30 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
          }

          while (v30);
        }

        self->_int modeDailyCount = 0;
      }

      return;
    }

    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    uint64_t v14 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v60 = 0;
      __int16 v61 = 2082;
      __int128 v62 = "";
      unsigned int v15 = "{msg%{public}.0s:#cabin mode submit notinit}";
      goto LABEL_17;
    }
  }

  else
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    uint64_t v14 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v60 = 0;
      __int16 v61 = 2082;
      __int128 v62 = "";
      unsigned int v15 = "{msg%{public}.0s:#cabin mode submit empty}";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x12u);
    }
  }

- (void)updateRelatedModesTo:(id)a3 atTime:(double)a4
{
  if (-[NSMutableDictionary count](self->_modeAggregation, "count"))
  {
    uint64_t v7 = -[NSMutableString isEqualToString:](self->_currentMode, "isEqualToString:", a3) ^ 1;
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    signed int v8 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = -[NSString UTF8String](self->_metricId, "UTF8String");
      id v10 = [a3 UTF8String];
      id v11 = -[NSMutableString UTF8String](self->_currentMode, "UTF8String");
      int v13 = 68290563;
      int v14 = 0;
      __int16 v15 = 2082;
      id v16 = "";
      __int16 v17 = 2081;
      uint64_t v18 = v9;
      __int16 v19 = 2082;
      id v20 = v10;
      __int16 v21 = 1026;
      int v22 = v7;
      __int16 v23 = 2082;
      id v24 = v11;
      __int16 v25 = 1026;
      int v26 = (int)a4;
      __int16 v27 = 2113;
      unsigned int v28 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a4);
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin mode update, id:%{private, location:escape_only}s, new:%{public, locatio n:escape_only}s, changed:%{public}hhd, prior:%{public, location:escape_only}s, time:%{public}d, da te:%{private, location:escape_only}@}",  (uint8_t *)&v13,  0x46u);
    }

    -[CLMetricEventBins fillModesUptoTime:atChange:](self, "fillModesUptoTime:atChange:", v7, a4);

    self->_currentMode = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  a3);
  }

  else
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    uint64_t v12 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      id v16 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin mode update empty}",  (uint8_t *)&v13,  0x12u);
    }
  }

- (void)setIndependentMode:(id)a3 atTime:(double)a4 startingWith:(id)a5
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_1018687E8);
  }
  signed int v8 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = -[NSString UTF8String](self->_metricId, "UTF8String");
    v10[0] = 68289795;
    v10[1] = 0;
    __int16 v11 = 2082;
    uint64_t v12 = "";
    __int16 v13 = 2081;
    int v14 = v9;
    __int16 v15 = 2081;
    id v16 = [a3 UTF8String];
    __int16 v17 = 2081;
    id v18 = [a5 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin independent mode -- tbd, id:%{private, location:escape_only}s, mode:%{priv ate, location:escape_only}s, start:%{private, location:escape_only}s}",  (uint8_t *)v10,  0x30u);
  }

- (void)updateIndependentMode:(id)a3 toState:(id)a4 atTime:(double)a5
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_1018687E8);
  }
  signed int v8 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = -[NSString UTF8String](self->_metricId, "UTF8String");
    v10[0] = 68289795;
    v10[1] = 0;
    __int16 v11 = 2082;
    uint64_t v12 = "";
    __int16 v13 = 2081;
    int v14 = v9;
    __int16 v15 = 2081;
    id v16 = [a3 UTF8String];
    __int16 v17 = 2081;
    id v18 = [a4 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin independent mode update -- tbd, id:%{private, location:escape_only}s, mode :%{private, location:escape_only}s, state:%{private, location:escape_only}s}",  (uint8_t *)v10,  0x30u);
  }

- (int)periodIndex:(double)a3
{
  return (int)(a3 / (double)self->_aggregationPeriod);
}

- (int)binIndex:(double)a3
{
  return (int)(a3 / (double)self->_binPeriod);
}

- (int)localSecondsIntoDay:(double)a3
{
  objc_super v3 = -[NSCalendar components:fromDate:]( +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"),  "components:fromDate:",  224LL,  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3));
  unsigned int v4 = -[NSDateComponents hour](v3, "hour");
  unsigned int v5 = -[NSDateComponents minute](v3, "minute") + 60 * v4;
  return -[NSDateComponents second](v3, "second") + 60 * v5;
}

- (int)fuzzPrivacyHours:(int)a3
{
  int privacyHours = self->_privacyHours;
  if (privacyHours != -1) {
    return a3 / privacyHours * privacyHours;
  }
  return a3;
}

- (BOOL)createAggPeriodIfApplicable:(double)a3
{
  if (a3 == 0.0)
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    unsigned int v4 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v5 = -[NSString UTF8String](self->_metricId, "UTF8String");
      int v14 = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      __int16 v17 = "";
      __int16 v18 = 2082;
      __int16 v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#cabin error, time zero, id:%{public, location:escape_only}s}",  (uint8_t *)&v14,  0x1Cu);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_1018687E8);
      }
    }

    id v6 = (os_log_s *)qword_1019349A8;
    BOOL v7 = os_signpost_enabled((os_log_t)qword_1019349A8);
    if (v7)
    {
      signed int v8 = -[NSString UTF8String](self->_metricId, "UTF8String");
      int v14 = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      __int16 v17 = "";
      __int16 v18 = 2082;
      __int16 v19 = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#cabin error, time zero",  "{msg%{public}.0s:#cabin error, time zero, id:%{public, location:escape_only}s}",  (uint8_t *)&v14,  0x1Cu);
LABEL_10:
      LOBYTE(v7) = 0;
    }
  }

  else
  {
    uint64_t v10 = -[CLMetricEventBins periodIndex:](self, "periodIndex:");
    if (-[CLMetricEventBins periodIndex:](self, "periodIndex:", a3) == self->_initAggPeriod) {
      goto LABEL_10;
    }
    if (!-[NSMutableDictionary objectForKey:]( self->_aggregationDict,  "objectForKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10)))
    {
      -[NSMutableDictionary setObject:forKey:]( self->_aggregationDict,  "setObject:forKey:",  objc_alloc_init(&OBJC_CLASS___NSMutableSet),  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_1018687E8);
      }
      __int16 v11 = (os_log_s *)qword_1019349A8;
      if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = -[NSString UTF8String](self->_metricId, "UTF8String");
        int v14 = 68289539;
        int v15 = 0;
        __int16 v16 = 2082;
        __int16 v17 = "";
        __int16 v18 = 2081;
        __int16 v19 = v12;
        __int16 v20 = 1026;
        int v21 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin new period, id:%{private, location:escape_only}s, period:%{public}d}",  (uint8_t *)&v14,  0x22u);
      }
    }

    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)computePercentageAndSubmit:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  if (self->_isExternal) {
    id v6 = -[NSString stringByAppendingString:](self->_metricId, "stringByAppendingString:", @".percentages");
  }
  else {
    id v6 = @"com.apple.locationd.metricbins";
  }
  int v7 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_aggregationDict,  "objectForKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4)),  "count");
  LODWORD(v3) = llround((double)v7 * 100.0 / (double)self->_nBins);
  p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
  if ((int)v3 >= 101)
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    id v9 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289538;
      int v39 = 0;
      __int16 v40 = 2082;
      id v41 = "";
      __int16 v42 = 2082;
      id v43 = -[__CFString UTF8String](v6, "UTF8String");
      __int16 v44 = 1026;
      int v45 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#cabin error, percentage, event:%{public, location:escape_only}s, pct:%{public}d}",  buf,  0x22u);
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_1018687E8);
      }
    }

    uint64_t v10 = (os_log_s *)qword_1019349A8;
    if (os_signpost_enabled((os_log_t)qword_1019349A8))
    {
      id v11 = -[__CFString UTF8String](v6, "UTF8String");
      *(_DWORD *)uint64_t buf = 68289538;
      int v39 = 0;
      __int16 v40 = 2082;
      id v41 = "";
      __int16 v42 = 2082;
      id v43 = v11;
      __int16 v44 = 1026;
      int v45 = v3;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#cabin error, percentage",  "{msg%{public}.0s:#cabin error, percentage, event:%{public, location:escape_only}s, pct:%{public}d}",  buf,  0x22u);
    }

    uint64_t v3 = 100LL;
  }

  *(int32x2_t *)&self->_int dailyTotal = vadd_s32( *(int32x2_t *)&self->_dailyTotal,  (int32x2_t)(v7 | 0x100000000LL));
  signed int v12 = -[CLMetricEventBins localSecondsIntoDay:]( self,  "localSecondsIntoDay:",  (double)(self->_aggregationPeriod * (int)v4));
  int aggregationPeriod = self->_aggregationPeriod;
  uint64_t v14 = (v12 / aggregationPeriod);
  if (self->_isExternal)
  {
    uint64_t v14 = -[CLMetricEventBins fuzzPrivacyHours:](self, "fuzzPrivacyHours:", v14);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_percentMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3),  @"percentage");
    dimensionStr = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14);
    percentMetrics = self->_percentMetrics;
    __int16 v17 = @"hour";
  }

  else
  {
    if (aggregationPeriod != 3600) {
      uint64_t v14 = ((int)v4 % self->_periodsInDay);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_percentMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3),  @"percentage");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_percentMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14),  @"aggPeriod");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_percentMetrics,  "setObject:forKeyedSubscript:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%dx%d",  self->_metricId,  self->_binPeriod,  self->_aggregationPeriod),  @"name");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_percentMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_dimensionInt),  @"dimensionInt");
    dimensionStr = (NSNumber *)self->_dimensionStr;
    percentMetrics = self->_percentMetrics;
    __int16 v17 = @"dimensionStr";
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](percentMetrics, "setObject:forKeyedSubscript:", dimensionStr, v17);
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_1018687E8);
  }
  __int16 v18 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = -[__CFString UTF8String](v6, "UTF8String");
    BOOL submitMetrics = self->_submitMetrics;
    int dailyTotal = self->_dailyTotal;
    int dailyCount = self->_dailyCount;
    int periodsInDay = self->_periodsInDay;
    unsigned int v19 = objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_aggregationDict,  "objectForKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4)),  "count");
    p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
    __int16 v20 = v6;
    aggregationDict = self->_aggregationDict;
    int v22 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4);
    __int16 v23 = aggregationDict;
    id v6 = v20;
    id v24 = -[NSMutableDictionary objectForKey:](v23, "objectForKey:", v22);
    *(_DWORD *)uint64_t buf = 68291331;
    __int16 v40 = 2082;
    int v39 = 0;
    id v41 = "";
    __int16 v42 = 2081;
    id v43 = v33;
    __int16 v44 = 1026;
    int v45 = submitMetrics;
    __int16 v46 = 1026;
    int v47 = v4;
    __int16 v48 = 1026;
    *(_DWORD *)__int16 v49 = v14;
    *(_WORD *)&v49[4] = 1026;
    *(_DWORD *)&v49[6] = dailyTotal;
    __int16 v50 = 1026;
    int v51 = dailyCount;
    __int16 v52 = 1026;
    int v53 = periodsInDay;
    __int16 v54 = 1025;
    unsigned int v55 = v19;
    __int16 v56 = 2113;
    id v57 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin submit, event:%{private, location:escape_only}s, submit:%{public}d, peri od:%{public}d, local:%{public}d, dailytotal:%{public}d, dailycount:%{public}d, periods:%{public} d, n:%{private}d, aggbin:%{private, location:escape_only}@}",  buf,  0x50u);
  }

  -[CLMetricEventBins submitPercentageMetricsForEvent:](self, "submitPercentageMetricsForEvent:", v6);
  int v25 = self->_dailyCount;
  if (v25 == self->_periodsInDay)
  {
    LODWORD(p_vtable) = llround((double)self->_dailyTotal * 100.0 / (double)(self->_nBins * v25));
    BOOL isExternal = self->_isExternal;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_percentMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", p_vtable),  @"percentage");
    __int16 v27 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_periodsInDay);
    if (isExternal) {
      unsigned int v28 = @"hour";
    }
    else {
      unsigned int v28 = @"aggPeriod";
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_percentMetrics, "setObject:forKeyedSubscript:", v27, v28);
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    id v29 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = -[__CFString UTF8String](v6, "UTF8String");
      int v31 = self->_dailyTotal;
      id v32 = self->_percentMetrics;
      *(_DWORD *)uint64_t buf = 68290051;
      int v39 = 0;
      __int16 v40 = 2082;
      id v41 = "";
      __int16 v42 = 2081;
      id v43 = v30;
      __int16 v44 = 1026;
      int v45 = (int)p_vtable;
      __int16 v46 = 1026;
      int v47 = v31;
      __int16 v48 = 2113;
      *(void *)__int16 v49 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin submit daily, event:%{private, location:escape_only}s, dailypct:%{public }d, dailytotal:%{public}d, ca:%{private, location:escape_only}@}",  buf,  0x32u);
    }

    -[CLMetricEventBins submitPercentageMetricsForEvent:](self, "submitPercentageMetricsForEvent:", v6);
    self->_int dailyTotal = 0;
    self->_int dailyCount = 0;
  }

- (void)computeIntervalDistributionsForPeriod:(int)a3
{
  id v5 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_aggregationDict,  "objectForKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:")),  "allObjects"),  "sortedArrayUsingSelector:",  "compare:");
  int nBins = self->_nBins;
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_1018687E8);
  }
  int v7 = nBins * a3;
  signed int v8 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = -[NSString UTF8String](self->_metricId, "UTF8String");
    intervalDistributions = self->_intervalDistributions;
    int priorDistributionBin = self->_priorDistributionBin;
    uint64_t buf = 68290562LL;
    __int16 v61 = 2082;
    __int128 v62 = "";
    __int16 v63 = 2082;
    v64 = v9;
    __int16 v65 = 1026;
    *(_DWORD *)__int16 v66 = a3;
    *(_WORD *)&v66[4] = 2114;
    *(void *)&v66[6] = intervalDistributions;
    __int16 v67 = 1026;
    *(_DWORD *)int v68 = priorDistributionBin;
    *(_WORD *)&v68[4] = 1026;
    *(_DWORD *)&v68[6] = v7;
    __int16 v69 = 2114;
    id v70 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin intdist, id:%{public, location:escape_only}s, period:%{public}d, buckets :%{public, location:escape_only}@, priorBin:%{public}d, binstart:%{public}d, arr:%{public, location:escape_only}@}",  (uint8_t *)&buf,  0x42u);
  }

  if ([v5 count])
  {
    if (self->_isExternal)
    {
      id v43 = -[NSString stringByAppendingString:](self->_metricId, "stringByAppendingString:", @".intervals");
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_intervalMetrics,  "setObject:forKeyedSubscript:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%dx%d",  self->_metricId,  self->_binPeriod,  self->_aggregationPeriod),  @"name");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_intervalMetrics,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_dimensionInt),  @"dimensionInt");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_intervalMetrics,  "setObject:forKeyedSubscript:",  self->_dimensionStr,  @"dimensionStr");
      id v43 = @"com.apple.locationd.metricbins.intervals";
    }

    signed int v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int16 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id v14 = [v5 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v54 != v16) {
            objc_enumerationMutation(v5);
          }
          int v18 = [*(id *)(*((void *)&v53 + 1) + 8 * (void)i) intValue] + v7;
          int v19 = self->_priorDistributionBin;
          if (v19 != -1)
          {
            uint64_t v20 = (v18 - v19);
            if (v18 - v19 < 0) {
              uint64_t v20 = (v20 + self->_nBins * self->_periodsInDay);
            }
            -[NSMutableArray addObject:]( v13,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
          }

          self->_int priorDistributionBin = v18;
        }

        id v15 = [v5 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }

      while (v15);
    }

    -[NSMutableArray setArray:]( v13,  "setArray:",  -[NSMutableArray sortedArrayUsingSelector:](v13, "sortedArrayUsingSelector:", "compare:"));
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id obj = self->_intervalDistributions;
    int v21 = &OBJC_INSTANCE_METHODS_TRANSITPbTransitMacTile;
    id v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v49,  v58,  16LL);
    if (v44)
    {
      __int16 v40 = v12;
      LODWORD(v22) = 0;
      uint64_t v42 = *(void *)v50;
      do
      {
        __int16 v23 = 0LL;
        uint64_t v22 = (int)v22;
        do
        {
          if (*(void *)v50 != v42) {
            objc_enumerationMutation(obj);
          }
          int v24 = [*(id *)(*((void *)&v49 + 1) + 8 * (void)v23) intValue];
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v45,  v57,  16LL);
          if (v25)
          {
            id v26 = v25;
            int v27 = 0;
            uint64_t v28 = *(void *)v46;
            while (2)
            {
              id v29 = 0LL;
              uint64_t v30 = (v27 + (_DWORD)v26);
              do
              {
                if (*(void *)v46 != v28) {
                  objc_enumerationMutation(v13);
                }
                if ((int)[*(id *)(*((void *)&v45 + 1) + 8 * (void)v29) intValue] >= v24)
                {
                  uint64_t v30 = (v27 + (_DWORD)v29);
                  goto LABEL_36;
                }

                id v29 = (char *)v29 + 1;
              }

              while (v26 != v29);
              id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v45,  v57,  16LL);
              int v27 = v30;
              if (v26) {
                continue;
              }
              break;
            }
          }

          else
          {
            uint64_t v30 = 0LL;
          }

- (void)processEventTime:(double)a3
{
  uint64_t v4 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3);
  -[CLMetricEventBins processEventTimes:]( self,  "processEventTimes:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL));
}

- (void)processEventTimeRangeFrom:(double)a3 to:(double)a4
{
  int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v8 = (double)(int)a3;
  if (v8 < a4)
  {
    uint64_t v9 = (int)a3;
    do
    {
      -[NSMutableArray addObject:]( v7,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9, v8));
      uint64_t v9 = (self->_binPeriod + v9);
      double v8 = (double)(int)v9;
    }

    while ((double)(int)v9 < a4);
  }

  -[NSMutableArray addObject:]( v7,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_1018687E8);
  }
  uint64_t v10 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
  {
    id v11 = -[NSString UTF8String](self->_metricId, "UTF8String");
    v12[0] = 68290051;
    __int16 v13 = 2082;
    v12[1] = 0;
    id v14 = "";
    __int16 v15 = 2081;
    uint64_t v16 = v11;
    __int16 v17 = 1026;
    int v18 = (int)a3;
    __int16 v19 = 1026;
    int v20 = (int)a4;
    __int16 v21 = 1026;
    unsigned int v22 = -[NSMutableArray count](v7, "count");
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#cabin event range -- tbd, id:%{private, location:escape_only}s, start:%{public}d , end:%{public}d, count:%{public}d}",  (uint8_t *)v12,  0x2Eu);
  }

  -[CLMetricEventBins processEventTimes:](self, "processEventTimes:", v7);
}

- (void)processEventTimes:(id)a3
{
  id v5 = -[NSArray sortedArrayUsingSelector:]( -[NSSet allObjects](+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:"), "allObjects"),  "sortedArrayUsingSelector:",  "compare:");
  id obj = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v41,  v60,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = (double)(int)[*(id *)(*((void *)&v41 + 1) + 8 * (void)i) intValue];
        uint64_t v3 = -[CLMetricEventBins periodIndex:](self, "periodIndex:", v10);
        int v11 = -[CLMetricEventBins binIndex:](self, "binIndex:", v10);
        if (-[CLMetricEventBins createAggPeriodIfApplicable:](self, "createAggPeriodIfApplicable:", v10))
        {
          objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_aggregationDict,  "objectForKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3)),  "addObject:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v11 % self->_nBins)));
          -[NSMutableSet addObject:]( obj,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
        }

        else
        {
          self->_int priorDistributionBin = v11;
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v41,  v60,  16LL);
    }

    while (v7);
  }

  int v35 = self;
  unsigned int v32 = v3;
  uint64_t v33 = v5;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v59,  16LL);
  p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
  id v14 = &OBJC_METACLASS___CLPrivacyManager.vtable;
  if (v12)
  {
    id v15 = v12;
    uint64_t v16 = *(void *)v38;
    uint64_t v34 = *(void *)v38;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(obj);
        }
        int v18 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)j);
        __int16 v19 = (os_log_s *)v14[309];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          int v20 = p_vtable;
          __int16 v21 = -[NSString UTF8String](v35->_metricId, "UTF8String");
          unsigned int v22 = v14;
          unsigned int v23 = [v18 intValue];
          unsigned int v24 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v35->_aggregationDict,  "objectForKeyedSubscript:",  v18),  "count");
          id v25 = -[NSMutableDictionary objectForKeyedSubscript:](v35->_aggregationDict, "objectForKeyedSubscript:", v18);
          *(_DWORD *)uint64_t buf = 68290051;
          int v46 = 0;
          __int16 v47 = 2082;
          __int128 v48 = "";
          __int16 v49 = 2081;
          __int128 v50 = v21;
          p_vtable = v20;
          uint64_t v16 = v34;
          __int16 v51 = 1026;
          unsigned int v52 = v23;
          id v14 = v22;
          __int16 v53 = 1026;
          unsigned int v54 = v24;
          __int16 v55 = 2114;
          *(void *)__int128 v56 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#cabin iter, id:%{private, location:escape_only}s, period:%{public}d, n :%{public}d, aggdict:%{public, location:escape_only}@}",  buf,  0x32u);
        }
      }

      id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v59,  16LL);
    }

    while (v15);
  }

  id v26 = (os_log_s *)v14[309];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    int v27 = -[NSString UTF8String](v35->_metricId, "UTF8String");
    unsigned int v28 = [a3 count];
    unsigned int v29 = -[NSArray count](v33, "count");
    int submissionRefPeriod = v35->_submissionRefPeriod;
    *(_DWORD *)uint64_t buf = 68290563;
    int v46 = 0;
    __int16 v47 = 2082;
    __int128 v48 = "";
    __int16 v49 = 2081;
    __int128 v50 = v27;
    __int16 v51 = 1026;
    unsigned int v52 = v28;
    __int16 v53 = 1026;
    unsigned int v54 = v29;
    __int16 v55 = 1026;
    *(_DWORD *)__int128 v56 = submissionRefPeriod;
    *(_WORD *)&v56[4] = 2114;
    *(void *)&v56[6] = v33;
    __int16 v57 = 2114;
    v58 = obj;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#cabin events, id:%{private, location:escape_only}s, events:%{public}d, proc: %{public}d, subref:%{public}d, times:%{public, location:escape_only}@, modified:%{public, location:escape_only}@}",  buf,  0x42u);
  }

  -[CLMetricEventBins checkSubmissionAtPeriod:](v35, "checkSubmissionAtPeriod:", v32);
}

- (void)checkSubmissionAtPeriod:(int)a3
{
  int v5 = a3 - 2;
  uint64_t submissionRefPeriod = self->_submissionRefPeriod;
  if ((int)submissionRefPeriod < a3 - 2)
  {
    *(void *)&__int128 v3 = 68290051LL;
    __int128 v13 = v3;
    do
    {
      self->_uint64_t submissionRefPeriod = submissionRefPeriod + 1;
      int aggregationPeriod = self->_aggregationPeriod;
      if (qword_1019349A0 != -1) {
        dispatch_once(&qword_1019349A0, &stru_1018687E8);
      }
      int v9 = aggregationPeriod * (submissionRefPeriod + 2);
      double v10 = (os_log_s *)qword_1019349A8;
      if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = -[NSString UTF8String](self->_metricId, "UTF8String");
        int v12 = self->_submissionRefPeriod;
        *(_DWORD *)uint64_t buf = v13;
        int v15 = 0;
        __int16 v16 = 2082;
        __int16 v17 = "";
        __int16 v18 = 2081;
        __int16 v19 = v11;
        __int16 v20 = 1026;
        int v21 = a3;
        __int16 v22 = 1026;
        int v23 = v12;
        __int16 v24 = 1026;
        int v25 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin closing, id:%{private, location:escape_only}s, period:%{public}d, su bref:%{public}d, filltime:%{public}d}",  buf,  0x2Eu);
      }

      -[CLMetricEventBins computePercentageAndSubmit:]( self,  "computePercentageAndSubmit:",  self->_submissionRefPeriod,  v13);
      if (-[NSMutableArray count](self->_intervalDistributions, "count")) {
        -[CLMetricEventBins computeIntervalDistributionsForPeriod:]( self,  "computeIntervalDistributionsForPeriod:",  self->_submissionRefPeriod);
      }
      if (-[NSMutableDictionary count](self->_modeAggregation, "count"))
      {
        -[CLMetricEventBins fillModesUptoTime:atChange:](self, "fillModesUptoTime:atChange:", 0LL, (double)v9);
        -[CLMetricEventBins computeModeSubmissionForPeriod:]( self,  "computeModeSubmissionForPeriod:",  self->_submissionRefPeriod);
      }

      -[NSMutableDictionary removeObjectForKey:]( self->_aggregationDict,  "removeObjectForKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_submissionRefPeriod));
      uint64_t submissionRefPeriod = self->_submissionRefPeriod;
    }

    while ((int)submissionRefPeriod < v5);
  }

  -[CLMetricEventBins removeLingeringEntriesAtPeriod:](self, "removeLingeringEntriesAtPeriod:", submissionRefPeriod);
}

- (void)removeLingeringEntriesAtPeriod:(int)a3
{
  int v4 = a3 - 6;
  id v5 = -[NSMutableDictionary allKeys](self->_aggregationDict, "allKeys");
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v53 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        if ((int)[v11 intValue] < v4)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_aggregationDict, "removeObjectForKey:", v11);
          ++v8;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v35 objects:v53 count:16];
    }

    while (v7);
  }

  else
  {
    int v8 = 0;
  }

  int v23 = v8;
  if (-[NSMutableDictionary count](self->_modeAggregation, "count")
    && (__int128 v33 = 0u,
        __int128 v34 = 0u,
        __int128 v31 = 0u,
        __int128 v32 = 0u,
        id obj = self->_modeAggregation,
        (id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v52,  16LL)) != 0LL))
  {
    int v12 = 0;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)j);
        id v15 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_modeAggregation, "objectForKeyedSubscript:", v14),  "allKeys");
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        id v16 = [v15 countByEnumeratingWithState:&v27 objects:v51 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v28;
          do
          {
            for (k = 0LL; k != v17; k = (char *)k + 1)
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v15);
              }
              __int16 v20 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)k);
              if ((int)[v20 intValue] < v4)
              {
                objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_modeAggregation,  "objectForKeyedSubscript:",  v14),  "removeObjectForKey:",  v20);
                ++v12;
              }
            }

            id v17 = [v15 countByEnumeratingWithState:&v27 objects:v51 count:16];
          }

          while (v17);
        }
      }

      id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v52,  16LL);
    }

    while (v26);
  }

  else
  {
    int v12 = 0;
  }

  if (v12 + v23 >= 1)
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    int v21 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = -[NSString UTF8String](self->_metricId, "UTF8String");
      *(_DWORD *)uint64_t buf = 68290051;
      __int16 v41 = 2082;
      int v40 = 0;
      __int128 v42 = "";
      __int16 v43 = 2081;
      __int128 v44 = v22;
      __int16 v45 = 1026;
      int v46 = v4;
      __int16 v47 = 1026;
      int v48 = v23;
      __int16 v49 = 1026;
      int v50 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin lingered, id:%{private, location:escape_only}s, period:%{public}d, agg :%{public}d, mode:%{public}d}",  buf,  0x2Eu);
    }
  }

- (void)updateToCurrentTime:(double)a3
{
  uint64_t v5 = -[CLMetricEventBins periodIndex:](self, "periodIndex:");
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_1018687E8);
  }
  id v6 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEBUG))
  {
    id v7 = -[NSString UTF8String](self->_metricId, "UTF8String");
    int submissionRefPeriod = self->_submissionRefPeriod;
    v9[0] = 68290051;
    __int16 v10 = 2082;
    v9[1] = 0;
    int v11 = "";
    __int16 v12 = 2081;
    __int128 v13 = v7;
    __int16 v14 = 1026;
    int v15 = (int)a3;
    __int16 v16 = 1026;
    int v17 = v5;
    __int16 v18 = 1026;
    int v19 = submissionRefPeriod;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#cabin uptick, id:%{private, location:escape_only}s, time:%{public}d, period: %{public}d, subref:%{public}d}",  (uint8_t *)v9,  0x2Eu);
  }

  -[CLMetricEventBins checkSubmissionAtPeriod:](self, "checkSubmissionAtPeriod:", v5);
}

- (void)submitPercentageMetricsForEvent:(id)a3
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_1018687E8);
  }
  uint64_t v5 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [a3 UTF8String];
    BOOL submitMetrics = self->_submitMetrics;
    percentMetrics = self->_percentMetrics;
    *(_DWORD *)uint64_t buf = 68289795;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2081;
    id v16 = v7;
    __int16 v17 = 1025;
    BOOL v18 = submitMetrics;
    __int16 v19 = 2113;
    __int16 v20 = percentMetrics;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin percentage submission, event:%{private, location:escape_only}s, submit:%{p rivate}hhd, dict:%{private, location:escape_only}@}",  buf,  0x2Cu);
  }

  if (self->_submitMetrics)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    _DWORD v10[2] = sub_100A3DD88;
    v10[3] = &unk_1018486D8;
    v10[4] = self;
    *(void *)&double v6 = AnalyticsSendEventLazy(a3, v10).n128_u64[0];
  }

  -[NSMutableArray addObject:]( self->_testSubmissions,  "addObject:",  -[NSMutableDictionary mutableCopy](self->_percentMetrics, "mutableCopy", v6));
}

- (void)submitIntervalMetricsForEvent:(id)a3
{
  if (objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_intervalMetrics,  "objectForKeyedSubscript:",  @"total"),  "intValue"))
  {
    if (qword_1019349A0 != -1) {
      dispatch_once(&qword_1019349A0, &stru_1018687E8);
    }
    uint64_t v5 = (os_log_s *)qword_1019349A8;
    if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [a3 UTF8String];
      BOOL submitMetrics = self->_submitMetrics;
      intervalMetrics = self->_intervalMetrics;
      *(_DWORD *)uint64_t buf = 68289795;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2081;
      id v16 = v7;
      __int16 v17 = 1025;
      BOOL v18 = submitMetrics;
      __int16 v19 = 2113;
      __int16 v20 = intervalMetrics;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin interval submission, event:%{private, location:escape_only}s, submit:%{p rivate}hhd, dict:%{private, location:escape_only}@}",  buf,  0x2Cu);
    }

    if (self->_submitMetrics)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      _DWORD v10[2] = sub_100A3DF24;
      v10[3] = &unk_1018486D8;
      v10[4] = self;
      *(void *)&double v6 = AnalyticsSendEventLazy(a3, v10).n128_u64[0];
    }

    -[NSMutableArray addObject:]( self->_testSubmissions,  "addObject:",  -[NSMutableDictionary mutableCopy](self->_intervalMetrics, "mutableCopy", v6));
  }

- (void)submitModeMetricsForEvent:(id)a3
{
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_1018687E8);
  }
  uint64_t v5 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [a3 UTF8String];
    BOOL submitMetrics = self->_submitMetrics;
    modeMetrics = self->_modeMetrics;
    *(_DWORD *)uint64_t buf = 68289795;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2081;
    id v16 = v7;
    __int16 v17 = 1025;
    BOOL v18 = submitMetrics;
    __int16 v19 = 2113;
    __int16 v20 = modeMetrics;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin mode submission, event:%{private, location:escape_only}s, submit:%{private }hhd, dict:%{private, location:escape_only}@}",  buf,  0x2Cu);
  }

  if (self->_submitMetrics)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    _DWORD v10[2] = sub_100A3E0A4;
    v10[3] = &unk_1018486D8;
    v10[4] = self;
    *(void *)&double v6 = AnalyticsSendEventLazy(a3, v10).n128_u64[0];
  }

  -[NSMutableArray addObject:]( self->_testSubmissions,  "addObject:",  -[NSMutableDictionary mutableCopy](self->_modeMetrics, "mutableCopy", v6));
}

- (void)reset:(double)a3
{
  self->_int initAggPeriod = -[CLMetricEventBins periodIndex:](self, "periodIndex:");
  int v5 = -[CLMetricEventBins binIndex:](self, "binIndex:", a3);
  int initAggPeriod = self->_initAggPeriod;
  self->_int initAggBin = v5;
  self->_int submissionRefPeriod = initAggPeriod;
  if (qword_1019349A0 != -1) {
    dispatch_once(&qword_1019349A0, &stru_1018687E8);
  }
  id v7 = (os_log_s *)qword_1019349A8;
  if (os_log_type_enabled((os_log_t)qword_1019349A8, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = -[NSString UTF8String](self->_metricId, "UTF8String");
    int v9 = self->_initAggPeriod;
    int initAggBin = self->_initAggBin;
    uint64_t buf = 68290050LL;
    __int16 v23 = 2082;
    __int16 v24 = "";
    __int16 v25 = 2082;
    id v26 = v8;
    __int16 v27 = 1026;
    int v28 = (int)a3;
    __int16 v29 = 1026;
    int v30 = v9;
    __int16 v31 = 1026;
    int v32 = initAggBin;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#cabin reset, id:%{public, location:escape_only}s, now:%{public}d, period:%{p ublic}d, bin:%{public}d}",  (uint8_t *)&buf,  0x2Eu);
  }

  self->_int dailyTotal = 0;
  self->_int dailyCount = 0;
  -[NSMutableDictionary removeAllObjects](self->_aggregationDict, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_intervalDistributions, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_intervalDistributionStrings, "removeAllObjects");
  self->_int priorDistributionBin = -1;
  if (self->_initModePeriod != -1)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    modeAggregation = self->_modeAggregation;
    id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modeAggregation,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(modeAggregation);
          }
          uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
          objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_modeAggregation, "objectForKeyedSubscript:", v16),  "removeAllObjects");
          objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_modeDailyMatch, "objectForKeyedSubscript:", v16),  "removeAllObjects");
          objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_modeDailyTotal, "objectForKeyedSubscript:", v16),  "removeAllObjects");
        }

        id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modeAggregation,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v13);
    }

    *(int32x2_t *)&self->_unsigned int modeRefBin = vrev64_s32(*(int32x2_t *)&self->_initAggPeriod);
    self->_int modeDailyCount = 0;
  }

  self->_dimensionInt = -1;
  self->_dimensionStr = (NSString *)&stru_1018A4B00;
}

- (int)dimensionInt
{
  return self->_dimensionInt;
}

- (void)setDimensionInt:(int)a3
{
  self->_dimensionInt = a3;
}

- (NSString)dimensionStr
{
  return self->_dimensionStr;
}

- (void)setDimensionStr:(id)a3
{
  self->_dimensionStr = (NSString *)a3;
}

- (id)testGetSubmissions
{
  return self->_testSubmissions;
}

- (void)testClearSubmissions
{
}

- (int)testGetDistributionBinAnchor
{
  return self->_priorDistributionBin;
}

- (int)testGetDailyCount
{
  return self->_dailyCount;
}

- (int)testGetDailyTotal
{
  return self->_dailyTotal;
}

- (int)testGetCountForMode:(id)a3 andPeriod:(int)a4
{
  return objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_modeAggregation,  "objectForKeyedSubscript:",  a3),  "objectForKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(void *)&a4)),  "count");
}

- (int)testModeCountAtPeriod:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  modeAggregation = self->_modeAggregation;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modeAggregation,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  int v8 = 0;
  uint64_t v9 = *(void *)v13;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(modeAggregation);
      }
      if (objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_modeAggregation,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v12 + 1) + 8 * (void)i)),  "objectForKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3)))
      {
        ++v8;
      }
    }

    id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( modeAggregation,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  }

  while (v7);
  return v8;
}

- (id)testGetCurrentMode
{
  return self->_currentMode;
}

- (int)testGetModeReferenceBin
{
  return self->_modeRefBin;
}

- (void)testSkipSumbission
{
  self->_BOOL submitMetrics = 0;
}

@end