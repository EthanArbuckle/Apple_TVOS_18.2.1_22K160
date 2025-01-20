@interface DatapathMetricStream
+ (id)sharedInstance;
- (BOOL)coredata_diagnostic_metrics_enabled;
- (BOOL)megawifiprofile_diagnostic_metrics_enabled;
- (BOOL)monitoring;
- (BOOL)timerRunning;
- (DatapathMetricStream)init;
- (ManagedConfiguration)managedConfiguration;
- (NSLock)lastPBLock;
- (NSMutableData)lastPB;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (WAProtobufMessageSubmitter)pbConverter;
- (WAStreamDBDelegate)dbDelegate;
- (id)block;
- (id)getPBCodableNSDataFromNSKeyedArchive:(id)a3;
- (id)getter;
- (unint64_t)lastPBLength;
- (unint64_t)megawifiprofile_diagnostic_metrics_period_ms;
- (void)dealloc;
- (void)fetchMetrics;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBlock:(id)a3;
- (void)setCoredata_diagnostic_metrics_enabled:(BOOL)a3;
- (void)setDbDelegate:(id)a3;
- (void)setDispatchQueueAndAddObservers:(id)a3 withGetter:(id)a4;
- (void)setGetter:(id)a3;
- (void)setLastPB:(id)a3;
- (void)setLastPBLength:(unint64_t)a3;
- (void)setLastPBLock:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMegawifiprofile_diagnostic_metrics_enabled:(BOOL)a3;
- (void)setMegawifiprofile_diagnostic_metrics_period_ms:(unint64_t)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setPbConverter:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerRunning:(BOOL)a3;
- (void)streamPBCodeable:(id)a3 additionalDictionaryItems:(id)a4;
- (void)updateTimerConfiguration;
@end

@implementation DatapathMetricStream

+ (id)sharedInstance
{
  if (qword_1000ECF80 != -1) {
    dispatch_once(&qword_1000ECF80, &stru_1000CCEF8);
  }
  return (id)qword_1000ECF78;
}

- (DatapathMetricStream)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DatapathMetricStream;
  v2 = -[DatapathMetricStream init](&v16, "init");
  id v3 = WALogCategoryDefaultHandle();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[DatapathMetricStream init]";
      __int16 v19 = 1024;
      int v20 = 65;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:starting", buf, 0x12u);
    }

    v2->_BOOL timerRunning = 0;
    id v6 = WALogCategoryDefaultHandle();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL timerRunning = v2->_timerRunning;
      *(_DWORD *)buf = 136446722;
      v18 = "-[DatapathMetricStream init]";
      __int16 v19 = 1024;
      int v20 = 68;
      __int16 v21 = 1024;
      BOOL v22 = timerRunning;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:setting _timerRunning %d",  buf,  0x18u);
    }

    -[DatapathMetricStream setMonitoring:](v2, "setMonitoring:", 0LL);
    v9 = objc_alloc_init(&OBJC_CLASS___WAProtobufMessageSubmitter);
    pbConverter = v2->_pbConverter;
    v2->_pbConverter = v9;

    v11 = -[NSMutableData initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithCapacity:", 10240LL);
    -[DatapathMetricStream setLastPB:](v2, "setLastPB:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream lastPB](v2, "lastPB"));
    [v12 setLength:10240];

    -[DatapathMetricStream setLastPBLength:](v2, "setLastPBLength:", 0LL);
    v13 = objc_alloc_init(&OBJC_CLASS___NSLock);
    -[DatapathMetricStream setLastPBLock:](v2, "setLastPBLock:", v13);

    v14 = v2;
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[DatapathMetricStream init]";
      __int16 v19 = 1024;
      int v20 = 63;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error super init", buf, 0x12u);
    }
  }

  return v2;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_enabled"];
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_period_ms"];
  [v3 removeObserver:self forKeyPath:@"coredata_diagnostic_metrics_enabled"];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DatapathMetricStream;
  -[DatapathMetricStream dealloc](&v4, "dealloc");
}

- (void)setDispatchQueueAndAddObservers:(id)a3 withGetter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = WALogCategoryDefaultHandle();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136446466;
    v15 = "-[DatapathMetricStream setDispatchQueueAndAddObservers:withGetter:]";
    __int16 v16 = 1024;
    int v17 = 97;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:scheduleWithQueue",  (uint8_t *)&v14,  0x12u);
  }

  -[DatapathMetricStream setQueue:](self, "setQueue:", v7);
  -[DatapathMetricStream setGetter:](self, "setGetter:", v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ManagedConfiguration sharedInstance](&OBJC_CLASS___ManagedConfiguration, "sharedInstance"));
  -[DatapathMetricStream setManagedConfiguration:](self, "setManagedConfiguration:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream managedConfiguration](self, "managedConfiguration"));
  [v11 addObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_enabled" options:5 context:0];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream managedConfiguration](self, "managedConfiguration"));
  [v12 addObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_period_ms" options:5 context:0];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream managedConfiguration](self, "managedConfiguration"));
  [v13 addObserver:self forKeyPath:@"coredata_diagnostic_metrics_enabled" options:5 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    int v14 = v12;
  }
  else {
    int v14 = 0LL;
  }
  id v15 = v14;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  id v16 = WALogCategoryDefaultHandle();
  int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v41 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
    __int16 v42 = 1024;
    int v43 = 115;
    __int16 v44 = 2112;
    unint64_t v45 = (unint64_t)v9;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:observeValueForKeyPath %@",  buf,  0x1Cu);
  }

  if ([v9 isEqualToString:@"megawifiprofile_diagnostic_metrics_enabled"])
  {
    if (v15)
    {
      -[DatapathMetricStream setMegawifiprofile_diagnostic_metrics_enabled:]( self,  "setMegawifiprofile_diagnostic_metrics_enabled:",  [v15 BOOLValue]);
      id v18 = WALogCategoryDefaultHandle();
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v20 = -[DatapathMetricStream megawifiprofile_diagnostic_metrics_enabled]( self,  "megawifiprofile_diagnostic_metrics_enabled");
        __int16 v21 = "NO";
        v41 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
        __int16 v42 = 1024;
        int v43 = 120;
        *(_DWORD *)buf = 136446978;
        if (v20) {
          __int16 v21 = "YES";
        }
        __int16 v44 = 2112;
        unint64_t v45 = (unint64_t)v9;
        __int16 v46 = 2080;
        unint64_t v47 = (unint64_t)v21;
        BOOL v22 = "%{public}s::%d:%@ Preference is %s";
        goto LABEL_28;
      }

      goto LABEL_29;
    }
  }

  else if ([v9 isEqualToString:@"megawifiprofile_diagnostic_metrics_period_ms"])
  {
    if (v15)
    {
      id v23 = -[DatapathMetricStream megawifiprofile_diagnostic_metrics_period_ms]( self,  "megawifiprofile_diagnostic_metrics_period_ms");
      if (v23 != [v15 unsignedIntegerValue]
        && -[DatapathMetricStream megawifiprofile_diagnostic_metrics_period_ms]( self,  "megawifiprofile_diagnostic_metrics_period_ms")
        && [v15 unsignedIntegerValue])
      {
        id v24 = WALogCategoryDefaultHandle();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v26 = -[DatapathMetricStream megawifiprofile_diagnostic_metrics_period_ms]( self,  "megawifiprofile_diagnostic_metrics_period_ms");
          id v27 = [v15 unsignedIntegerValue];
          *(_DWORD *)buf = 136446978;
          v41 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
          __int16 v42 = 1024;
          int v43 = 129;
          __int16 v44 = 2048;
          unint64_t v45 = v26;
          __int16 v46 = 2048;
          unint64_t v47 = (unint64_t)v27;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Noticed that kMegaProfileDiagnosticMetricsPeriod_ms is changing values from %lu to %lu",  buf,  0x26u);
        }

        *((_BYTE *)v37 + 24) = 1;
      }

      -[DatapathMetricStream setMegawifiprofile_diagnostic_metrics_period_ms:]( self,  "setMegawifiprofile_diagnostic_metrics_period_ms:",  [v15 unsignedIntegerValue]);
      id v28 = WALogCategoryDefaultHandle();
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      unint64_t v29 = -[DatapathMetricStream megawifiprofile_diagnostic_metrics_period_ms]( self,  "megawifiprofile_diagnostic_metrics_period_ms");
      *(_DWORD *)buf = 136446978;
      v41 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
      __int16 v42 = 1024;
      int v43 = 133;
      __int16 v44 = 2112;
      unint64_t v45 = (unint64_t)v9;
      __int16 v46 = 2048;
      unint64_t v47 = v29;
      BOOL v22 = "%{public}s::%d:%@ Preference is %lu";
      goto LABEL_28;
    }
  }

  else
  {
    unsigned int v30 = [v9 isEqualToString:@"coredata_diagnostic_metrics_enabled"];
    if (v15) {
      unsigned int v31 = v30;
    }
    else {
      unsigned int v31 = 0;
    }
    if (v31 == 1)
    {
      -[DatapathMetricStream setCoredata_diagnostic_metrics_enabled:]( self,  "setCoredata_diagnostic_metrics_enabled:",  [v15 BOOLValue]);
      id v32 = WALogCategoryDefaultHandle();
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v33 = -[DatapathMetricStream coredata_diagnostic_metrics_enabled](self, "coredata_diagnostic_metrics_enabled");
        *(_DWORD *)buf = 136446978;
        v41 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
        __int16 v42 = 1024;
        int v43 = 138;
        __int16 v44 = 2112;
        unint64_t v45 = (unint64_t)v9;
        __int16 v46 = 2048;
        unint64_t v47 = v33;
        BOOL v22 = "%{public}s::%d:%@ Preference is %lu";
LABEL_28:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v22, buf, 0x26u);
      }

- (id)getPBCodableNSDataFromNSKeyedArchive:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___WAMessageAWD);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSError);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___WAField);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v23 = 0LL;
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v13,  v3,  &v23));

  id v15 = v23;
  if (v15)
  {
    id v16 = WALogCategoryDefaultHandle();
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v25 = "-[DatapathMetricStream getPBCodableNSDataFromNSKeyedArchive:]";
      __int16 v26 = 1024;
      int v27 = 162;
      __int16 v28 = 2112;
      id v29 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive WAMessageAWD: %@",  buf,  0x1Cu);
    }

    id v18 = 0LL;
  }

  else
  {
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream pbConverter](self, "pbConverter"));
    id v15 = (id)objc_claimAutoreleasedReturnValue([v19 instantiateAWDProtobufAndPopulateValues:v14]);

    if (!v15)
    {
      id v18 = 0LL;
      goto LABEL_8;
    }

    unsigned int v20 = objc_alloc(&OBJC_CLASS___NSData);
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 data]);
    id v18 = -[NSData initWithData:](v20, "initWithData:", v17);
  }

LABEL_8:
  return v18;
}

- (void)fetchMetrics
{
  getter = (void (**)(id, uint64_t, void *))self->_getter;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000320D4;
  v3[3] = &unk_1000CCF48;
  v3[4] = self;
  getter[2](getter, 1LL, v3);
}

- (void)updateTimerConfiguration
{
  id v3 = WALogCategoryDefaultHandle();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL megawifiprofile_diagnostic_metrics_enabled = self->_megawifiprofile_diagnostic_metrics_enabled;
    unint64_t megawifiprofile_diagnostic_metrics_period_ms = self->_megawifiprofile_diagnostic_metrics_period_ms;
    BOOL timerRunning = self->_timerRunning;
    timer = self->_timer;
    BOOL v9 = timer != 0LL;
    if (timer) {
      BOOL v10 = dispatch_source_testcancel((dispatch_source_t)timer) != 0;
    }
    else {
      BOOL v10 = 0;
    }
    *(_DWORD *)buf = 136447746;
    v53 = "-[DatapathMetricStream updateTimerConfiguration]";
    __int16 v54 = 1024;
    int v55 = 211;
    __int16 v56 = 1024;
    *(_DWORD *)v57 = megawifiprofile_diagnostic_metrics_enabled;
    *(_WORD *)&v57[4] = 2048;
    *(void *)&v57[6] = megawifiprofile_diagnostic_metrics_period_ms;
    __int16 v58 = 1024;
    BOOL v59 = timerRunning;
    __int16 v60 = 1024;
    BOOL v61 = v9;
    __int16 v62 = 1024;
    BOOL v63 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:megawifiprofile_diagnostic_metrics_enabled is %d megawifiprofile_diagnostic_metrics_period_ms is %l u _timerRunning is %d _timer exists %d testcancel is %d",  buf,  0x34u);
  }

  if (self->_timerRunning)
  {
    if (!self->_megawifiprofile_diagnostic_metrics_enabled || !self->_megawifiprofile_diagnostic_metrics_period_ms)
    {
      uint64_t v11 = self->_timer;
      if (v11)
      {
        if (!dispatch_source_testcancel((dispatch_source_t)v11))
        {
          id v12 = WALogCategoryDefaultHandle();
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v14 = self->_megawifiprofile_diagnostic_metrics_enabled;
            unint64_t v15 = self->_megawifiprofile_diagnostic_metrics_period_ms;
            *(_DWORD *)buf = 136446978;
            v53 = "-[DatapathMetricStream updateTimerConfiguration]";
            __int16 v54 = 1024;
            int v55 = 247;
            __int16 v56 = 1024;
            *(_DWORD *)v57 = v14;
            *(_WORD *)&v57[4] = 2048;
            *(void *)&v57[6] = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Timer exists and is valid, Suspending: Enabled %d Period(ms) %lu",  buf,  0x22u);
          }

          dispatch_suspend((dispatch_object_t)self->_timer);
          self->_BOOL timerRunning = 0;
          id v16 = WALogCategoryDefaultHandle();
          int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_41;
          }
          BOOL v18 = self->_timerRunning;
          *(_DWORD *)buf = 136446722;
          v53 = "-[DatapathMetricStream updateTimerConfiguration]";
          __int16 v54 = 1024;
          int v55 = 250;
          __int16 v56 = 1024;
          *(_DWORD *)v57 = v18;
LABEL_40:
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:setting _timerRunning %d",  buf,  0x18u);
LABEL_41:
        }
      }
    }

- (void)streamPBCodeable:(id)a3 additionalDictionaryItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_autoreleasePoolPush();
  id v9 = objc_alloc(&OBJC_CLASS___WANWActivityStatistics);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
  id v11 = [v9 initWithPBCodableData:v10];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream lastPBLock](self, "lastPBLock"));
  [v12 lock];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream lastPB](self, "lastPB"));
  if (![v13 length])
  {

    goto LABEL_18;
  }

  unint64_t v14 = -[DatapathMetricStream lastPBLength](self, "lastPBLength");

  if (!v14)
  {
LABEL_18:
    id v46 = WALogCategoryDefaultHandle();
    unint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v81 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
      __int16 v82 = 1024;
      int v83 = 335;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Missing previous fragment, writing single fragment",  buf,  0x12u);
    }

    id v32 = (NSData *)objc_claimAutoreleasedReturnValue([v11 getTransformedFlattened:2]);
    if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v32))
    {
      id v78 = 0LL;
      char v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v32,  0LL,  &v78));
      unsigned int v20 = (os_log_s *)v78;
      if (!v20)
      {
        id v48 = WALogDiagnosticProfileLogHandle();
        BOOL v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          id v50 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v39,  4LL);
          *(_DWORD *)buf = 138543362;
          v81 = (const char *)v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      goto LABEL_40;
    }

    id v51 = WALogCategoryDefaultHandle();
    unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v81 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
      __int16 v82 = 1024;
      int v83 = 350;
      __int16 v84 = 2112;
      *(void *)v85 = v32;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid JSON %@", buf, 0x1Cu);
    }

    goto LABEL_41;
  }

  unint64_t v15 = objc_alloc(&OBJC_CLASS___NSData);
  id v16 = objc_claimAutoreleasedReturnValue(-[DatapathMetricStream lastPB](self, "lastPB"));
  int v17 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v15,  "initWithBytesNoCopy:length:freeWhenDone:",  [v16 mutableBytes],  -[DatapathMetricStream lastPBLength](self, "lastPBLength"),  0);

  id v18 = WALogCategoryDefaultHandle();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  unsigned int v20 = v19;
  if (v17)
  {
    id v76 = v6;
    v77 = v8;
    id v75 = v7;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v81 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
      __int16 v82 = 1024;
      int v83 = 284;
      __int16 v84 = 2048;
      *(void *)v85 = -[NSData length](v17, "length");
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:initWithBytesNoCopy NSData len %lu",  buf,  0x1Cu);
    }

    v72 = v17;
    unsigned int v20 = (os_log_s *)[[WANWActivityStatistics alloc] initWithPBCodableData:v17];
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s awdReport](v20, "awdReport"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dictionaryRepresentation]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allKeys]);
    id v24 = [v23 count];
    v74 = v11;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v11 awdReport]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 dictionaryRepresentation]);
    int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 allKeys]);
    id v28 = [v27 count];

    if (v24 != v28)
    {
      id v52 = WALogCategoryDefaultHandle();
      char v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s awdReport](v20, "awdReport"));
        os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue([v53 dictionaryRepresentation]);
        __int16 v54 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s allKeys](loga, "allKeys"));
        id v55 = [v54 count];
        id v11 = v74;
        __int16 v56 = (void *)objc_claimAutoreleasedReturnValue([v74 awdReport]);
        v57 = (void *)objc_claimAutoreleasedReturnValue([v56 dictionaryRepresentation]);
        __int16 v58 = (void *)objc_claimAutoreleasedReturnValue([v57 allKeys]);
        id v59 = [v58 count];
        *(_DWORD *)buf = 136446978;
        v81 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
        __int16 v82 = 1024;
        int v83 = 327;
        __int16 v84 = 2048;
        *(void *)v85 = v55;
        *(_WORD *)&v85[8] = 2048;
        *(void *)&v85[10] = v59;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Not diffing - previousFragment.keys.count %lu wifiFragment %lu",  buf,  0x26u);

        id v7 = v75;
        id v6 = v76;
        uint64_t v8 = v77;
      }

      else
      {
        id v7 = v75;
        id v6 = v76;
        uint64_t v8 = v77;
        id v11 = v74;
      }

      id v32 = v72;
LABEL_40:

      goto LABEL_41;
    }

    if (v20)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s awdReport](v20, "awdReport"));
      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 dictionaryRepresentation]);
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 allKeys]);
      id v32 = v72;
      if ([v31 containsObject:@"interfaceStats"])
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s awdReport](v20, "awdReport"));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 dictionaryRepresentation]);
        unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 allKeys]);
        unsigned int v36 = [v35 containsObject:@"controllerStats"];

        if (v36)
        {
          dispatch_time_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s awdReport](v20, "awdReport"));
          id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 dictionaryRepresentation]);
          id v11 = v74;
          char v39 = (os_log_s *)objc_claimAutoreleasedReturnValue([v74 getTransformedFlattenedFrom:v38 style:2]);

          id v6 = v76;
          uint64_t v8 = v77;
          if (v39)
          {
            id v40 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream dbDelegate](self, "dbDelegate"));
            [v40 processMetricDictOnEngine:WADeviceAnalyticsWiFiStatsInfo data:v39];

            id v7 = v75;
            if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v39))
            {
              id v79 = 0LL;
              v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v39,  0LL,  &v79));
              id v42 = v79;
              if (!v42)
              {
                id v43 = WALogDiagnosticProfileLogHandle();
                id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  log = v44;
                  unint64_t v45 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v41,  4LL);
                  *(_DWORD *)buf = 138543362;
                  v81 = (const char *)v45;
                  _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

                  id v44 = log;
                }
              }

              uint64_t v8 = v77;
              goto LABEL_40;
            }

            int v60 = 0;
          }

          else
          {
            int v60 = 1;
            id v7 = v75;
          }

- (WAStreamDBDelegate)dbDelegate
{
  return (WAStreamDBDelegate *)objc_loadWeakRetained((id *)&self->_dbDelegate);
}

- (void)setDbDelegate:(id)a3
{
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (id)block
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setBlock:(id)a3
{
}

- (ManagedConfiguration)managedConfiguration
{
  return (ManagedConfiguration *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setManagedConfiguration:(id)a3
{
}

- (WAProtobufMessageSubmitter)pbConverter
{
  return self->_pbConverter;
}

- (void)setPbConverter:(id)a3
{
}

- (id)getter
{
  return self->_getter;
}

- (void)setGetter:(id)a3
{
}

- (BOOL)timerRunning
{
  return self->_timerRunning;
}

- (void)setTimerRunning:(BOOL)a3
{
  self->_BOOL timerRunning = a3;
}

- (BOOL)megawifiprofile_diagnostic_metrics_enabled
{
  return self->_megawifiprofile_diagnostic_metrics_enabled;
}

- (void)setMegawifiprofile_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_BOOL megawifiprofile_diagnostic_metrics_enabled = a3;
}

- (unint64_t)megawifiprofile_diagnostic_metrics_period_ms
{
  return self->_megawifiprofile_diagnostic_metrics_period_ms;
}

- (void)setMegawifiprofile_diagnostic_metrics_period_ms:(unint64_t)a3
{
  self->_unint64_t megawifiprofile_diagnostic_metrics_period_ms = a3;
}

- (BOOL)coredata_diagnostic_metrics_enabled
{
  return self->_coredata_diagnostic_metrics_enabled;
}

- (void)setCoredata_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_coredata_diagnostic_metrics_enabled = a3;
}

- (NSMutableData)lastPB
{
  return self->_lastPB;
}

- (void)setLastPB:(id)a3
{
}

- (unint64_t)lastPBLength
{
  return self->_lastPBLength;
}

- (void)setLastPBLength:(unint64_t)a3
{
  self->_lastPBLength = a3;
}

- (NSLock)lastPBLock
{
  return self->_lastPBLock;
}

- (void)setLastPBLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end