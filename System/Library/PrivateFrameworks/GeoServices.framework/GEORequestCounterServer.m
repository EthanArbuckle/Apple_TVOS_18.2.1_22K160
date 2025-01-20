@interface GEORequestCounterServer
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)addCacheResultWithRequest:(id)a3;
- (void)clearWithMessage:(id)a3;
- (void)externalCountWithRequest:(id)a3;
- (void)externalIncrementWithRequest:(id)a3;
- (void)fetchRoutePreloadSessionsWithMessage:(id)a3;
- (void)getCacheResultsWithRequest:(id)a3;
- (void)incrementWithMessage:(id)a3;
- (void)readProactiveTileDownloadsWithMessage:(id)a3;
- (void)readRequestLogsWithMessage:(id)a3;
- (void)readRequestsWithMessage:(id)a3;
- (void)recordRoutePreloadSessionWithMessage:(id)a3;
- (void)runBackgroundTask:(id)a3;
- (void)setCountersEnabledWithMessage:(id)a3;
@end

@implementation GEORequestCounterServer

- (void)setCountersEnabledWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"enabled"]);
  id v7 = [v6 BOOLValue];

  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEORequestCounterServer");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = NSStringFromSelector(a2);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)v11;
    v13 = "NO";
    if ((_DWORD)v7) {
      v13 = "YES";
    }
    int v15 = 138478083;
    uint64_t v16 = v11;
    __int16 v17 = 2081;
    v18 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%{private}@ got enabled=%{private}s",  (uint8_t *)&v15,  0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](&OBJC_CLASS___GEORequestCounter, "sharedCounter"));
  [v14 setCountersEnabled:v7];

  [v4 sendReply:0];
}

- (void)incrementWithMessage:(id)a3
{
  v3 = (char *)a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"startTime"]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"endTime"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"appID"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"xmitB"]);
  id v9 = [v8 longLongValue];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"recvB"]);
  id v11 = [v10 longLongValue];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"reqType"]);
  id v13 = [v12 intValue];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"iface"]);
  id v29 = [v14 unsignedIntegerValue];

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"reqResult"]);
  unsigned __int8 v16 = [v15 unsignedIntegerValue];

  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEORequestCounterServer");
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = NSStringFromSelector(a2);
    SEL aSelectora = v3;
    id v20 = v11;
    v21 = v6;
    v22 = v5;
    id v23 = v9;
    v24 = (void *)objc_claimAutoreleasedReturnValue(v19);
    *(_DWORD *)buf = 138478595;
    v31 = v24;
    __int16 v32 = 2113;
    v33 = v7;
    __int16 v34 = 1024;
    int v35 = (int)v13;
    __int16 v36 = 1024;
    int v37 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%{private}@ got appID=%{private}@ type=0x%x result=%hhu",  buf,  0x22u);

    id v9 = v23;
    v5 = v22;
    v6 = v21;
    id v11 = v20;
    v3 = (char *)aSelectora;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[GEORequestCountPowerLogger sharedInstance]( &OBJC_CLASS___GEORequestCountPowerLogger,  "sharedInstance"));
  [v25 incrementCountForClient:v7 requestType:v13];

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[GEORequestCounterPersistence sharedInstance]( &OBJC_CLASS___GEORequestCounterPersistence,  "sharedInstance"));
  [v26 incrementForApp:v7 startTime:v5 endTime:v6 requestType:v13 result:v16 xmitBytes:v9 recvBytes:v11 usedInterfaces:v29 withCompletion:0];

  [v3 sendReply:0];
}

- (void)readRequestsWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"startTime"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"endTime"]);
  v8 = objc_alloc(&OBJC_CLASS___NSDateInterval);
  id v9 = v6;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    if (v7)
    {
LABEL_3:
      v10 = -[NSDateInterval initWithStartDate:endDate:](v8, "initWithStartDate:endDate:", v9, v7);
      if (v6) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  v10 = -[NSDateInterval initWithStartDate:endDate:](v8, "initWithStartDate:endDate:", v9, v17);

  if (!v6) {
LABEL_4:
  }

LABEL_5:
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEORequestCounterServer");
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138478083;
    v21 = v14;
    __int16 v22 = 2113;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{private}@ got in %{private}@", buf, 0x16u);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](&OBJC_CLASS___GEORequestCounter, "sharedCounter"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000063F0;
  v18[3] = &unk_1000590C0;
  id v19 = v4;
  id v16 = v4;
  [v15 readRequestsPerAppDuring:v10 handler:v18];
}

- (void)readRequestLogsWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"startTime"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"endTime"]);
  v8 = objc_alloc(&OBJC_CLASS___NSDateInterval);
  id v9 = v6;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    if (v7)
    {
LABEL_3:
      v10 = -[NSDateInterval initWithStartDate:endDate:](v8, "initWithStartDate:endDate:", v9, v7);
      if (v6) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  v10 = -[NSDateInterval initWithStartDate:endDate:](v8, "initWithStartDate:endDate:", v9, v17);

  if (!v6) {
LABEL_4:
  }

LABEL_5:
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEORequestCounterServer");
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138478083;
    v21 = v14;
    __int16 v22 = 2113;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{private}@ got in %{private}@", buf, 0x16u);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](&OBJC_CLASS___GEORequestCounter, "sharedCounter"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100006734;
  v18[3] = &unk_100059110;
  id v19 = v4;
  id v16 = v4;
  [v15 readRequestLogsDuring:v10 handler:v18];
}

- (void)clearWithMessage:(id)a3
{
  id v4 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](&OBJC_CLASS___GEORequestCounter, "sharedCounter"));
  [v3 clearCounters];

  [v4 sendReply:0];
}

- (void)runBackgroundTask:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  GEOBackgroundTaskReportReportTaskInitiated();

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v7 = [v6 isEqualToString:GEORequestCounterPowerLoggerBackgroundTaskIdentifier];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[GEORequestCountPowerLogger sharedInstance]( &OBJC_CLASS___GEORequestCountPowerLogger,  "sharedInstance"));
    [v8 flushToPowerLog];

    [v4 setTaskCompleted];
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___GEORequestCounterServer;
    -[GEORequestCounterServer runBackgroundTask:](&v9, "runBackgroundTask:", v4);
  }
}

- (void)readProactiveTileDownloadsWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"since"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](&OBJC_CLASS___GEORequestCounter, "sharedCounter"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100006A28;
  v8[3] = &unk_100059110;
  id v9 = v3;
  id v7 = v3;
  [v6 readProactiveTileDownloadsSince:v5 handler:v8];
}

- (void)recordRoutePreloadSessionWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"start"]);
  id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(unint64_t)[v5 unsignedIntegerValue]));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"end"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(unint64_t)[v7 unsignedIntegerValue]));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"transport_type"]);
  id v11 = [v10 integerValue];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"tiles_preloaded"]);
  id v14 = [v13 unsignedIntegerValue];

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"tiles_used"]);
  id v17 = [v16 unsignedIntegerValue];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"tiles_missed"]);
  id v20 = [v19 unsignedIntegerValue];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](&OBJC_CLASS___GEORequestCounter, "sharedCounter"));
  __int16 v22 = -[NSDateInterval initWithStartDate:endDate:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:endDate:",  v23,  v8);
  [v21 recordRoutePreloadSessionAt:v22 transportType:v11 tilesPreloaded:v14 tilesUsed:v17 tilesMissed:v20];
}

- (void)fetchRoutePreloadSessionsWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"since"]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(unint64_t)[v5 unsignedIntegerValue]));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](&OBJC_CLASS___GEORequestCounter, "sharedCounter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100006E70;
  v10[3] = &unk_100059138;
  id v11 = v3;
  id v8 = v3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GEOXPCConnection defaultXPCServerConnectionQueue]( &OBJC_CLASS___GEOXPCConnection,  "defaultXPCServerConnectionQueue"));
  [v7 fetchRoutePreloadSessionsFrom:v6 completion:v10 completionQueue:v9];
}

- (void)externalIncrementWithRequest:(id)a3
{
  id v13 = (id)objc_claimAutoreleasedReturnValue([a3 info]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[GEORequestCounterPersistence sharedInstance]( &OBJC_CLASS___GEORequestCounterPersistence,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v13 appId]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v13 startTime]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v13 endTime]);
  id v7 = [v13 xmitBytes];
  id v8 = [v13 recvBytes];
  id v9 = [v13 usedInterface];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v13 requestType]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 requestSubtype]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v13 source]);
  [v3 incrementExternalForApp:v4 startTime:v5 endTime:v6 xmitBytes:v7 recvBytes:v8 usedInterfaces:v9 requestType:v10 requestSubtype:v11 source:v12];
}

- (void)externalCountWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[GEORequestCounterPersistence sharedInstance]( &OBJC_CLASS___GEORequestCounterPersistence,  "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100007120;
  v6[3] = &unk_100059138;
  id v7 = v3;
  id v5 = v3;
  [v4 externalRequestsCount:v6];
}

- (void)addCacheResultWithRequest:(id)a3
{
  id v3 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](&OBJC_CLASS___GEORequestCounter, "sharedCounter"));
  id v4 = [v3 result];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 appId]);
  id v6 = [v3 requestKindRaw];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 timestamp]);

  [v8 placeCacheRegisterCacheResult:v4 forApp:v5 requestType:v6 timestamp:v7];
}

- (void)getCacheResultsWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [[GEORequestCounterCacheGetResultsReply alloc] initWithRequest:v3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 startTime]);
  if (v5)
  {
  }

  else
  {
    id v6 = (NSDateInterval *)objc_claimAutoreleasedReturnValue([v3 endTime]);

    if (!v6) {
      goto LABEL_12;
    }
  }

  id v7 = objc_alloc(&OBJC_CLASS___NSDateInterval);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 startTime]);
  id v9 = v8;
  if (!v8) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 endTime]);
  if (v10)
  {
    id v6 = -[NSDateInterval initWithStartDate:endDate:](v7, "initWithStartDate:endDate:", v9, v10);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    id v6 = -[NSDateInterval initWithStartDate:endDate:](v7, "initWithStartDate:endDate:", v9, v11);
  }

  if (!v8) {
LABEL_12:
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](&OBJC_CLASS___GEORequestCounter, "sharedCounter"));
  id v13 = [v3 mode];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 appId]);
  id v15 = [v3 requestKindRaw];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100007410;
  v17[3] = &unk_100059110;
  id v18 = v4;
  id v16 = v4;
  [v12 placeCacheGetCounts:v13 forApp:v14 inTimeRange:v6 ofType:v15 handler:v17];
}

+ (id)identifier
{
  return @"requestCounter";
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_10005E610;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  BOOL v16 = 0;
  if (v13 > 1561)
  {
    if (v13 > 2614)
    {
      switch(v13)
      {
        case 2615:
          if (sub_100012B28(v12, v11, @"requestCounter", v10, &off_10005E6B8, 0LL))
          {
            id v38 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
            id v18 = v38;
            BOOL v16 = v38 != 0LL;
            if (v38)
            {
              [v38 setSignpostId:a6];
              -[GEORequestCounterServer fetchRoutePreloadSessionsWithMessage:]( self,  "fetchRoutePreloadSessionsWithMessage:",  v18);
              goto LABEL_48;
            }

            goto LABEL_49;
          }

          goto LABEL_50;
        case 2617:
          if (sub_100012B28(v12, v11, @"requestCounter", v10, &off_10005E6A0, 0LL))
          {
            id v39 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
            id v18 = v39;
            BOOL v16 = v39 != 0LL;
            if (v39)
            {
              [v39 setSignpostId:a6];
              -[GEORequestCounterServer recordRoutePreloadSessionWithMessage:]( self,  "recordRoutePreloadSessionWithMessage:",  v18);
              goto LABEL_48;
            }

            goto LABEL_49;
          }

          goto LABEL_50;
        case 2690:
          if (sub_100012B28(v12, v11, @"requestCounter", v10, &off_10005E688, 0LL))
          {
            id v25 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
            id v18 = v25;
            BOOL v16 = v25 != 0LL;
            if (v25)
            {
              [v25 setSignpostId:a6];
              -[GEORequestCounterServer readProactiveTileDownloadsWithMessage:]( self,  "readProactiveTileDownloadsWithMessage:",  v18);
              goto LABEL_48;
            }

            goto LABEL_49;
          }

          goto LABEL_50;
      }
    }

    else
    {
      switch(v13)
      {
        case 1562:
          if (sub_100012B28(v12, v11, @"requestCounter", v10, &off_10005E658, 0LL))
          {
            id v28 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
            id v18 = v28;
            BOOL v16 = v28 != 0LL;
            if (v28)
            {
              [v28 setSignpostId:a6];
              -[GEORequestCounterServer readRequestLogsWithMessage:](self, "readRequestLogsWithMessage:", v18);
              goto LABEL_48;
            }

            goto LABEL_49;
          }

          goto LABEL_50;
        case 1800:
          uint64_t v29 = objc_opt_class(&OBJC_CLASS___GEOExternalRequestCounterIncrementRequest, v14, v15);
          id v30 = sub_100012270(@"requestCounter", v10, v11, v29, v12);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          id v18 = v31;
          BOOL v16 = v31 != 0LL;
          if (v31)
          {
            [v31 setSignpostId:a6];
            -[GEORequestCounterServer externalIncrementWithRequest:](self, "externalIncrementWithRequest:", v18);
            goto LABEL_48;
          }

          goto LABEL_49;
        case 1866:
          if (sub_100012B28(v12, v11, @"requestCounter", v10, &off_10005E628, 0LL))
          {
            id v19 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
            id v18 = v19;
            BOOL v16 = v19 != 0LL;
            if (v19)
            {
              [v19 setSignpostId:a6];
              -[GEORequestCounterServer setCountersEnabledWithMessage:](self, "setCountersEnabledWithMessage:", v18);
              goto LABEL_48;
            }

@end