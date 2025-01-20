@interface _DASFeatureDurationTracker
+ (BOOL)shouldTrackActivity:(id)a3;
+ (id)sharedInstance;
- (BOOL)shouldResetDurations;
- (NSDictionary)fastPassActivities;
- (NSDictionary)featuresDict;
- (NSDictionary)maximumFeatureDurationDict;
- (NSMutableDictionary)featureDurationDict;
- (NSUserDefaults)defaults;
- (OS_os_log)log;
- (_DASFeatureDurationTracker)init;
- (double)durationForFeature:(id)a3;
- (double)maximumDurationForFeature:(id)a3;
- (void)loadMaximumDurations;
- (void)loadState;
- (void)resetFeatureDurations;
- (void)saveState;
- (void)setDefaults:(id)a3;
- (void)setFastPassActivities:(id)a3;
- (void)setFeatureDurationDict:(id)a3;
- (void)setFeaturesDict:(id)a3;
- (void)setLog:(id)a3;
- (void)setMaximumFeatureDurationDict:(id)a3;
- (void)updateFeatureDurationActivityCompleted:(id)a3;
@end

@implementation _DASFeatureDurationTracker

- (_DASFeatureDurationTracker)init
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS____DASFeatureDurationTracker;
  v2 = -[_DASFeatureDurationTracker init](&v32, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"featureDurationTracker"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000B32E8(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    v13 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.dasd.activityDurationTracker");
    defaults = v2->_defaults;
    v2->_defaults = v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    featureDurationDict = v2->_featureDurationDict;
    v2->_featureDurationDict = (NSMutableDictionary *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 dictionaryForPlist:2]);
    featuresDict = v2->_featuresDict;
    v2->_featuresDict = (NSDictionary *)v18;

    -[_DASFeatureDurationTracker loadMaximumDurations](v2, "loadMaximumDurations");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 dictionaryForPlist:0]);
    fastPassActivities = v2->_fastPassActivities;
    v2->_fastPassActivities = (NSDictionary *)v21;

    if (-[_DASFeatureDurationTracker shouldResetDurations](v2, "shouldResetDurations"))
    {
      -[_DASFeatureDurationTracker resetFeatureDurations](v2, "resetFeatureDurations");
      v23 = v2->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_1000B32B8(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }

    -[_DASFeatureDurationTracker loadState](v2, "loadState");
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003E93C;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157868 != -1) {
    dispatch_once(&qword_100157868, block);
  }
  return (id)qword_100157870;
}

+ (BOOL)shouldTrackActivity:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 featureCodes]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)loadState
{
  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary removeAllObjects](v2->_featureDurationDict, "removeAllObjects");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", @"FeatureDurationDict"));
  id v4 = [v3 mutableCopy];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        featureDurationDict = v2->_featureDurationDict;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9, (void)v14));
        -[NSMutableDictionary setObject:forKey:](featureDurationDict, "setObject:forKey:", v11, v9);
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v6);
  }

  log = v2->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v2->_featureDurationDict;
    *(_DWORD *)buf = 138412290;
    v19 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Loaded feature duration data from defaults %@",  buf,  0xCu);
  }

  objc_sync_exit(v2);
}

- (void)saveState
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  v2->_featureDurationDict,  1LL);
  -[NSUserDefaults setObject:forKey:](v2->_defaults, "setObject:forKey:", v3, @"FeatureDurationDict");
  id v4 = v2->_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", @"FeatureDurationDict"));
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Saved feature duration data to defaults %@",  (uint8_t *)&v6,  0xCu);
  }

  objc_sync_exit(v2);
}

- (BOOL)shouldResetDurations
{
  uint64_t v9 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
  free(v9);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", @"FeatureDurationResetVersion"));
  unsigned __int8 v7 = [v6 isEqualToString:v5];
  BOOL v8 = os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG);
  if ((v7 & 1) != 0)
  {
    if (v8) {
      sub_1000B3318();
    }
  }

  else
  {
    if (v8) {
      sub_1000B3378();
    }
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v5, @"FeatureDurationResetVersion");
  }

  char v3 = v7 ^ 1;

  return v3;
}

- (void)resetFeatureDurations
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 dictionaryForPlist:2]);
  featuresDict = v2->_featuresDict;
  v2->_featuresDict = (NSDictionary *)v4;

  if (-[NSDictionary count](v2->_featuresDict, "count"))
  {
    -[NSMutableDictionary removeAllObjects](v2->_featureDurationDict, "removeAllObjects");
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v6 = v2->_featuresDict;
    id v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v6);
          }
          -[NSMutableDictionary setObject:forKey:]( v2->_featureDurationDict,  "setObject:forKey:",  &off_100121C90,  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i),  (void)v18);
        }

        id v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      }

      while (v7);
    }

    -[_DASFeatureDurationTracker saveState](v2, "saveState");
    log = v2->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_1000B3414((uint64_t)&v2->_featureDurationDict, log, v11, v12, v13, v14, v15, v16);
    }
  }

  else
  {
    __int128 v17 = v2->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000B33D8(v17);
    }
  }

  objc_sync_exit(v2);
}

- (void)loadMaximumDurations
{
  v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dictionaryForPlist:2]);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"runtimeLimit"]);

        [v12 doubleValue];
        else {
          uint64_t v15 = (_UNKNOWN **)v12;
        }
        -[NSDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v15, v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  maximumFeatureDurationDict = self->_maximumFeatureDurationDict;
  self->_maximumFeatureDurationDict = v2;
}

- (double)maximumDurationForFeature:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!-[NSDictionary count](v5->_maximumFeatureDurationDict, "count")) {
    -[_DASFeatureDurationTracker loadMaximumDurations](v5, "loadMaximumDurations");
  }
  maximumFeatureDurationDict = v5->_maximumFeatureDurationDict;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](maximumFeatureDurationDict, "objectForKeyedSubscript:", v7));

  if (v8)
  {
    uint64_t v9 = v5->_maximumFeatureDurationDict;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
    [v11 doubleValue];
    double v13 = v12;
  }

  else
  {
    double v13 = 0.0;
  }

  objc_sync_exit(v5);

  return v13;
}

- (double)durationForFeature:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!-[NSMutableDictionary count](v5->_featureDurationDict, "count")) {
    -[_DASFeatureDurationTracker loadState](v5, "loadState");
  }
  featureDurationDict = v5->_featureDurationDict;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](featureDurationDict, "objectForKeyedSubscript:", v7));

  if (v8)
  {
    uint64_t v9 = v5->_featureDurationDict;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
    [v11 doubleValue];
    double v13 = v12;
  }

  else
  {
    double v13 = 0.0;
  }

  objc_sync_exit(v5);

  return v13;
}

- (void)updateFeatureDurationActivityCompleted:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v46 = v4;
  if (+[_DASFeatureDurationTracker shouldTrackActivity:]( &OBJC_CLASS____DASFeatureDurationTracker,  "shouldTrackActivity:",  v4))
  {
    -[_DASFeatureDurationTracker loadState](v5, "loadState");
    v45 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v4 endTime]);
    if (v45 && v44)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 dictionaryForPlist:0]);
      fastPassActivities = v5->_fastPassActivities;
      v5->_fastPassActivities = (NSDictionary *)v7;

      [v44 timeIntervalSinceDate:v45];
      double v10 = v9;
      uint64_t v11 = v5->_fastPassActivities;
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v46 name]);
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12));

      if (v13)
      {
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        uint64_t v14 = v5->_fastPassActivities;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v46 name]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15));
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"FeatureCodes"]);

        id v18 = [v17 countByEnumeratingWithState:&v49 objects:v63 count:16];
        obj = (OS_os_log *)v17;
        if (v18)
        {
          uint64_t v48 = *(void *)v50;
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v50 != v48) {
                objc_enumerationMutation(obj);
              }
              __int128 v20 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
              featureDurationDict = v5->_featureDurationDict;
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue", v44));
              v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( featureDurationDict,  "objectForKeyedSubscript:",  v22));

              [v23 doubleValue];
              double v25 = v10 + v24;
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10 + v24));
              uint64_t v27 = v5->_featureDurationDict;
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v26, v28);

              uint64_t v29 = v5->_log;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
                v31 = (void *)objc_claimAutoreleasedReturnValue([v46 name]);
                maximumFeatureDurationDict = v5->_maximumFeatureDurationDict;
                v33 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);
                v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( maximumFeatureDurationDict,  "objectForKeyedSubscript:",  v33));
                [v34 doubleValue];
                *(_DWORD *)buf = 138413314;
                v54 = v30;
                __int16 v55 = 2112;
                v56 = v31;
                __int16 v57 = 2112;
                v58 = v20;
                __int16 v59 = 2048;
                double v60 = v25;
                __int16 v61 = 2048;
                uint64_t v62 = v35;
                _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Deducting runtime %@ after activity %@: Feature code %@ is now %f < %f",  buf,  0x34u);
              }
            }

            id v18 = -[OS_os_log countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v49,  v63,  16LL);
          }

          while (v18);
        }
      }

      else
      {
        obj = v5->_log;
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue([v46 name]);
          sub_1000B34E4(v36, buf, obj);
        }
      }

      log = v5->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
        sub_1000B347C((uint64_t)v5, log, v38, v39, v40, v41, v42, v43);
      }
      -[_DASFeatureDurationTracker saveState](v5, "saveState", v44);
    }
  }

  objc_sync_exit(v5);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSDictionary)featuresDict
{
  return self->_featuresDict;
}

- (void)setFeaturesDict:(id)a3
{
}

- (NSDictionary)maximumFeatureDurationDict
{
  return self->_maximumFeatureDurationDict;
}

- (void)setMaximumFeatureDurationDict:(id)a3
{
}

- (NSDictionary)fastPassActivities
{
  return self->_fastPassActivities;
}

- (void)setFastPassActivities:(id)a3
{
}

- (NSMutableDictionary)featureDurationDict
{
  return self->_featureDurationDict;
}

- (void)setFeatureDurationDict:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end