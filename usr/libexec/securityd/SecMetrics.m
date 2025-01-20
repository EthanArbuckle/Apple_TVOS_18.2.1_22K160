@interface SecMetrics
+ (id)c2MetricsEndpoint;
+ (id)managerObject;
- (NSMutableDictionary)taskMap;
- (NSURLSession)URLSession;
- (OS_os_transaction)transaction;
- (SecMetrics)init;
- (id)generateDeviceInfo;
- (id)getEvent:(id)a3;
- (id)gzipEncode:(id)a3;
- (id)requestForGenericEvent:(id)a3;
- (int64_t)lostEvents;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)sendEvent:(id)a3 pushTopic:(id)a4;
- (void)setLostEvents:(int64_t)a3;
- (void)setTaskMap:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setURLSession:(id)a3;
- (void)submitEvent:(id)a3;
@end

@implementation SecMetrics

- (SecMetrics)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SecMetrics;
  v2 = -[SecMetrics init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v3,  v2,  0LL));
    -[SecMetrics setURLSession:](v2, "setURLSession:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[SecMetrics setTaskMap:](v2, "setTaskMap:", v5);

    v6 = v2;
  }

  return v2;
}

- (void)submitEvent:(id)a3
{
}

- (void)sendEvent:(id)a3 pushTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v8, "taskMap"));
  id v10 = [v9 count];

  if ((unint64_t)v10 < 6)
  {
    objc_sync_exit(v8);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 genericEvent]);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics requestForGenericEvent:](v8, "requestForGenericEvent:", v12));
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics URLSession](v8, "URLSession"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dataTaskWithRequest:v13]);

        if (v7) {
          objc_msgSend(v15, "set_APSRelayTopic:", v7);
        }
        v16 = v8;
        objc_sync_enter(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v16, "taskMap"));
        id v18 = [v17 count];

        if (!v18)
        {
          v19 = (void *)os_transaction_create("com.apple.security.c2metric.upload");
          -[SecMetrics setTransaction:](v16, "setTransaction:", v19);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v16, "taskMap"));
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v15 taskIdentifier]));
        [v20 setObject:v6 forKeyedSubscript:v21];

        objc_sync_exit(v16);
        [v15 resume];
      }
    }
  }

  else
  {
    -[SecMetrics setLostEvents:](v8, "setLostEvents:", (char *)-[SecMetrics lostEvents](v8, "lostEvents") + 1);
    objc_sync_exit(v8);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 eventName]);
      int v22 = 138412290;
      v23 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "metrics %@ dropped on floor since too many are pending",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (id)getEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v5, "taskMap"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 taskIdentifier]));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

  objc_sync_exit(v5);
  return v8;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics getEvent:](self, "getEvent:", v9));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 eventName]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 originalRequest]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 URL]);
    if (v10) {
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 description]);
    }
    else {
      v15 = @"success";
    }
    int v26 = 138412802;
    v27 = v12;
    __int16 v28 = 2112;
    v29 = v14;
    __int16 v30 = 2112;
    v31 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "metrics %@ transfer %@ completed with: %@",  (uint8_t *)&v26,  0x20u);
    if (v10) {
  }
    }

  v16 = self;
  objc_sync_enter(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v16, "taskMap"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 taskIdentifier]));
  [v17 removeObjectForKey:v18];

  int64_t v19 = -[SecMetrics lostEvents](v16, "lostEvents");
  if (v10 || v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    if (-[SecMetrics lostEvents](v16, "lostEvents"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  -[SecMetrics lostEvents](v16, "lostEvents")));
      [v20 setObject:v21 forKeyedSubscript:@"counter"];
    }

    if (v10)
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 code]));
      [v20 setObject:v22 forKeyedSubscript:@"error_code"];

      v23 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
      [v20 setObject:v23 forKeyedSubscript:@"error_domain"];
    }

    +[SecCoreAnalytics sendEvent:event:]( &OBJC_CLASS___SecCoreAnalytics,  "sendEvent:event:",  @"com.apple.security.push.channel.dropped",  v20);
    -[SecMetrics setLostEvents:](v16, "setLostEvents:", 0LL);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics taskMap](v16, "taskMap"));
  BOOL v25 = [v24 count] == 0;

  if (v25) {
    -[SecMetrics setTransaction:](v16, "setTransaction:", 0LL);
  }
  objc_sync_exit(v16);
}

- (id)requestForGenericEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) c2MetricsEndpoint];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v6);
    if (v7)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___SECC2MPMetric);
      if (v8)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics generateDeviceInfo](self, "generateDeviceInfo"));
        -[SECC2MPMetric setDeviceInfo:](v8, "setDeviceInfo:", v9);

        -[SECC2MPMetric setReportFrequency:](v8, "setReportFrequency:", 0LL);
        -[SECC2MPMetric setReportFrequencyBase:](v8, "setReportFrequencyBase:", 0LL);
        -[SECC2MPMetric setMetricType:](v8, "setMetricType:", 201LL);
        -[SECC2MPMetric setGenericEvent:](v8, "setGenericEvent:", v4);
        id v10 = objc_alloc_init(&OBJC_CLASS___PBDataWriter);
        if (v10)
        {
          -[SECC2MPMetric writeTo:](v8, "writeTo:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue([v10 immutableData]);
          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecMetrics gzipEncode:](self, "gzipEncode:", v11));
            if (v12)
            {
              -[NSMutableURLRequest setHTTPMethod:](v7, "setHTTPMethod:", @"POST");
              -[NSMutableURLRequest setHTTPBody:](v7, "setHTTPBody:", v12);
              -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v7,  "setValue:forHTTPHeaderField:",  @"application/protobuf",  @"Content-Type");
              -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v7,  "setValue:forHTTPHeaderField:",  @"gzip",  @"Content-Encoding");
              v13 = v7;
            }

            else
            {
              v13 = 0LL;
            }
          }

          else
          {
            v13 = 0LL;
          }
        }

        else
        {
          v13 = 0LL;
        }
      }

      else
      {
        v13 = 0LL;
      }
    }

    else
    {
      v13 = 0LL;
    }
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)gzipEncode:(id)a3
{
  id v3 = a3;
  bzero(v10, 0x400uLL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v9.data_type = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v9.adler = v5;
  *(_OWORD *)&v9.avail_out = v5;
  *(_OWORD *)&v9.msg = v5;
  *(_OWORD *)&v9.next_in = v5;
  *(_OWORD *)&v9.total_in = v5;
  memset(&v9.zalloc, 0, 24);
  id v6 = 0LL;
  if (!deflateInit2_(&v9, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    id v7 = v3;
    v9.avail_in = objc_msgSend(v7, "length", objc_msgSend(v7, "bytes"));
    do
    {
      v9.avail_out = 1024;
      v9.next_out = v10;
      if (deflate(&v9, 4) == -2) {
        sub_10001BB24(@"Execution has encountered an unexpected state", 0x53C0000Eu);
      }
      [v4 appendBytes:v10 length:1024 - v9.avail_out];
    }

    while (!v9.avail_out);
    if (v9.avail_in) {
      sub_10001BB24(@"Execution has encountered an unexpected state", 0x53C0000Eu);
    }
    deflateEnd(&v9);
    id v6 = v4;
  }

  return v6;
}

- (id)generateDeviceInfo
{
  v2 = objc_alloc_init(&OBJC_CLASS___SECC2MPDeviceInfo);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo productName](&OBJC_CLASS___SecC2DeviceInfo, "productName"));
  -[SECC2MPDeviceInfo setProductName:](v2, "setProductName:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo productType](&OBJC_CLASS___SecC2DeviceInfo, "productType"));
  -[SECC2MPDeviceInfo setProductType:](v2, "setProductType:", v4);

  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo productVersion](&OBJC_CLASS___SecC2DeviceInfo, "productVersion"));
  -[SECC2MPDeviceInfo setProductVersion:](v2, "setProductVersion:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo buildVersion](&OBJC_CLASS___SecC2DeviceInfo, "buildVersion"));
  -[SECC2MPDeviceInfo setProductBuild:](v2, "setProductBuild:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo processName](&OBJC_CLASS___SecC2DeviceInfo, "processName"));
  -[SECC2MPDeviceInfo setProcessName:](v2, "setProcessName:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo processVersion](&OBJC_CLASS___SecC2DeviceInfo, "processVersion"));
  -[SECC2MPDeviceInfo setProcessVersion:](v2, "setProcessVersion:", v8);

  z_stream v9 = (void *)objc_claimAutoreleasedReturnValue(+[SecC2DeviceInfo processUUID](&OBJC_CLASS___SecC2DeviceInfo, "processUUID"));
  -[SECC2MPDeviceInfo setProcessUuid:](v2, "setProcessUuid:", v9);

  return v2;
}

- (NSMutableDictionary)taskMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTaskMap:(id)a3
{
}

- (NSURLSession)URLSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setURLSession:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (int64_t)lostEvents
{
  return self->_lostEvents;
}

- (void)setLostEvents:(int64_t)a3
{
  self->_lostEvents = a3;
}

- (void).cxx_destruct
{
}

+ (id)c2MetricsEndpoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));
  id v4 = v3;
  if (v3)
  {
    __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 propertiesForDataclass:ACAccountDataclassCKMetricsService]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"url"]);

    if (v6)
    {
      id v7 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](v7, "URLByAppendingPathComponent:", @"c2"));

      if (v8)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10011B5BC;
        block[3] = &unk_1002927F0;
        id v9 = v8;
        id v8 = v9;
        id v13 = v9;
        if (qword_1002DEBE0 == -1)
        {
          id v10 = v9;
        }

        else
        {
          dispatch_once(&qword_1002DEBE0, block);
          id v10 = v13;
        }
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

+ (id)managerObject
{
  if (qword_1002DEBF0 != -1) {
    dispatch_once(&qword_1002DEBF0, &stru_10028FE38);
  }
  return (id)qword_1002DEBE8;
}

@end