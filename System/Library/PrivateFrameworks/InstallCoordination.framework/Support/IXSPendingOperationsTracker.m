@interface IXSPendingOperationsTracker
+ (id)sharedInstance;
- (BOOL)_deserializeKeyedArchiveFromData:(id)a3 atURL:(id)a4;
- (BOOL)_deserializePlistFormatFromData:(id)a3 atURL:(id)a4;
- (IXSPendingOperationsTracker)init;
- (IXSPendingOperationsTracker)initWithSentinelPathOverride:(id)a3;
- (NSMutableSet)pendingOperationIdentities;
- (NSSet)pendingWorkIdentities;
- (NSURL)sentinelPath;
- (OS_dispatch_queue)internalQueue;
- (void)_deserializePendingOperationIdentities;
- (void)_onQueue_writePendingWork;
- (void)beginPendingOperationForIdentity:(id)a3;
- (void)clearAllPendingOperations;
- (void)endPendingOperationForIdentity:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setPendingOperationIdentities:(id)a3;
@end

@implementation IXSPendingOperationsTracker

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100031E88;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8F28 != -1) {
    dispatch_once(&qword_1000E8F28, block);
  }
  return (id)qword_1000E8F20;
}

- (NSURL)sentinelPath
{
  sentinelPath = self->_sentinelPath;
  if (sentinelPath)
  {
    v3 = sentinelPath;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataDirectoryAbortingOnError]);

    v3 = (NSURL *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"PendingWork.plist" isDirectory:0]);
  }

  return v3;
}

- (BOOL)_deserializePlistFormatFromData:(id)a3 atURL:(id)a4
{
  id v6 = a4;
  id v19 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a3,  0LL,  0LL,  &v19));
  id v8 = v19;
  if (!v7)
  {
    v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10007E6AC();
    }
    goto LABEL_8;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v10 = v7;
  if ((objc_opt_isKindOfClass(v10, v9) & 1) == 0)
  {
LABEL_8:
    BOOL v16 = 0;
    goto LABEL_11;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", @"BundleIDs"));
  if (v11 && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString), sub_1000728D0(v11, v12)))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[IXApplicationIdentity identitiesForBundleIdentifiers:]( &OBJC_CLASS___IXApplicationIdentity,  "identitiesForBundleIdentifiers:",  v11));
    v14 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v13);
    pendingOperationIdentities = self->_pendingOperationIdentities;
    self->_pendingOperationIdentities = v14;

    BOOL v16 = 1;
  }

  else
  {
    BOOL v16 = 0;
  }

LABEL_11:
  return v16;
}

- (BOOL)_deserializeKeyedArchiveFromData:(id)a3 atURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v15 = 0LL;
  id v8 = +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedArrayOfObjectsOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___IXApplicationIdentity),  v7,  &v15);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = v15;
  if (v9)
  {
    v11 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v9);
    pendingOperationIdentities = self->_pendingOperationIdentities;
    self->_pendingOperationIdentities = v11;
  }

  else
  {
    v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    pendingOperationIdentities = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)pendingOperationIdentities, OS_LOG_TYPE_ERROR)) {
      sub_10007E734((uint64_t)v6, (uint64_t)v10, (os_log_t)pendingOperationIdentities);
    }
  }

  return v9 != 0LL;
}

- (void)_deserializePendingOperationIdentities
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPendingOperationsTracker sentinelPath](self, "sentinelPath"));
  id v15 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v3,  3LL,  &v15));
  id v5 = v15;
  id v6 = v5;
  if (!v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    if ([v7 isEqualToString:NSCocoaErrorDomain])
    {
      id v8 = [v6 code];

      if (v8 == (id)260)
      {
        uint64_t v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v17 = "-[IXSPendingOperationsTracker _deserializePendingOperationIdentities]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: No pending work found", buf, 0xCu);
        }

- (IXSPendingOperationsTracker)init
{
  return -[IXSPendingOperationsTracker initWithSentinelPathOverride:](self, "initWithSentinelPathOverride:", 0LL);
}

- (IXSPendingOperationsTracker)initWithSentinelPathOverride:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IXSPendingOperationsTracker;
  id v6 = -[IXSPendingOperationsTracker init](&v12, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.installcoordinationd.pending_operations", v8);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_sentinelPath, a3);
    -[IXSPendingOperationsTracker _deserializePendingOperationIdentities](v6, "_deserializePendingOperationIdentities");
  }

  return v6;
}

- (void)_onQueue_writePendingWork
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSPendingOperationsTracker internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPendingOperationsTracker sentinelPath](self, "sentinelPath"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPendingOperationsTracker pendingOperationIdentities](self, "pendingOperationIdentities"));
  id v6 = [v5 count];

  if (v6)
  {
    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPendingOperationsTracker pendingOperationIdentities](self, "pendingOperationIdentities"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
    id v26 = 0LL;
    dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v26));
    id v10 = v26;

    if (v9)
    {
      id v25 = v10;
      unsigned __int8 v11 = [v9 writeToURL:v4 options:268435457 error:&v25];
      id v12 = v25;

      if ((v11 & 1) != 0)
      {
LABEL_13:

        goto LABEL_14;
      }

      v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10007E950();
      }
      id v10 = v12;
    }

    else
    {
      v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10007E8D8((uint64_t)v10, v14, v19, v20, v21, v22, v23, v24);
      }
    }

    id v12 = v10;
    goto LABEL_13;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v27 = 0LL;
  uint64_t v16 = [v15 removeItemAtURL:v4 error:&v27];
  id v12 = v27;

  if ((v16 & 1) == 0)
  {
    v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_10007E850();
    }
    goto LABEL_13;
  }

- (void)beginPendingOperationForIdentity:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSPendingOperationsTracker internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000326EC;
  block[3] = &unk_1000CCCB8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)endPendingOperationForIdentity:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSPendingOperationsTracker internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000328C0;
  block[3] = &unk_1000CCCB8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (NSSet)pendingWorkIdentities
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_100032ADC;
  unsigned __int8 v11 = sub_100032AEC;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSPendingOperationsTracker internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100032AF4;
  v6[3] = &unk_1000CCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (void)clearAllPendingOperations
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSPendingOperationsTracker internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032BB0;
  block[3] = &unk_1000CCE58;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (NSMutableSet)pendingOperationIdentities
{
  return self->_pendingOperationIdentities;
}

- (void)setPendingOperationIdentities:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end