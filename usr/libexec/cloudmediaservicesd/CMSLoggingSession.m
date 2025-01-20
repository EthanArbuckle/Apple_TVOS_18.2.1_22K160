@interface CMSLoggingSession
- (BOOL)sessionEnded;
- (CMSLogger)belongedLogger;
- (NSDictionary)metadata;
- (NSString)sessionType;
- (id)eventDurations;
- (id)eventOccurance;
- (id)initForType:(id)a3 withMetadata:(id)a4;
- (void)_endSession;
- (void)dealloc;
- (void)recordEvent:(id)a3;
- (void)recordEvent:(id)a3 occuredAt:(id)a4;
- (void)setBelongedLogger:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation CMSLoggingSession

- (id)initForType:(id)a3 withMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CMSLoggingSession;
  v8 = -[CMSLoggingSession init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    sessionType = v8->_sessionType;
    v8->_sessionType = v9;

    objc_storeStrong((id *)&v8->_metadata, a4);
    v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    events = v8->events;
    v8->events = v11;
  }

  return v8;
}

- (void)recordEvent:(id)a3 occuredAt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_sessionEnded)
  {
    NSLog(@"Error: CMSLoggerSession has ended already. %s", "-[CMSLoggingSession recordEvent:occuredAt:]");
  }

  else
  {
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[CMSLogger _LoggingQueue](&OBJC_CLASS___CMSLogger, "_LoggingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000E8C8;
    block[3] = &unk_10001CC90;
    block[4] = self;
    id v9 = v6;
    id v11 = v9;
    id v12 = v7;
    dispatch_async(v8, block);
  }
}

- (void)recordEvent:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[CMSLoggingSession recordEvent:occuredAt:](self, "recordEvent:occuredAt:", v4, v5);
}

- (id)eventDurations
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if ((unint64_t)-[NSMutableArray count](self->events, "count") >= 2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->events, "firstObject"));
    if ((unint64_t)-[NSMutableArray count](self->events, "count") < 2)
    {
      id v6 = v4;
    }

    else
    {
      unint64_t v5 = 1LL;
      do
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->events, "objectAtIndexedSubscript:", v5));
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 eventType]);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v6 eventType]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v7,  v8));

        v10 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 timestamp]);
        [v10 timeIntervalSinceDate:v11];
        double v13 = v12;

        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v9));
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v4 eventType]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v6 eventType]);
          NSLog( @"Warning: CMSLogger currently only support every edge on the FSM only go though once. We have passed %@ -> % @ before. The newer measurement will be used right now %s",  v15,  v16,  "-[CMSLoggingSession eventDurations]");
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, v9);

        ++v5;
        id v4 = v6;
      }

      while ((unint64_t)-[NSMutableArray count](self->events, "count") > v5);
    }
  }

  return v3;
}

- (id)eventOccurance
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = self->events;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventType", (void)v15));
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v10));

        if (v11)
        {
          double v12 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v11 unsignedIntegerValue] + 1));
        }

        else
        {
          double v12 = &off_10001D4C8;
        }

        double v13 = (void *)objc_claimAutoreleasedReturnValue([v9 eventType]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v13);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (void)_endSession
{
  if (self->_sessionEnded)
  {
    NSLog(@"Error: CMSLoggerSession %@ has ended already. %s", a2, self, "-[CMSLoggingSession _endSession]");
  }

  else
  {
    v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[CMSLogger _LoggingQueue](&OBJC_CLASS___CMSLogger, "_LoggingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000EE14;
    block[3] = &unk_10001C890;
    block[4] = self;
    dispatch_async(v3, block);

    self->_sessionEnded = 1;
  }

- (void)dealloc
{
  if (!self->_sessionEnded) {
    NSLog( @"Warning: CMSLoggerSession %@ has not been closed, so it wasn't added as part of the log. %s",  a2,  self,  "-[CMSLoggingSession dealloc]");
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMSLoggingSession;
  -[CMSLoggingSession dealloc](&v3, "dealloc");
}

- (NSString)sessionType
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)sessionEnded
{
  return self->_sessionEnded;
}

- (CMSLogger)belongedLogger
{
  return (CMSLogger *)objc_loadWeakRetained((id *)&self->_belongedLogger);
}

- (void)setBelongedLogger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end