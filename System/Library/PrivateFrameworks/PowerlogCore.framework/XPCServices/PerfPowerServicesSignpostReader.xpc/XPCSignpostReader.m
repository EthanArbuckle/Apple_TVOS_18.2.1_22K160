@interface XPCSignpostReader
- (BOOL)createTagFile:(id)a3 withTagConfig:(id)a4 withFileCount:(int)a5;
- (BOOL)isiPad;
- (BOOL)uploadFile:(id)a3 withTagConfig:(id)a4;
- (NSMutableArray)launchTimeSeries;
- (NSMutableDictionary)activations;
- (NSMutableDictionary)extendedLaunches;
- (NSMutableDictionary)glitches;
- (NSMutableDictionary)hangs;
- (NSMutableDictionary)launches;
- (NSMutableDictionary)numAppSignposts;
- (NSMutableDictionary)processExits;
- (NSMutableDictionary)resumes;
- (NSMutableDictionary)summarizedSignpostDurations;
- (NSMutableDictionary)summarizedSignpostEvents;
- (NSMutableDictionary)summarizedSignpostMetrics;
- (OS_dispatch_queue)sigterm_queue;
- (OS_dispatch_source)sigterm_source;
- (XPCSignpostReader)init;
- (id)createSignpostFile:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5 withallowlist:(id)a6 withTagConfig:(id)a7;
- (id)getBundleIDFromEvent:(id)a3;
- (id)getBundleIDFromInterval:(id)a3;
- (id)getScrollDirectionForSignpostInterval:(id)a3;
- (id)gzipDeflate:(id)a3;
- (id)mxSignpostIntervalDataForTasking:(id)a3;
- (id)packageMXSignpostData;
- (id)processSignpostMetricsWithStartDate:(id)a3 withEndDate:(id)a4 processMXSignpost:(BOOL)a5;
- (id)signpostIntervalData:(id)a3 forTaskingConfig:(id)a4;
- (id)signpostIntervalData:(id)a3 withBundleID:(id)a4;
- (id)subsystemCategoryAllowlist:(id)a3;
- (int)writeSignpostFile:(id)a3 withOrder:(int)a4 withData:(id)a5;
- (void)initializeMetrics;
- (void)logAggdTelemetry;
- (void)processSignpostAnimationInterval:(id)a3;
- (void)processSignpostEvent:(id)a3;
- (void)processSignpostInterval:(id)a3;
- (void)removeFile:(id)a3;
- (void)setActivations:(id)a3;
- (void)setExtendedLaunches:(id)a3;
- (void)setGlitches:(id)a3;
- (void)setHangs:(id)a3;
- (void)setLaunchTimeSeries:(id)a3;
- (void)setLaunches:(id)a3;
- (void)setNumAppSignposts:(id)a3;
- (void)setProcessExits:(id)a3;
- (void)setResumes:(id)a3;
- (void)setSigterm_queue:(id)a3;
- (void)setSigterm_source:(id)a3;
- (void)setSummarizedSignpostDurations:(id)a3;
- (void)setSummarizedSignpostEvents:(id)a3;
- (void)setSummarizedSignpostMetrics:(id)a3;
- (void)submitSignpostDataWithConfig:(id)a3 withReply:(id)a4;
- (void)updateActivationsForProcess:(id)a3 withInterval:(id)a4;
- (void)updateExtendedLaunchesForProcess:(id)a3 withInterval:(id)a4;
- (void)updateGlitchesForProcess:(id)a3 withAnimationInterval:(id)a4;
- (void)updateHangsForProcess:(id)a3 withInterval:(id)a4;
- (void)updateLaunchesForProcess:(id)a3 withInterval:(id)a4;
- (void)updateMXSignpostEventsForProcess:(id)a3 withEvent:(id)a4;
- (void)updateMXSignpostsForProcess:(id)a3 withInterval:(id)a4;
- (void)updateProcessExitsForProcess:(id)a3 withEvent:(id)a4;
- (void)updateResumesForProcess:(id)a3 withInterval:(id)a4;
- (void)updateTimeSeriesLaunches:(id)a3 withBundleID:(id)a4;
@end

@implementation XPCSignpostReader

- (XPCSignpostReader)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___XPCSignpostReader;
  v2 = -[XPCSignpostReader init](&v10, "init");
  if (v2)
  {
    signal(15, (void (__cdecl *)(int))1);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    -[XPCSignpostReader setSigterm_queue:](v2, "setSigterm_queue:", v4);

    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[XPCSignpostReader sigterm_queue](v2, "sigterm_queue"));
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v5);
    -[XPCSignpostReader setSigterm_source:](v2, "setSigterm_source:", v6);

    v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[XPCSignpostReader sigterm_source](v2, "sigterm_source"));
    dispatch_source_set_event_handler(v7, &stru_100010390);

    v8 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[XPCSignpostReader sigterm_source](v2, "sigterm_source"));
    dispatch_activate(v8);
  }

  return v2;
}

- (void)updateProcessExitsForProcess:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PLLogSignpostReader();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10000AA0C();
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v7 string1Value]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 number1Value]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 number2Value]);

  if (v10 && v11 && v12)
  {
    v30 = v10;
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 isEqualToString:@"YES"]));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_processExits, "objectForKeyedSubscript:", v6));

    if (!v14)
    {
      processExits = self->_processExits;
      v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](processExits, "setObject:forKey:", v16, v6);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_processExits, "objectForKeyedSubscript:", v6));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v13]);

    if (!v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_processExits,  "objectForKeyedSubscript:",  v6));
      v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      [v19 setObject:v20 forKey:v13];
    }

    v31[0] = v11;
    v31[1] = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_processExits, "objectForKeyedSubscript:", v6));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v13]);
    v29 = v11;
    v24 = (void *)v13;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v21]);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v25 unsignedIntegerValue] + 1));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_processExits, "objectForKeyedSubscript:", v6));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v24]);
    [v28 setObject:v26 forKeyedSubscript:v21];

    v11 = v29;
    objc_super v10 = v30;
  }
}

- (void)updateLaunchesForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PLLogSignpostReader();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10000AA6C(v7);
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v7 number1Value]);
  if (v10)
  {
    [v7 durationSeconds];
    unint64_t v12 = (unint64_t)(float)(v11 * 1000.0);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_launches, "objectForKeyedSubscript:", v6));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_launches, "objectForKeyedSubscript:", v6));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v10]);

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_launches, "objectForKeyedSubscript:", v6));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v10]);
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v12));
        [v18 addObject:v19];

LABEL_11:
        goto LABEL_12;
      }
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_launches, "objectForKeyedSubscript:", v6));

    if (!v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_launches, "setObject:forKeyedSubscript:", v21, v6);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_launches, "objectForKeyedSubscript:", v6));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v10]);

    if (!v23)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v12));
      [v17 addObject:v24];

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_launches, "objectForKeyedSubscript:", v6));
      [v18 setObject:v17 forKeyedSubscript:v10];
      goto LABEL_11;
    }
  }

- (void)updateExtendedLaunchesForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PLLogSignpostReader();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10000AB10(v7);
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v7 string2Value]);
  float v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 isEqualToString:@"YES"]));
  [v7 durationSeconds];
  unint64_t v13 = (unint64_t)(float)(v12 * 1000.0);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_extendedLaunches, "objectForKeyedSubscript:", v6));
  if (v14)
  {
    v15 = (void *)v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_extendedLaunches,  "objectForKeyedSubscript:",  v6));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v11]);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_extendedLaunches,  "objectForKeyedSubscript:",  v6));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v11]);
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v13));
      [v19 addObject:v20];

LABEL_10:
      goto LABEL_11;
    }
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_extendedLaunches,  "objectForKeyedSubscript:",  v6));

  if (!v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_extendedLaunches,  "setObject:forKeyedSubscript:",  v22,  v6);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_extendedLaunches,  "objectForKeyedSubscript:",  v6));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v11]);

  if (!v24)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v13));
    [v18 addObject:v25];

    v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_extendedLaunches,  "objectForKeyedSubscript:",  v6));
    [v19 setObject:v18 forKeyedSubscript:v11];
    goto LABEL_10;
  }

- (void)updateActivationsForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PLLogSignpostReader();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10000ABE8(v7);
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v7 number1Value]);
  float v11 = (void *)objc_claimAutoreleasedReturnValue([v7 string2Value]);
  float v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 isEqualToString:@"YES"]));

  [v7 durationSeconds];
  float v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activations, "objectForKeyedSubscript:", v6));

  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activations, "setObject:forKeyedSubscript:", v16, v6);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activations, "objectForKeyedSubscript:", v6));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v12]);

  if (!v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activations, "objectForKeyedSubscript:", v6));
    [v20 setObject:v19 forKeyedSubscript:v12];
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activations, "objectForKeyedSubscript:", v6));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v12]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v10]);

  if (!v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activations, "objectForKeyedSubscript:", v6));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v12]);
    [v26 setObject:v24 forKeyedSubscript:v10];
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activations, "objectForKeyedSubscript:", v6));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v12]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v10]);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)(float)(v14 * 1000.0)));
  [v29 addObject:v30];
}

- (void)updateResumesForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PLLogSignpostReader();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10000AC8C(v7, v9);
  }

  [v7 durationSeconds];
  unint64_t v11 = (unint64_t)(float)(v10 * 1000.0);
  float v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resumes, "objectForKeyedSubscript:", v6));

  if (v12)
  {
    float v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_resumes,  "objectForKeyedSubscript:",  v6));
    float v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11));
    -[NSMutableArray addObject:](v13, "addObject:", v14);
  }

  else
  {
    float v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11));
    -[NSMutableArray addObject:](v13, "addObject:", v15);

    -[NSMutableDictionary setObject:forKey:](self->_resumes, "setObject:forKey:", v13, v6);
  }
}

- (void)updateHangsForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PLLogSignpostReader();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10000AD20(v7, v9);
  }

  [v7 durationSeconds];
  unint64_t v11 = (unint64_t)(float)(v10 * 1000.0);
  float v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_hangs, "objectForKeyedSubscript:", v6));

  if (v12)
  {
    float v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_hangs,  "objectForKeyedSubscript:",  v6));
    float v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11));
    -[NSMutableArray addObject:](v13, "addObject:", v14);
  }

  else
  {
    float v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11));
    -[NSMutableArray addObject:](v13, "addObject:", v15);

    -[NSMutableDictionary setObject:forKey:](self->_hangs, "setObject:forKey:", v13, v6);
  }
}

- (void)updateGlitchesForProcess:(id)a3 withAnimationInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_glitches, "objectForKeyedSubscript:", v6));

  if (!v8)
  {
    glitches = self->_glitches;
    float v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](glitches, "setObject:forKey:", v10, v6);
  }

  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  uint64_t v39 = 0LL;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 glitches]);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10000664C;
  v35[3] = &unk_1000103D8;
  v35[4] = &v36;
  [v11 enumerateObjectsUsingBlock:v35];

  [v7 durationSeconds];
  float v13 = v12;
  uint64_t v14 = v37[3];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_glitches, "objectForKeyedSubscript:", v6));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"glitchDuration"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  v14 + [v16 unsignedIntValue]));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_glitches, "objectForKeyedSubscript:", v6));
  [v18 setObject:v17 forKeyedSubscript:@"glitchDuration"];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v7 glitches]);
  v20 = (char *)[v19 count];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_glitches, "objectForKeyedSubscript:", v6));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"glitchCount"]);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  &v20[[v22 unsignedIntValue]]));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_glitches, "objectForKeyedSubscript:", v6));
  [v24 setObject:v23 forKeyedSubscript:@"glitchCount"];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_glitches, "objectForKeyedSubscript:", v6));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"scrollDuration"]);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)(float)(v13 * 1000.0) + [v26 unsignedIntValue]));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_glitches, "objectForKeyedSubscript:", v6));
  [v28 setObject:v27 forKeyedSubscript:@"scrollDuration"];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v7 beginEvent]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 name]);
  LODWORD(v27) = [v30 isEqualToString:@"Scroll_Dragging"];

  if ((_DWORD)v27)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_glitches, "objectForKeyedSubscript:", v6));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"scrollCount"]);
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v32 unsignedIntValue] + 1));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_glitches, "objectForKeyedSubscript:", v6));
    [v34 setObject:v33 forKeyedSubscript:@"scrollCount"];
  }

  _Block_object_dispose(&v36, 8);
}

- (void)updateMXSignpostsForProcess:(id)a3 withInterval:(id)a4
{
  id v42 = a3;
  id v6 = a4;
  uint64_t v7 = qword_100015470++;
  if (v7 <= 49999)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_summarizedSignpostDurations,  "objectForKeyedSubscript:",  v42));

    if (!v8)
    {
      summarizedSignpostDurations = self->_summarizedSignpostDurations;
      float v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](summarizedSignpostDurations, "setObject:forKey:", v10, v42);

      summarizedSignpostMetrics = self->_summarizedSignpostMetrics;
      float v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](summarizedSignpostMetrics, "setObject:forKey:", v12, v42);

      numAppSignposts = self->_numAppSignposts;
      uint64_t v14 = objc_alloc_init(&OBJC_CLASS___SignpostCounter);
      -[NSMutableDictionary setObject:forKey:](numAppSignposts, "setObject:forKey:", v14, v42);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_numAppSignposts,  "objectForKeyedSubscript:",  v42));
    uint64_t v16 = v15[1];
    v15[1] = v16 + 1;
    if (v16 > 999) {
      goto LABEL_26;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 category]);
    if (v17) {
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 category]);
    }
    else {
      v18 = &stru_1000107C8;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v18, v20, 0LL));
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v18,  &stru_1000107C8,  0LL));
    }

    if (v17) {
    v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_summarizedSignpostDurations,  "objectForKeyedSubscript:",  v42));
    }
    v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v21]);

    if (!v23)
    {
      v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_summarizedSignpostDurations,  "objectForKeyedSubscript:",  v42));
      [v24 setObject:v23 forKey:v21];
    }

    [v6 durationSeconds];
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)(float)(v25 * 1000.0)));
    -[NSMutableArray addObject:](v23, "addObject:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue([v6 beginEvent]);
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 metrics]);
    if (v28)
    {
      v29 = (void *)v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue([v6 endEvent]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 metrics]);

      if (!v31)
      {
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_summarizedSignpostMetrics,  "objectForKeyedSubscript:",  v42));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v21]);

      [v15 updateMxSignpostOverlapStatistics:v6];
      uint64_t v33 = objc_opt_class(&OBJC_CLASS___SignpostAnimationInterval);
      if ((objc_opt_isKindOfClass(v6, v33) & 1) != 0) {
        v34 = v6;
      }
      else {
        v34 = 0LL;
      }
      if (v27)
      {
        id v35 = v34;
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v6 beginEvent]);
        v37 = (void *)objc_claimAutoreleasedReturnValue([v6 endEvent]);
        [v27 updateSummary:v36 endSnapshot:v37 animationInterval:v35];
      }

      else
      {
        uint64_t v38 = self->_summarizedSignpostMetrics;
        id v39 = v34;
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", v42));
        v40 = objc_alloc(&OBJC_CLASS___SignpostIntervalMetrics);
        v37 = (void *)objc_claimAutoreleasedReturnValue([v6 beginEvent]);
        id v35 = (id)objc_claimAutoreleasedReturnValue([v6 endEvent]);
        v41 = -[SignpostIntervalMetrics initWithBeginSnapshot:endSnapshot:animationInterval:]( v40,  "initWithBeginSnapshot:endSnapshot:animationInterval:",  v37,  v35,  v39);

        [v36 setObject:v41 forKey:v21];
      }
    }

    goto LABEL_25;
  }

- (void)updateMXSignpostEventsForProcess:(id)a3 withEvent:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  uint64_t v7 = qword_100015470++;
  if (v7 <= 49999)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_summarizedSignpostEvents,  "objectForKeyedSubscript:",  v25));

    if (!v8)
    {
      summarizedSignpostEvents = self->_summarizedSignpostEvents;
      float v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](summarizedSignpostEvents, "setObject:forKey:", v10, v25);

      numAppSignposts = self->_numAppSignposts;
      float v12 = objc_alloc_init(&OBJC_CLASS___SignpostCounter);
      -[NSMutableDictionary setObject:forKey:](numAppSignposts, "setObject:forKey:", v12, v25);
    }

    float v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_numAppSignposts,  "objectForKeyedSubscript:",  v25));
    uint64_t v14 = v13[1];
    v13[1] = v14 + 1;
    if (v14 <= 999)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 category]);
      if (v15) {
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 category]);
      }
      else {
        uint64_t v16 = &stru_1000107C8;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v16, v18, 0LL));
      }

      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v16,  &stru_1000107C8,  0LL));
      }

      if (v15) {
      v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_summarizedSignpostEvents,  "objectForKeyedSubscript:",  v25));
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v19]);

      v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_summarizedSignpostEvents,  "objectForKeyedSubscript:",  v25));
      v23 = v22;
      if (v21)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v21 integerValue] + 1));
        [v23 setObject:v24 forKey:v19];
      }

      else
      {
        [v22 setObject:&off_1000116E8 forKey:v19];
      }
    }
  }
}

- (id)signpostIntervalData:(id)a3 withBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, @"bundleID");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 number1Value]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, @"IsForeground");

  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 beginDate]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, @"beginDate");

  [v5 durationSeconds];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)(float)(v10 * 1000.0)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v11, @"duration");

  id v12 = PLLogSignpostReader();
  float v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10000ADB4(v5);
  }

  return v7;
}

- (void)updateTimeSeriesLaunches:(id)a3 withBundleID:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[XPCSignpostReader signpostIntervalData:withBundleID:](self, "signpostIntervalData:withBundleID:", a3, a4));
  -[NSMutableArray addObject:](self->_launchTimeSeries, "addObject:", v5);
}

- (void)processSignpostEvent:(id)a3
{
  id v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  unsigned int v5 = [v4 isEqualToString:@"ProcessExited"];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 attributes]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"BundleIdOverride"]);

    if (v7) {
      -[XPCSignpostReader updateProcessExitsForProcess:withEvent:]( self,  "updateProcessExitsForProcess:withEvent:",  v7,  v11);
    }
LABEL_7:

    float v10 = v11;
    goto LABEL_8;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 subsystem]);
  unsigned int v9 = [v8 isEqualToString:@"com.apple.metrickit.log"];

  float v10 = v11;
  if (v9)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[XPCSignpostReader getBundleIDFromEvent:](self, "getBundleIDFromEvent:", v11));
    if (v7) {
      -[XPCSignpostReader updateMXSignpostEventsForProcess:withEvent:]( self,  "updateMXSignpostEventsForProcess:withEvent:",  v7,  v11);
    }
    goto LABEL_7;
  }

- (void)processSignpostInterval:(id)a3
{
  id v27 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[XPCSignpostReader getBundleIDFromInterval:](self, "getBundleIDFromInterval:"));
  if (!v4) {
    goto LABEL_20;
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v27 name]);
  unsigned int v6 = [v5 isEqualToString:@"ApplicationFirstFramePresentation"];

  if (v6) {
    -[XPCSignpostReader updateLaunchesForProcess:withInterval:](self, "updateLaunchesForProcess:withInterval:", v4, v27);
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v27 name]);
  unsigned int v8 = [v7 isEqualToString:@"ApplicationLaunchExtendedResponsive"];

  if (v8) {
    -[XPCSignpostReader updateTimeSeriesLaunches:withBundleID:](self, "updateTimeSeriesLaunches:withBundleID:", v27, v4);
  }
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v27 beginEvent]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 string2Value]);
  if (v10)
  {
    id v11 = (void *)v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v27 endEvent]);
    float v13 = (void *)objc_claimAutoreleasedReturnValue([v12 number1Value]);
    if ([v13 intValue] == 1)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v27 beginEvent]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
      unsigned int v16 = [v15 isEqualToString:@"AppLaunch"];

      if (v16)
      {
        -[XPCSignpostReader updateExtendedLaunchesForProcess:withInterval:]( self,  "updateExtendedLaunchesForProcess:withInterval:",  v4,  v27);
        goto LABEL_20;
      }

      goto LABEL_12;
    }
  }

LABEL_12:
  v17 = (void *)objc_claimAutoreleasedReturnValue([v27 beginEvent]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);
  unsigned int v19 = [v18 isEqualToString:@"AppResume"];

  if (v19)
  {
    -[XPCSignpostReader updateResumesForProcess:withInterval:](self, "updateResumesForProcess:withInterval:", v4, v27);
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v27 name]);
    unsigned int v21 = [v20 isEqualToString:@"ApplicationActivationFirstFramePresentation"];

    if (v21)
    {
      -[XPCSignpostReader updateActivationsForProcess:withInterval:]( self,  "updateActivationsForProcess:withInterval:",  v4,  v27);
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v27 beginEvent]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);
      unsigned int v24 = [v23 isEqualToString:@"HangInterval"];

      if (v24)
      {
        -[XPCSignpostReader updateHangsForProcess:withInterval:](self, "updateHangsForProcess:withInterval:", v4, v27);
      }

      else
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v27 subsystem]);
        unsigned int v26 = [v25 isEqualToString:@"com.apple.metrickit.log"];

        if (v26) {
          -[XPCSignpostReader updateMXSignpostsForProcess:withInterval:]( self,  "updateMXSignpostsForProcess:withInterval:",  v4,  v27);
        }
      }
    }
  }

- (void)processSignpostAnimationInterval:(id)a3
{
  id v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[XPCSignpostReader getBundleIDFromInterval:](self, "getBundleIDFromInterval:"));
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v12 subsystem]);
    unsigned int v6 = [v5 isEqualToString:@"com.apple.metrickit.log"];

    if (!v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v12 beginEvent]);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
      if ([v8 isEqualToString:@"Scroll_Dragging"])
      {
      }

      else
      {
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v12 beginEvent]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
        unsigned int v11 = [v10 isEqualToString:@"Scroll_Deceleration"];

        if (!v11) {
          goto LABEL_8;
        }
      }

      -[XPCSignpostReader updateGlitchesForProcess:withAnimationInterval:]( self,  "updateGlitchesForProcess:withAnimationInterval:",  v4,  v12);
      goto LABEL_8;
    }

    -[XPCSignpostReader updateMXSignpostsForProcess:withInterval:]( self,  "updateMXSignpostsForProcess:withInterval:",  v4,  v12);
  }

- (id)processSignpostMetricsWithStartDate:(id)a3 withEndDate:(id)a4 processMXSignpost:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  -[XPCSignpostReader initializeMetrics](self, "initializeMetrics");
  id v10 = objc_alloc_init(&OBJC_CLASS___SignpostSupportObjectExtractor);
  id v11 = objc_alloc_init(&OBJC_CLASS___SignpostSupportSubsystemCategoryAllowlist);
  [v11 addSubsystem:@"com.apple.FrontBoard" category:@"AppLaunch"];
  [v11 addSubsystem:@"com.apple.UIKit" category:@"AppLifecycle"];
  [v11 addSubsystem:@"com.apple.hangtracer" category:@"always_on_hang"];
  [v11 addSubsystem:@"com.apple.UIKit" category:@"ScrollView"];
  [v11 addSubsystem:@"com.apple.runningboard" category:@"sp_telemetry"];
  [v11 addSubsystem:@"com.apple.app_launch_measurement" category:@"ApplicationLaunch"];
  if (v5) {
    [v11 addSubsystem:@"com.apple.metrickit.log" category:0];
  }
  [v10 setSubsystemCategoryFilter:v11];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100007650;
  v22[3] = &unk_100010400;
  v22[4] = self;
  [v10 setEmitEventProcessingBlock:v22];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100007670;
  v21[3] = &unk_100010428;
  v21[4] = self;
  [v10 setIntervalCompletionProcessingBlock:v21];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100007690;
  v20[3] = &unk_100010450;
  v20[4] = self;
  [v10 setAnimationIntervalCompletionProcessingBlock:v20];
  id v19 = 0LL;
  unsigned __int8 v12 = [v10 processLogArchiveWithPath:0 startDate:v9 endDate:v8 errorOut:&v19];

  id v13 = v19;
  if ((v12 & 1) == 0)
  {
    id v14 = PLLogSignpostReader();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000AE44(v13, v15);
    }
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v16 setObject:self->_processExits forKey:@"processExits"];
  [v16 setObject:self->_launches forKey:@"launchDurations"];
  [v16 setObject:self->_extendedLaunches forKey:@"extendedLaunchDurations"];
  [v16 setObject:self->_resumes forKey:@"resumeDurations"];
  [v16 setObject:self->_glitches forKey:@"scrollGlitches"];
  [v16 setObject:self->_activations forKey:@"activationDurations"];
  [v16 setObject:self->_summarizedSignpostEvents forKey:@"signpostEvents"];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[XPCSignpostReader packageMXSignpostData](self, "packageMXSignpostData"));
  [v16 setObject:v17 forKey:@"signpostIntervals"];

  [v16 setValue:&off_100011700 forKey:@"hangtracer_enabled"];
  [v16 setValue:self->_hangs forKey:@"hangDurations"];
  [v16 setValue:self->_launchTimeSeries forKey:@"launchesTimeSeries"];
  -[XPCSignpostReader logAggdTelemetry](self, "logAggdTelemetry");

  return v16;
}

- (id)packageMXSignpostData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  summarizedSignpostDurations = self->_summarizedSignpostDurations;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000774C;
  v9[3] = &unk_1000104A0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( summarizedSignpostDurations,  "enumerateKeysAndObjectsUsingBlock:",  v9);
  unsigned int v6 = v10;
  id v7 = v5;

  return v7;
}

- (void)logAggdTelemetry
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v3 = self->_numAppSignposts;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    int v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v3);
        }
        id v11 = (uint64_t *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_numAppSignposts,  "objectForKey:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)i),  (void)v13));
        if (v11[1] > 1000) {
          ++v8;
        }
        v7 += v11[2];
        v6 += v11[3];
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v5);
    uint64_t v12 = v8;
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v12 = 0LL;
  }

  ADClientSetValueForScalarKey( @"com.apple.powerlog.xpcsignpostreader.signpostprocessing.mxSignpostOverlapCounter",  v6);
  ADClientSetValueForScalarKey( @"com.apple.powerlog.xpcsignpostreader.signpostprocessing.mxSignpostProcessedCounter",  v7);
  ADClientSetValueForScalarKey( @"com.apple.powerlog.xpcsignpostreader.signpostprocessing.appThresholdExceededCount",  v12);
  if (qword_100015470 >= 50001) {
    ADClientSetValueForScalarKey( @"com.apple.powerlog.xpcsignpostreader.signpostprocessing.overallThresholdExceededCount",  1LL);
  }
}

- (void)initializeMetrics
{
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  launches = self->_launches;
  self->_launches = v3;

  id v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  extendedLaunches = self->_extendedLaunches;
  self->_extendedLaunches = v5;

  uint64_t v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  resumes = self->_resumes;
  self->_resumes = v7;

  uint64_t v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  hangs = self->_hangs;
  self->_hangs = v9;

  id v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  glitches = self->_glitches;
  self->_glitches = v11;

  __int128 v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  processExits = self->_processExits;
  self->_processExits = v13;

  __int128 v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  activations = self->_activations;
  self->_activations = v15;

  v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  summarizedSignpostDurations = self->_summarizedSignpostDurations;
  self->_summarizedSignpostDurations = v17;

  id v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  summarizedSignpostMetrics = self->_summarizedSignpostMetrics;
  self->_summarizedSignpostMetrics = v19;

  unsigned int v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  summarizedSignpostEvents = self->_summarizedSignpostEvents;
  self->_summarizedSignpostEvents = v21;

  v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  numAppSignposts = self->_numAppSignposts;
  self->_numAppSignposts = v23;

  id v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  launchTimeSeries = self->_launchTimeSeries;
  self->_launchTimeSeries = v25;
}

- (id)getBundleIDFromInterval:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 beginEvent]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  unsigned int v6 = [v5 isEqualToString:@"HangInterval"];

  if (!v6
    || (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 beginEvent]),
        int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 attributes]),
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"BundleIdOverride"]),
        v8,
        v7,
        !v9))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 endEvent]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 processImagePath]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByDeletingLastPathComponent]);

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v12));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
  }

  return v9;
}

- (id)getBundleIDFromEvent:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 processImagePath]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByDeletingLastPathComponent]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v4));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

  return v6;
}

- (id)subsystemCategoryAllowlist:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100007DC4;
  v6[3] = &unk_1000104C8;
  id v4 = objc_alloc_init(&OBJC_CLASS___SignpostSupportSubsystemCategoryAllowlist);
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

- (id)getScrollDirectionForSignpostInterval:(id)a3
{
  id v3 = a3;
  uint64_t v25 = 0LL;
  unsigned int v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_1000082A0;
  v29 = sub_1000082B0;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_1000082A0;
  v23 = sub_1000082B0;
  id v24 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  unsigned __int8 v5 = [v4 isEqualToString:@"Scroll_Zooming"];

  if ((v5 & 1) != 0)
  {
    unsigned int v6 = @"Diagonal";
  }

  else
  {
    unsigned int v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 endEvent]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 endEvent]);
      int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 metadataSegments]);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000082B8;
      v18[3] = &unk_100010518;
      v18[4] = &v25;
      v18[5] = &v19;
      [v8 enumerateObjectsUsingBlock:v18];

      [(id)v26[5] doubleValue];
      if (v9 != 0.0 || ([(id)v20[5] doubleValue], v10 == 0.0))
      {
        [(id)v26[5] doubleValue];
        else {
          unsigned int v6 = @"Horizontal";
        }
      }

      else
      {
        unsigned int v6 = @"Vertical";
      }

      id v13 = PLLogSignpostReader();
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = v26[5];
        uint64_t v17 = v20[5];
        *(_DWORD *)buf = 138412802;
        v32 = v6;
        __int16 v33 = 2112;
        uint64_t v34 = v16;
        __int16 v35 = 2112;
        uint64_t v36 = v17;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Scroll direction %@ (dx=%@, dy=%@)",  buf,  0x20u);
      }
    }
  }

  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v6;
}

- (void)submitSignpostDataWithConfig:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  unsigned int v6 = (void (**)(id, void))a4;
  id v7 = PLLogSignpostReader();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Signpost data submission start", buf, 2u);
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"taskingAllowlist"]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"taskingStartDate"]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"taskingEndDate"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"taskingTagConfig"]);
  if (v13 && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v13, v14) & 1) != 0))
  {
    id v15 = v13;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"TagUUID"]);
  }

  else
  {
    uint64_t v16 = 0LL;
    id v15 = 0LL;
  }

  id v17 = PLLogSignpostReader();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10000B0D4();
  }

  id v19 = PLLogSignpostReader();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_10000B074();
  }

  id v21 = PLLogSignpostReader();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_10000B014();
  }

  id v23 = PLLogSignpostReader();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    sub_10000AFB4();
  }

  id v25 = PLLogSignpostReader();
  unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_10000AF54();
  }

  uint64_t v27 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v16);
  if (v27)
  {
    v57 = v15;
    BOOL v28 = 1LL;
    if (v11 && v12 && v10 && v16)
    {
      v52 = v10;
      v53 = v11;
      v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@Powerlog_%@/",  @"/tmp/powerlog/cloud/",  v16));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"taskingSubmitSP"]);
      unsigned int v30 = [v29 BOOLValue];

      v51 = v9;
      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:@"Date"]);
        v32 = v12;
        if (v31)
        {
          __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:@"Date"]);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Signpost_%@",  v33));
        }

        else
        {
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Signpost_%@",  v16));
        }

        uint64_t v36 = v54;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@/",  v54,  v34));
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( -[XPCSignpostReader createSignpostFile:withStartDate:withEndDate:withallowlist:withTagConfig:]( self,  "createSignpostFile:withStartDate:withEndDate:withallowlist:withTagConfig:",  v37,  v53,  v32,  v10,  v13));
        BOOL v28 = v38 != 0LL;
      }

      else
      {
        v32 = v12;
        uint64_t v36 = v54;
      }

      id v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 contentsOfDirectoryAtPath:v36 error:0]);

      double v11 = v53;
      double v12 = v32;
      double v9 = v51;
      if (v40 && [v40 count])
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v54));
        id v42 = (void *)objc_claimAutoreleasedReturnValue( +[DEArchiver archiveDirectoryAt:deleteOriginal:]( &OBJC_CLASS___DEArchiver,  "archiveDirectoryAt:deleteOriginal:",  v41,  1LL));

        v56 = v42;
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 path]);
        [v51 setObject:v43 forKeyedSubscript:@"tarballPath"];

        id v44 = PLLogSignpostReader();
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue([v56 path]);
          unsigned int v47 = [v40 count];
          *(_DWORD *)buf = 138412546;
          v59 = v46;
          __int16 v60 = 1024;
          unsigned int v61 = v47;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "File to upload generated at %@ with %d files included.",  buf,  0x12u);
        }

        double v11 = v53;
      }

      double v10 = v52;
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v28));
    [v9 setObject:v48 forKey:@"success"];

    id v49 = PLLogSignpostReader();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_INFO,  "Signpost data submission end: reply = %@",  buf,  0xCu);
    }

    __int16 v35 = v9;
    id v15 = v57;
  }

  else
  {
    __int16 v35 = 0LL;
  }

  ((void (**)(id, void *))v6)[2](v6, v35);
}

- (id)createSignpostFile:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5 withallowlist:(id)a6 withTagConfig:(id)a7
{
  id v12 = a3;
  id v41 = a4;
  id v42 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x2020000000LL;
  int v53 = 0;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LOBYTE(a6) = [v15 fileExistsAtPath:v12];

  if ((a6 & 1) != 0)
  {
    id v16 = PLLogSignpostReader();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000B134();
    }
    goto LABEL_17;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v49 = 0LL;
  unsigned int v19 = [v18 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v49];
  id v17 = (os_log_s *)v49;

  if (v19)
  {
    id v20 = objc_alloc_init(&OBJC_CLASS___SignpostSupportObjectExtractor);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[XPCSignpostReader subsystemCategoryAllowlist:](self, "subsystemCategoryAllowlist:", v13));
    id v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_100008EBC;
    v44[3] = &unk_100010540;
    v44[4] = self;
    id v45 = v14;
    v22 = v21;
    v46 = v22;
    v48 = &v50;
    id v23 = v12;
    id v47 = v23;
    id v39 = objc_retainBlock(v44);
    [v20 setIntervalCompletionProcessingBlock:v39];
    id v24 = PLLogSignpostReader();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_10000B194();
    }

    [v20 setSubsystemCategoryFilter:v40];
    id v43 = 0LL;
    unsigned __int8 v26 = [v20 processLogArchiveWithPath:0 startDate:v41 endDate:v42 errorOut:&v43];
    id v27 = v43;
    if ((v26 & 1) == 0)
    {
      id v28 = PLLogSignpostReader();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        if (v27)
        {
          id v38 = objc_claimAutoreleasedReturnValue([v27 localizedDescription]);
          v37 = (const char *)[v38 UTF8String];
        }

        else
        {
          v37 = "Unknown error";
        }

        *(_DWORD *)buf = 136315138;
        v55 = v37;
        _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Unable to serialize signpost: %s",  buf,  0xCu);
        if (v27) {
      }
        }
    }

    unsigned int v30 = -[XPCSignpostReader writeSignpostFile:withOrder:withData:]( self,  "writeSignpostFile:withOrder:withData:",  v23,  *((unsigned int *)v51 + 6),  v22);
    *((_DWORD *)v51 + 6) = v30;
  }

  if (!*((_DWORD *)v51 + 6)) {
    goto LABEL_17;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v12,  @"tag.json"));
  if (!-[XPCSignpostReader createTagFile:withTagConfig:withFileCount:]( self,  "createTagFile:withTagConfig:withFileCount:",  v31,  v14,  *((unsigned int *)v51 + 6)))
  {

LABEL_17:
    __int16 v33 = 0LL;
    goto LABEL_18;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v12));
  __int16 v33 = (char *)objc_claimAutoreleasedReturnValue( +[DEArchiver archiveDirectoryAt:deleteOriginal:]( &OBJC_CLASS___DEArchiver,  "archiveDirectoryAt:deleteOriginal:",  v32,  1LL));

  id v34 = PLLogSignpostReader();
  __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v33;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Signpost tarball generated at %@", buf, 0xCu);
  }

LABEL_18:
  _Block_object_dispose(&v50, 8);

  return v33;
}

- (id)gzipDeflate:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v12.uLong total_out = 0LL;
    memset(&v12.zalloc, 0, 24);
    id v4 = v3;
    v12.avail_in = objc_msgSend(v4, "length", objc_msgSend(v4, "bytes"));
    id v5 = 0LL;
    if (!deflateInit2_(&v12, -1, 8, 31, 8, 0, "1.2.12", 112))
    {
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 0x4000LL));
      do
      {
        uLong total_out = v12.total_out;
        id v8 = v6;
        double v9 = (char *)[v8 mutableBytes];
        v12.next_out = (Bytef *)&v9[v12.total_out];
        unsigned int v10 = [v8 length];
        v12.avail_out = v10 - LODWORD(v12.total_out);
        deflate(&v12, 4);
      }

      while (!v12.avail_out);
      deflateEnd(&v12);
      [v8 setLength:v12.total_out];
      id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v8));
    }
  }

  else
  {
    id v5 = v3;
  }

  return v5;
}

- (int)writeSignpostFile:(id)a3 withOrder:(int)a4 withData:(id)a5
{
  LODWORD(v6) = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = PLLogSignpostReader();
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v33 = [v9 count];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "writing to signpost file for %lu records.",  buf,  0xCu);
  }

  z_stream v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v13 = [v9 count];

  if (v13)
  {
    z_stream v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v9,  0LL,  0LL));
    id v14 = PLLogSignpostReader();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [v12 length];
      *(_DWORD *)buf = 134217984;
      id v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "\t Original JSON size = %lu", buf, 0xCu);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[XPCSignpostReader gzipDeflate:](self, "gzipDeflate:", v12));
    id v18 = PLLogSignpostReader();
    unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = [v17 length];
      *(_DWORD *)buf = 134217984;
      id v33 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "\t Compressed size = %lu", buf, 0xCu);
    }

    id v21 = &ADClientSetValueForScalarKey_ptr;
    uint64_t v6 = (v6 + 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@signpost.%d.json.gz",  v8,  v6));
    id v31 = 0LL;
    unsigned __int8 v23 = [v17 writeToFile:v22 options:1 error:&v31];
    id v24 = v31;

    if ((v23 & 1) == 0)
    {
      id v25 = PLLogSignpostReader();
      unsigned __int8 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v28 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@%d.json.gz", v8, v6));
        id v29 = [v28 UTF8String];
        if (v24)
        {
          id v21 = (_UNKNOWN **) objc_claimAutoreleasedReturnValue([v24 localizedDescription]);
          unsigned int v30 = (const char *)[v21 UTF8String];
        }

        else
        {
          unsigned int v30 = "Unknown error";
        }

        *(_DWORD *)buf = 136315394;
        id v33 = v29;
        __int16 v34 = 2080;
        __int16 v35 = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unable to write to %s: %s", buf, 0x16u);
        if (v24) {
      }
        }
    }

    [v9 removeAllObjects];

LABEL_13:
  }

  return v6;
}

- (id)signpostIntervalData:(id)a3 forTaskingConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  @"Powerlog",  @"CollectionType");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 category]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, @"Category");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, @"Name");

  double v11 = (void *)objc_claimAutoreleasedReturnValue([v6 subsystem]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v11, @"Subsystem");

  [v6 timebaseRatio];
  z_stream v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, @"TimebaseRatio");

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 string1Name]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, @"String1Name");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 string1Value]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, @"String1Value");

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 string2Name]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, @"String2Name");

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 string2Value]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v16, @"String2Value");

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v6 startMachContinuousTime]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v17,  @"startMachContinuousTime");

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 beginWallTimeStringWithTimeZoneName:0]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v18, @"beginWallTime");

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v6 endMachContinuousTime]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v19,  @"endMachContinuousTime");

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 endWallTimeStringWithTimeZoneName:0]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v20, @"endWallTime");

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 beginEvent]);
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 beginEvent]);
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v22 processID]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v23, @"BeginPid");

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 beginEvent]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 processName]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v25,  @"BeginProcessName");
  }

  unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v6 endEvent]);

  if (v26)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v6 endEvent]);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v27 processID]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v28, @"EndPid");

    id v29 = (void *)objc_claimAutoreleasedReturnValue([v6 endEvent]);
    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 processName]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v30,  @"EndProcessName");
  }

  uint64_t v31 = objc_claimAutoreleasedReturnValue([v6 number1Name]);
  if (v31)
  {
    v32 = (void *)v31;
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v6 number1Value]);

    if (v33)
    {
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v6 number1Name]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v34, @"Number1Name");

      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v6 number1Value]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v35,  @"Number1Value");
    }
  }

  uint64_t v36 = objc_claimAutoreleasedReturnValue([v6 number2Name]);
  if (v36)
  {
    v37 = (void *)v36;
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v6 number2Value]);

    if (v38)
    {
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v6 number2Name]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v39, @"Number2Name");

      v40 = (void *)objc_claimAutoreleasedReturnValue([v6 number2Value]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v40,  @"Number2Value");
    }
  }

  id v41 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Internal"]);
  unsigned int v42 = [v41 BOOLValue];

  if (v42)
  {
    id v43 = (void *)objc_claimAutoreleasedReturnValue([v6 subsystem]);
    unsigned int v44 = [v43 isEqualToString:@"com.apple.metrickit.log"];

    if (v44)
    {
      id v45 = (void *)objc_claimAutoreleasedReturnValue( -[XPCSignpostReader mxSignpostIntervalDataForTasking:]( self,  "mxSignpostIntervalDataForTasking:",  v6));
      -[NSMutableDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", v45);
    }
  }

  id v46 = PLLogSignpostReader();
  id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
    sub_10000B1F4(v8, v47);
  }

  return v8;
}

- (id)mxSignpostIntervalDataForTasking:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 beginEvent]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metrics]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 beginEvent]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 metrics]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cpuTimeNsec]);
    [v9 doubleValue];
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10 / 1000000000.0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, @"BeginCPUTime");

    z_stream v12 = (void *)objc_claimAutoreleasedReturnValue([v3 beginEvent]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 metrics]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dirtyMemoryLifetimePeakKB]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v14,  @"BeginPeakMemory");

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 beginEvent]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 metrics]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dirtyMemoryKB]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v17,  @"BeginDirtyMemory");

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 beginEvent]);
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 metrics]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 storageDirtiedKB]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v20,  @"BeginDiskLogicalWrites");
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 endEvent]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 metrics]);

  if (v22)
  {
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v3 endEvent]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 metrics]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 cpuTimeNsec]);
    [v25 doubleValue];
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v26 / 1000000000.0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v27, @"EndCPUTime");

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v3 endEvent]);
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 metrics]);
    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 dirtyMemoryLifetimePeakKB]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v30, @"EndPeakMemory");

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v3 endEvent]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 metrics]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 dirtyMemoryKB]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v33,  @"EndDirtyMemory");

    __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v3 endEvent]);
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 metrics]);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 storageDirtiedKB]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v36,  @"EndDiskLogicalWrites");
  }

  return v4;
}

- (BOOL)createTagFile:(id)a3 withTagConfig:(id)a4 withFileCount:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"TagUUID"]);

  if (!(_DWORD)v5 || !v9)
  {
    id v15 = PLLogSignpostReader();
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10000B3A8(v10);
    }
    goto LABEL_10;
  }

  double v10 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v8);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
  -[os_log_s setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, @"FileCount");

  if (!+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v10))
  {
    id v21 = 0LL;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v10,  0LL,  &v21));
    id v17 = v21;
    id v18 = PLLogSignpostReader();
    unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10000B318(v17, (uint64_t)v16, v19);
    }

LABEL_10:
    unsigned __int8 v14 = 0;
    goto LABEL_11;
  }

  z_stream v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v10,  0LL,  0LL));
  id v13 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v12, 4LL);
  unsigned __int8 v14 = -[NSString writeToFile:atomically:encoding:error:]( v13,  "writeToFile:atomically:encoding:error:",  v7,  0LL,  4LL,  0LL);

LABEL_11:
  return v14;
}

- (void)removeFile:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = 0LL;
  unsigned __int8 v5 = [v4 removeItemAtPath:v3 error:&v10];
  id v6 = v10;

  id v7 = PLLogSignpostReader();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10000B3E8();
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_10000B448((uint64_t)v3, v6, v9);
  }
}

- (BOOL)uploadFile:(id)a3 withTagConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v49 = 0LL;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  BOOL v8 = 1;
  char v52 = 1;
  if (v6)
  {
    id v9 = PLLogSignpostReader();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Upload file to iCloud: %@", buf, 0xCu);
    }

    id v11 = [[CKContainerID alloc] initWithContainerIdentifier:@"com.apple.perfpowerservices.tasking" environment:1];
    z_stream v12 = -[CKContainer initWithContainerID:](objc_alloc(&OBJC_CLASS___CKContainer), "initWithContainerID:", v11);
    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer publicCloudDatabase](v12, "publicCloudDatabase"));
    id v13 = -[CKRecord initWithRecordType:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:",  @"Attachment");
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v15 = -[CKAsset initWithFileURL:](objc_alloc(&OBJC_CLASS___CKAsset), "initWithFileURL:", v6);
    if (v15)
    {
      -[CKRecord setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v15, @"asset");
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
      -[CKRecord setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, @"fileName");

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Internal"]);
      else {
        id v18 = &off_1000116E8;
      }
      -[CKRecord setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v18, @"internal", self);

      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Beta"]);
      else {
        id v20 = &off_1000116E8;
      }
      -[CKRecord setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v20, @"seed");

      -[CKRecord setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", @"tvOS", @"machineType");
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", @"machineType"));
      unsigned int v22 = [v21 isEqualToString:@"iOS"];

      if (v22 && [v42 isiPad]) {
        -[CKRecord setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  @"iPadOS",  @"machineType");
      }
      unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Model"]);

      if (v23)
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Model"]);
        -[CKRecord setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v24, @"deviceModel");
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"TagUUID"]);

      if (v25)
      {
        double v26 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"TagUUID"]);
        -[CKRecord setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v26, @"UUID");
      }

      id v27 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Reason"]);

      if (v27)
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Reason"]);
        -[CKRecord setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v28, @"reason");
      }

      id v29 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Build"]);

      if (v29)
      {
        unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Build"]);
        -[CKRecord setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v30, @"build");
      }

      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Date"]);

      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Date"]);
        -[CKRecord setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v32, @"date");
      }

      id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[NSMutableArray addObject:](v33, "addObject:", v13);
      __int16 v34 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  v33,  0LL);
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKModifyRecordsOperation configuration](v34, "configuration"));
      [v35 setAllowsCellularAccess:0];

      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKModifyRecordsOperation configuration](v34, "configuration"));
      [v36 setAutomaticallyRetryNetworkFailures:1];

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKModifyRecordsOperation configuration](v34, "configuration"));
      [v37 setDiscretionaryNetworkBehavior:0];

      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKModifyRecordsOperation configuration](v34, "configuration"));
      [v38 setPreferAnonymousRequests:1];

      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_10000A4E0;
      v44[3] = &unk_100010568;
      v48 = &v49;
      id v45 = v6;
      id v46 = v42;
      id v47 = v14;
      -[CKModifyRecordsOperation setPerRecordCompletionBlock:](v34, "setPerRecordCompletionBlock:", v44);
      [v43 addOperation:v34];
    }

    else
    {
      id v39 = PLLogSignpostReader();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_10000B4FC();
      }

      -[XPCSignpostReader removeFile:](self, "removeFile:", v14);
      *((_BYTE *)v50 + 24) = 0;
    }

    BOOL v8 = *((_BYTE *)v50 + 24) != 0;
  }

  _Block_object_dispose(&v49, 8);

  return v8;
}

- (BOOL)isiPad
{
  return 0;
}

- (NSMutableDictionary)launches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setLaunches:(id)a3
{
}

- (NSMutableDictionary)extendedLaunches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setExtendedLaunches:(id)a3
{
}

- (NSMutableDictionary)resumes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setResumes:(id)a3
{
}

- (NSMutableDictionary)hangs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setHangs:(id)a3
{
}

- (NSMutableDictionary)glitches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setGlitches:(id)a3
{
}

- (NSMutableDictionary)processExits
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setProcessExits:(id)a3
{
}

- (NSMutableDictionary)activations
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setActivations:(id)a3
{
}

- (NSMutableDictionary)summarizedSignpostDurations
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSummarizedSignpostDurations:(id)a3
{
}

- (NSMutableDictionary)summarizedSignpostMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSummarizedSignpostMetrics:(id)a3
{
}

- (NSMutableDictionary)summarizedSignpostEvents
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setSummarizedSignpostEvents:(id)a3
{
}

- (NSMutableDictionary)numAppSignposts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setNumAppSignposts:(id)a3
{
}

- (NSMutableArray)launchTimeSeries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setLaunchTimeSeries:(id)a3
{
}

- (OS_dispatch_queue)sigterm_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setSigterm_queue:(id)a3
{
}

- (OS_dispatch_source)sigterm_source
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setSigterm_source:(id)a3
{
}

- (void).cxx_destruct
{
}

@end