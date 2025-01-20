@interface ADServiceStatistics
- (ADServiceStatistics)initWithServiceIdentifier:(id)a3;
- (NSString)serviceIdentifier;
- (id)_commandTimes;
- (id)_serviceStatsPath;
- (id)_statsDict;
- (id)_statsDirectory;
- (id)_statsForCommand:(id)a3;
- (void)_saveStats;
- (void)dealloc;
- (void)markIncomingCommand:(id)a3;
- (void)markResponseForCommand:(id)a3;
@end

@implementation ADServiceStatistics

- (ADServiceStatistics)initWithServiceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  unsigned int v6 = [v5 statisticsRecordingEnabled];

  v7 = 0LL;
  if (v4 && v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___ADServiceStatistics;
    v8 = -[ADServiceStatistics init](&v12, "init");
    if (v8)
    {
      v9 = (NSString *)[v4 copy];
      serviceIdentifier = v8->_serviceIdentifier;
      v8->_serviceIdentifier = v9;
    }

    self = v8;
    v7 = self;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADServiceStatistics;
  -[ADServiceStatistics dealloc](&v3, "dealloc");
}

- (id)_statsDirectory
{
  if (qword_100577CE0 != -1) {
    dispatch_once(&qword_100577CE0, &stru_1004F0C58);
  }
  return (id)qword_100577CD8;
}

- (id)_serviceStatsPath
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceStatistics _statsDirectory](self, "_statsDirectory"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.plist",  self->_serviceIdentifier));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v4]);

  return v5;
}

- (id)_statsDict
{
  p_statsDict = &self->_statsDict;
  statsDict = self->_statsDict;
  if (!statsDict)
  {
    v5 = objc_alloc(&OBJC_CLASS___NSData);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceStatistics _serviceStatsPath](self, "_serviceStatsPath"));
    v7 = -[NSData initWithContentsOfFile:](v5, "initWithContentsOfFile:", v6);

    if (v7)
    {
      id v15 = 0LL;
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v7,  1LL,  0LL,  &v15));
      id v9 = v15;
      if (v9)
      {
        v10 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          serviceIdentifier = self->_serviceIdentifier;
          *(_DWORD *)buf = 136315650;
          v17 = "-[ADServiceStatistics _statsDict]";
          __int16 v18 = 2114;
          v19 = serviceIdentifier;
          __int16 v20 = 2114;
          id v21 = v9;
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Error reading stats plist for %{public}@ %{public}@",  buf,  0x20u);
        }
      }

      else
      {
        objc_storeStrong((id *)p_statsDict, v8);
      }
    }

    else
    {
      objc_super v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v13 = *p_statsDict;
      *p_statsDict = v12;
    }

    statsDict = *p_statsDict;
  }

  return statsDict;
}

- (id)_statsForCommand:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceStatistics _statsDict](self, "_statsDict"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (!v6)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceStatistics _statsDict](self, "_statsDict"));
    [v7 setObject:v6 forKey:v4];
  }

  return v6;
}

- (void)_saveStats
{
  statsDict = self->_statsDict;
  if (statsDict)
  {
    id v9 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  statsDict,  200LL,  0LL,  &v9));
    id v5 = v9;
    if (v5)
    {
      unsigned int v6 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        serviceIdentifier = self->_serviceIdentifier;
        *(_DWORD *)buf = 136315650;
        v11 = "-[ADServiceStatistics _saveStats]";
        __int16 v12 = 2114;
        v13 = serviceIdentifier;
        __int16 v14 = 2114;
        id v15 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Error serializing plist data for service %{public}@ %{public}@",  buf,  0x20u);
      }
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceStatistics _serviceStatsPath](self, "_serviceStatsPath"));
      [v4 writeToFile:v8 atomically:0];
    }
  }

- (id)_commandTimes
{
  commandTimes = self->_commandTimes;
  if (!commandTimes)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v5 = self->_commandTimes;
    self->_commandTimes = v4;

    commandTimes = self->_commandTimes;
  }

  return commandTimes;
}

- (void)markIncomingCommand:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceStatistics _commandTimes](self, "_commandTimes"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v5 setObject:v6 forKey:v4];
  }

  else
  {
    v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[ADServiceStatistics markIncomingCommand:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Trying to mark command start for nil command",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)markResponseForCommand:(id)a3
{
  id v4 = (NSString *)a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceStatistics _commandTimes](self, "_commandTimes"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceStatistics _statsForCommand:](self, "_statsForCommand:", v4));
      int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Total Count"]);
      int v9 = [v8 intValue];

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (v9 + 1)));
      [v7 setObject:v10 forKey:@"Total Count"];

      if (v9 >= 9) {
        int v9 = 9;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Response Time"]);
      [v11 doubleValue];
      double v13 = v12;

      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v14 timeIntervalSinceDate:v6];
      double v16 = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (v16 + v13 * (double)v9) / (double)(v9 + 1)));
      [v7 setObject:v17 forKey:@"Response Time"];

      -[ADServiceStatistics _saveStats](self, "_saveStats");
    }

    else
    {
      __int16 v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        serviceIdentifier = self->_serviceIdentifier;
        int v22 = 136315650;
        v23 = "-[ADServiceStatistics markResponseForCommand:]";
        __int16 v24 = 2112;
        v25 = v4;
        __int16 v26 = 2114;
        v27 = serviceIdentifier;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s No start time for command %@ for service %{public}@",  (uint8_t *)&v22,  0x20u);
      }
    }
  }

  else
  {
    __int16 v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_serviceIdentifier;
      int v22 = 136315394;
      v23 = "-[ADServiceStatistics markResponseForCommand:]";
      __int16 v24 = 2114;
      v25 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Can't mark response for nil command for service %{public}@",  (uint8_t *)&v22,  0x16u);
    }
  }
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void).cxx_destruct
{
}

@end