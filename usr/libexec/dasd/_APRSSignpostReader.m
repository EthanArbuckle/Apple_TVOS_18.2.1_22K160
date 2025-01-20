@interface _APRSSignpostReader
- (DASDelegate)dasDelegate;
- (NSMutableDictionary)launches;
- (NSMutableDictionary)resumes;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_APRSSignpostReader)init;
- (void)begin;
- (void)end;
- (void)processSignpostInterval:(id)a3;
- (void)setDasDelegate:(id)a3;
- (void)setLaunches:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResumes:(id)a3;
- (void)updateLaunchesForProcess:(id)a3 withInterval:(id)a4;
- (void)updateResumesForProcess:(id)a3 withInterval:(id)a4;
@end

@implementation _APRSSignpostReader

- (_APRSSignpostReader)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____APRSSignpostReader;
  v2 = -[_APRSSignpostReader init](&v16, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appResume.signpostReader", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    os_log_t v7 = os_log_create("com.apple.aprs", "appResume.signpostReader");
    log = v2->_log;
    v2->_log = v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    resumes = v2->_resumes;
    v2->_resumes = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    launches = v2->_launches;
    v2->_launches = (NSMutableDictionary *)v11;

    v13 = objc_opt_new(&OBJC_CLASS___DASDelegate);
    dasDelegate = v2->_dasDelegate;
    v2->_dasDelegate = v13;
  }

  return v2;
}

- (void)begin
{
}

- (void)end
{
}

- (void)processSignpostInterval:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProcessName"]);
  if (v5)
  {
    v6 = (void *)v5;
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DurationSeconds"]);
    if (v7)
    {
      v8 = (void *)v7;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BeginEvent"]);

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProcessName"]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DASAppResumePLLogger applicationBundleIDForExecutableName:]( &OBJC_CLASS____DASAppResumePLLogger,  "applicationBundleIDForExecutableName:",  v10));
        if (v11)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
            sub_1000B2EF4((uint64_t)v10, (uint64_t)v11, log);
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BeginEvent"]);
          unsigned int v14 = [v13 isEqualToString:@"AppLaunch"];

          if (v14)
          {
            -[_APRSSignpostReader updateLaunchesForProcess:withInterval:]( self,  "updateLaunchesForProcess:withInterval:",  v11,  v4);
          }

          else
          {
            objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BeginEvent"]);
            unsigned int v17 = [v16 isEqualToString:@"AppResume"];

            if (v17) {
              -[_APRSSignpostReader updateResumesForProcess:withInterval:]( self,  "updateResumesForProcess:withInterval:",  v11,  v4);
            }
          }
        }

        goto LABEL_15;
      }
    }

    else
    {
    }
  }

  v15 = self->_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1000B2EB4(v15);
  }
LABEL_15:
}

- (void)updateResumesForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B2FC4(log, v7);
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"DurationSeconds"]);
  [v9 floatValue];
  unint64_t v11 = (unint64_t)(float)(v10 * 1000.0);

  if (v11 < 0x1389)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resumes, "objectForKeyedSubscript:", v6));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resumes, "objectForKeyedSubscript:", v6));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v11));
      [v13 addObject:v14];
    }

    else
    {
      v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v11));
      -[NSMutableArray addObject:](v15, "addObject:", v16);

      -[NSMutableDictionary setObject:forKey:](self->_resumes, "setObject:forKey:", v15, v6);
    }
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000B2F64();
  }
}

- (void)updateLaunchesForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B3058(log, v7);
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"DurationSeconds"]);
  [v9 floatValue];
  unint64_t v11 = (unint64_t)(float)(v10 * 1000.0);

  if (v11 < 0x1389)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_launches, "objectForKeyedSubscript:", v6));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_launches, "objectForKeyedSubscript:", v6));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v11));
      [v13 addObject:v14];
    }

    else
    {
      v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v11));
      -[NSMutableArray addObject:](v15, "addObject:", v16);

      -[NSMutableDictionary setObject:forKey:](self->_launches, "setObject:forKey:", v15, v6);
    }
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000B2F64();
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)resumes
{
  return self->_resumes;
}

- (void)setResumes:(id)a3
{
}

- (NSMutableDictionary)launches
{
  return self->_launches;
}

- (void)setLaunches:(id)a3
{
}

- (DASDelegate)dasDelegate
{
  return self->_dasDelegate;
}

- (void)setDasDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end