@interface ICDCloudBadgeService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDCloudBadgeService)init;
- (OS_dispatch_queue)serialQueue;
- (id)badgeActionMetricsEventForIdentifier:(id)a3;
- (id)badgeActionMetricsEventPathForIdentifier:(id)a3;
- (id)createBag;
- (void)clearBadgeActionMetricsEventForIdentifier:(id)a3;
- (void)enqueueMetricsEvent:(id)a3;
- (void)reportAppIconBadgeActionMetrics;
- (void)storeBadgeActionMetricsEvent:(id)a3 identifier:(id)a4;
@end

@implementation ICDCloudBadgeService

- (ICDCloudBadgeService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ICDCloudBadgeService;
  v2 = -[ICDCloudBadgeService init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloudd.ICCloudBadgeService.serial.queue", 0LL);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (id)createBag
{
  return +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"Music",  @"1");
}

- (id)badgeActionMetricsEventPathForIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MSVMobileHomeDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Library/Caches/com.apple.iTunesCloud/"]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"_badging_action_metric_event.plist"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v7]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));

  return v9;
}

- (id)badgeActionMetricsEventForIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[ICDCloudBadgeService badgeActionMetricsEventPathForIdentifier:]( self,  "badgeActionMetricsEventPathForIdentifier:",  a3));
  uint64_t v4 = v3;
  if (v3)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 path]);
    id v14 = 0LL;
    objc_super v6 = -[NSData initWithContentsOfFile:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfFile:options:error:",  v5,  0LL,  &v14);
    id v7 = v14;
    if (v6)
    {
      id v13 = 0LL;
      os_log_t v8 = (os_log_t)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v6,  0LL,  0LL,  &v13));
      id v9 = v13;

      if (v9)
      {
        v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v16 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CloudBadgeService: failed to deserialize stored action metrics event - error=%{public}@",  buf,  0xCu);
        }

        os_log_t v11 = 0LL;
      }

      else
      {
        os_log_t v8 = v8;
        os_log_t v11 = v8;
      }
    }

    else
    {
      os_log_t v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CloudBadgeService: Failed to read badge action metrics either because there are none, or the file is corrupt - error=%{public}@",  buf,  0xCu);
      }

      os_log_t v11 = 0LL;
      id v9 = v7;
    }
  }

  else
  {
    v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "CloudBadgeService: Failed to generate badge action path",  buf,  2u);
    }

    os_log_t v11 = 0LL;
  }

  return v11;
}

- (void)enqueueMetricsEvent:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDCloudBadgeService createBag](self, "createBag"));
  id v5 = [[AMSEngagement alloc] initWithBag:v4];
  id v6 = [v5 enqueueData:v7];
}

- (void)clearBadgeActionMetricsEventForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[ICDCloudBadgeService badgeActionMetricsEventPathForIdentifier:]( self,  "badgeActionMetricsEventPathForIdentifier:",  v4));
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v9 = [v8 fileExistsAtPath:v7];

    if ((v9 & 1) == 0)
    {
      v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "CloudBadgeService: No stored action metrics event",  buf,  2u);
      }

      goto LABEL_16;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v19 = 0LL;
    unsigned int v11 = [v10 removeItemAtPath:v7 error:&v19];
    v12 = (os_log_s *)v19;

    if (v11)
    {
      id v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v4;
        id v14 = "CloudBadgeService: Cleared %{public}@ badging action metrics event";
        v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
LABEL_13:
        uint32_t v18 = 12;
        goto LABEL_14;
      }
    }

    else
    {
      id v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
      BOOL v17 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v17)
        {
          *(_DWORD *)buf = 138543618;
          id v21 = v4;
          __int16 v22 = 2114;
          v23 = v12;
          id v14 = "CloudBadgeService: failed to clear stored %{public}@ action metrics event - error=%{public}@";
          v15 = v13;
          os_log_type_t v16 = OS_LOG_TYPE_ERROR;
          uint32_t v18 = 22;
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v18);
        }
      }

      else if (v17)
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v4;
        id v14 = "CloudBadgeService: failed to clear stored %{public}@ action metrics event without an error";
        v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        goto LABEL_13;
      }
    }

LABEL_16:
  }
}

- (void)storeBadgeActionMetricsEvent:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[ICDCloudBadgeService badgeActionMetricsEventPathForIdentifier:]( self,  "badgeActionMetricsEventPathForIdentifier:",  v7));
    if (!v8)
    {
LABEL_16:

      goto LABEL_17;
    }

    id v21 = 0LL;
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  200LL,  0LL,  &v21));
    id v10 = v21;
    if (v10)
    {
      id v11 = v10;
      v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "CloudBadgeService: failed to serialize action metrics event - error=%{public}@",  buf,  0xCu);
      }

      goto LABEL_15;
    }

    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 path]);
    id v20 = 0LL;
    unsigned int v13 = [v9 writeToFile:v12 options:1 error:&v20];
    id v11 = v20;
    if (v13)
    {
      id v14 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v7;
        v15 = "CloudBadgeService: Stored %{public}@ badging action metrics event";
        os_log_type_t v16 = v14;
        os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
LABEL_12:
        uint32_t v19 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, v19);
      }
    }

    else
    {
      id v14 = os_log_create("com.apple.amp.itunescloudd", "Default");
      BOOL v18 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (!v11)
      {
        if (!v18) {
          goto LABEL_14;
        }
        *(_WORD *)buf = 0;
        v15 = "CloudBadgeService: failed to store action metrics event without an error";
        os_log_type_t v16 = v14;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        uint32_t v19 = 2;
        goto LABEL_13;
      }

      if (v18)
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v11;
        v15 = "CloudBadgeService: failed to store action metrics event - error=%{public}@";
        os_log_type_t v16 = v14;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = objc_msgSend(v5, "icd_isConnectionAllowedForService:", 7);
  if (v6)
  {
    unsigned int v7 = [v5 processIdentifier];
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(v13, 0, sizeof(v13));
    }
    uint64_t v8 = MSVBundleIDForAuditToken(v13);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v15 = self;
      __int16 v16 = 2114;
      os_log_type_t v17 = v9;
      __int16 v18 = 1024;
      unsigned int v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ICCloudReportBadgeActionRequest %p - XPC connection from %{public}@[%d]",  buf,  0x1Cu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ICCloudBadgingProtocol));
    [v5 setExportedInterface:v11];
    [v5 setExportedObject:self];
    [v5 resume];
  }

  return v6;
}

- (void)reportAppIconBadgeActionMetrics
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDCloudBadgeService serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CA6B4;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
}

@end