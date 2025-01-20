@interface CKKSControlCLI
- (CKKSControl)control;
- (CKKSControlCLI)initWithCKKSControl:(id)a3;
- (id)fetchPerformanceCounters;
- (id)fetchStatus:(id)a3;
- (id)parseJSON:(Class)a3 name:(id)a4 json:(id)a5;
- (int)deleteSEZone:(id)a3;
- (int)fetchSEView:(id)a3 json:(BOOL)a4;
- (int)modifySEZone:(id)a3 tlkShareJsonStrings:(id)a4 deletetlkShareJsonStrings:(id)a5;
- (int)proposeSETLK:(id)a3 tlkJson:(id)a4 oldTlkJson:(id)a5 tlkShareJsonStrings:(id)a6;
- (int)toggleHavoc;
- (int64_t)ckmetric;
- (int64_t)fetch:(id)a3;
- (int64_t)push:(id)a3;
- (int64_t)resetCloudKit:(id)a3;
- (int64_t)resetLocal:(id)a3;
- (int64_t)resync:(id)a3;
- (void)printHumanReadableStatus:(id)a3 shortenOutput:(BOOL)a4;
- (void)setControl:(id)a3;
@end

@implementation CKKSControlCLI

- (CKKSControlCLI)initWithCKKSControl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSControlCLI;
  v6 = -[CKKSControlCLI init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_control, a3);
  }

  return v7;
}

- (id)fetchPerformanceCounters
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_100008A48;
  v15 = &unk_10000C358;
  v6 = v3;
  v16 = v6;
  v7 = v4;
  v17 = v7;
  [v5 rpcPerformanceCounters:&v12];

  dispatch_time_t v8 = dispatch_time(0LL, 60000000000LL);
  if (dispatch_semaphore_wait(v7, v8)) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  @"timed out waiting for response",  @"error",  v12,  v13,  v14,  v15,  v16);
  }
  objc_super v9 = v17;
  v10 = v6;

  return v10;
}

- (int64_t)resetLocal:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (v4)
  {
    id v6 = objc_claimAutoreleasedReturnValue([v4 description]);
    printf("Beginning local reset for %s...\n", (const char *)[v6 UTF8String]);
  }

  else
  {
    printf("Beginning local reset for %s...\n", "all zones");
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000089D4;
  v16[3] = &unk_10000C380;
  v18 = &v19;
  objc_super v9 = v7;
  v17 = v9;
  [v8 rpcResetLocal:v5 reply:v16];

  dispatch_time_t v10 = dispatch_time(0LL, 180000000000LL);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    uint64_t v11 = secLogObjForScope("ckkscontrol");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for reset-local response",  buf,  2u);
    }

    int64_t v13 = -1LL;
  }

  else
  {
    int64_t v13 = v20[3];
  }

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (int64_t)resetCloudKit:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (v4)
  {
    id v6 = objc_claimAutoreleasedReturnValue([v4 description]);
    printf("Beginning CloudKit reset for %s...\n", (const char *)[v6 UTF8String]);
  }

  else
  {
    printf("Beginning CloudKit reset for %s...\n", "all CKKS-managed zones");
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100008960;
  v16[3] = &unk_10000C380;
  v18 = &v19;
  objc_super v9 = v7;
  v17 = v9;
  [v8 rpcResetCloudKit:v5 reason:@"ckksctl" reply:v16];

  dispatch_time_t v10 = dispatch_time(0LL, 300000000000LL);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    uint64_t v11 = secLogObjForScope("ckkscontrol");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for reset-cloudkit response",  buf,  2u);
    }

    int64_t v13 = -1LL;
  }

  else
  {
    int64_t v13 = v20[3];
  }

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (int64_t)resync:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (v4)
  {
    id v6 = objc_claimAutoreleasedReturnValue([v4 description]);
    printf("Beginning resync for %s...\n", (const char *)[v6 UTF8String]);
  }

  else
  {
    printf("Beginning resync for %s...\n", "all zones");
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000088EC;
  v16[3] = &unk_10000C380;
  v18 = &v19;
  objc_super v9 = v7;
  v17 = v9;
  [v8 rpcResync:v5 reply:v16];

  dispatch_time_t v10 = dispatch_time(0LL, 300000000000LL);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    uint64_t v11 = secLogObjForScope("ckkscontrol");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for resync response",  buf,  2u);
    }

    int64_t v13 = -1LL;
  }

  else
  {
    int64_t v13 = v20[3];
  }

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (id)fetchStatus:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100008758;
  v17[3] = &unk_10000C3A8;
  dispatch_time_t v8 = v5;
  v18 = v8;
  objc_super v9 = v6;
  uint64_t v19 = v9;
  [v7 rpcStatus:v4 reply:v17];

  dispatch_time_t v10 = dispatch_time(0LL, 45000000000LL);
  if (dispatch_semaphore_wait(v9, v10))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  @"timed out",  @"error");
    uint64_t v11 = secLogObjForScope("ckkscontrol");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for status response",  (uint8_t *)v16,  2u);
    }
  }

  int64_t v13 = v19;
  v14 = v8;

  return v14;
}

- (void)printHumanReadableStatus:(id)a3 shortenOutput:(BOOL)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100006D5C;
  v14[3] = &unk_10000C3D0;
  BOOL v16 = a4;
  objc_super v9 = v7;
  v15 = v9;
  [v8 rpcStatus:v6 reply:v14];

  dispatch_time_t v10 = dispatch_time(0LL, 45000000000LL);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    uint64_t v11 = secLogObjForScope("ckkscontrol");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for status response",  v13,  2u);
    }
  }
}

- (int64_t)fetch:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100006CBC;
  v14[3] = &unk_10000C380;
  BOOL v16 = &v17;
  dispatch_semaphore_t v7 = v5;
  v15 = v7;
  [v6 rpcFetchAndProcessChanges:v4 reply:v14];

  dispatch_time_t v8 = dispatch_time(0LL, 150000000000LL);
  if (dispatch_semaphore_wait(v7, v8))
  {
    puts("\n\nError: timed out waiting for response");
    uint64_t v9 = secLogObjForScope("ckkscontrol");
    dispatch_time_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for fetch response",  v13,  2u);
    }

    int64_t v11 = -1LL;
  }

  else
  {
    int64_t v11 = v18[3];
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (int64_t)push:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100006C1C;
  v14[3] = &unk_10000C380;
  BOOL v16 = &v17;
  dispatch_semaphore_t v7 = v5;
  v15 = v7;
  [v6 rpcPushOutgoingChanges:v4 reply:v14];

  dispatch_time_t v8 = dispatch_time(0LL, 150000000000LL);
  if (dispatch_semaphore_wait(v7, v8))
  {
    puts("\n\nError: timed out waiting for response");
    uint64_t v9 = secLogObjForScope("ckkscontrol");
    dispatch_time_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for push response",  v13,  2u);
    }

    int64_t v11 = -1LL;
  }

  else
  {
    int64_t v11 = v18[3];
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (int64_t)ckmetric
{
  uint64_t v15 = 0LL;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100006B7C;
  v12[3] = &unk_10000C380;
  v14 = &v15;
  dispatch_semaphore_t v5 = v3;
  int64_t v13 = v5;
  [v4 rpcCKMetric:@"testMetric" attributes:&off_10000CD68 reply:v12];

  dispatch_time_t v6 = dispatch_time(0LL, 65000000000LL);
  if (dispatch_semaphore_wait(v5, v6))
  {
    puts("\n\nError: timed out waiting for response");
    uint64_t v7 = secLogObjForScope("ckkscontrol");
    dispatch_time_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for ckmetric response",  v11,  2u);
    }

    int64_t v9 = -1LL;
  }

  else
  {
    int64_t v9 = v16[3];
  }

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)parseJSON:(Class)a3 name:(id)a4 json:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);
  id v21 = 0LL;
  dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v9,  0LL,  &v21));
  id v11 = v21;

  if (v10) {
    BOOL v12 = v11 == 0LL;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    int64_t v13 = (const char *)[v7 UTF8String];
    id v14 = objc_claimAutoreleasedReturnValue([v11 description]);
    printf("Unable to parse %s as JSON: %s\n", v13, (const char *)[v14 UTF8String]);
LABEL_9:
    BOOL v16 = 0LL;
    goto LABEL_10;
  }

  id v20 = 0LL;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class parseFromJSONDict:error:](a3, "parseFromJSONDict:error:", v10, &v20));
  id v11 = v20;
  if (!v15)
  {
    uint64_t v17 = (const char *)[v7 UTF8String];
    id v18 = objc_claimAutoreleasedReturnValue([v11 description]);
    printf("Unable to parse %s from JSON: %s\n", v17, (const char *)[v18 UTF8String]);

    printf("JSON: %s\n", (const char *)[v8 UTF8String]);
    id v14 = 0LL;
    goto LABEL_9;
  }

  id v14 = v15;
  BOOL v16 = v14;
LABEL_10:

  return v16;
}

- (int)proposeSETLK:(id)a3 tlkJson:(id)a4 oldTlkJson:(id)a5 tlkShareJsonStrings:(id)a6
{
  id v29 = a3;
  id v10 = a4;
  id v31 = a5;
  id v30 = a6;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  int v43 = 1;
  id v11 = -[CKKSControlCLI parseJSON:name:json:]( self,  "parseJSON:name:json:",  objc_opt_class(&OBJC_CLASS___CKKSExternalKey),  @"TLK",  v10);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (!v12) {
    goto LABEL_4;
  }
  if (v31)
  {
    id v13 = -[CKKSControlCLI parseJSON:name:json:]( self,  "parseJSON:name:json:",  objc_opt_class(&OBJC_CLASS___CKKSExternalKey),  @"old TLK",  v31);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (!v28)
    {
LABEL_4:
      int v14 = 1;
      goto LABEL_22;
    }
  }

  else
  {
    v28 = 0LL;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  BOOL v16 = (dispatch_semaphore_s *)v30;
  id v17 = -[dispatch_semaphore_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v36,  v44,  16LL);
  if (v17)
  {
    uint64_t v18 = *(void *)v37;
    while (2)
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v16);
        }
        id v20 = -[CKKSControlCLI parseJSON:name:json:]( self,  "parseJSON:name:json:",  objc_opt_class(&OBJC_CLASS___CKKSExternalTLKShare),  @"TLKShare",  *(void *)(*((void *)&v36 + 1) + 8LL * (void)i));
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (!v21)
        {
          int v14 = 1;
          goto LABEL_21;
        }

        [v15 addObject:v21];
      }

      id v17 = -[dispatch_semaphore_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v36,  v44,  16LL);
      if (v17) {
        continue;
      }
      break;
    }
  }

  dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100006B08;
  v33[3] = &unk_10000C380;
  v35 = &v40;
  BOOL v16 = v22;
  v34 = v16;
  [v23 proposeTLKForSEView:v29 proposedTLK:v12 wrappedOldTLK:0 tlkShares:v15 reply:v33];

  dispatch_time_t v24 = dispatch_time(0LL, 150000000000LL);
  if (dispatch_semaphore_wait(v16, v24))
  {
    puts("\n\nError: timed out waiting for response");
    uint64_t v25 = secLogObjForScope("ckkscontrol");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for proposeSETLK response",  buf,  2u);
    }

    int v14 = -1;
  }

  else
  {
    int v14 = *((_DWORD *)v41 + 6);
  }

LABEL_21:
LABEL_22:

  _Block_object_dispose(&v40, 8);
  return v14;
}

- (int)fetchSEView:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  int v23 = 1;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100006040;
  v16[3] = &unk_10000C3F8;
  BOOL v19 = a4;
  uint64_t v18 = &v20;
  int64_t v9 = v7;
  id v17 = v9;
  [v8 fetchSEViewKeyHierarchy:v6 reply:v16];

  dispatch_time_t v10 = dispatch_time(0LL, 150000000000LL);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    uint64_t v11 = secLogObjForScope("ckkscontrol");
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for fetchSEView response",  v15,  2u);
    }

    int v13 = -1;
  }

  else
  {
    int v13 = *((_DWORD *)v21 + 6);
  }

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (int)modifySEZone:(id)a3 tlkShareJsonStrings:(id)a4 deletetlkShareJsonStrings:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v30 = a5;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  int v47 = 1;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v41;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = -[CKKSControlCLI parseJSON:name:json:]( self,  "parseJSON:name:json:",  objc_opt_class(&OBJC_CLASS___CKKSExternalTLKShare),  @"TLK Share",  *(void *)(*((void *)&v40 + 1) + 8LL * (void)i));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (!v15)
        {
          int v27 = 1;
          BOOL v16 = v10;
          goto LABEL_26;
        }

        [v9 addObject:v15];
      }

      id v11 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  obj = (dispatch_semaphore_s *)v30;
  id v17 = -[dispatch_semaphore_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
  if (v17)
  {
    uint64_t v18 = *(void *)v37;
    while (2)
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = -[CKKSControlCLI parseJSON:name:json:]( self,  "parseJSON:name:json:",  objc_opt_class(&OBJC_CLASS___CKKSExternalTLKShare),  @"TLK Share",  *(void *)(*((void *)&v36 + 1) + 8LL * (void)j));
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (!v21)
        {
          int v27 = 1;
          goto LABEL_25;
        }

        [v16 addObject:v21];
      }

      id v17 = -[dispatch_semaphore_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
      if (v17) {
        continue;
      }
      break;
    }
  }

  dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
  int v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100005FCC;
  v33[3] = &unk_10000C380;
  v35 = &v44;
  obj = v22;
  v34 = obj;
  [v23 modifyTLKSharesForSEView:v29 adding:v9 deleting:v16 reply:v33];

  dispatch_time_t v24 = dispatch_time(0LL, 150000000000LL);
  if (dispatch_semaphore_wait(obj, v24))
  {
    puts("\n\nError: timed out waiting for response");
    uint64_t v25 = secLogObjForScope("ckkscontrol");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for modifySEZone response",  buf,  2u);
    }

    int v27 = -1;
  }

  else
  {
    int v27 = *((_DWORD *)v45 + 6);
  }

LABEL_25:
LABEL_26:

  _Block_object_dispose(&v44, 8);
  return v27;
}

- (int)deleteSEZone:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 1;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100005F58;
  v14[3] = &unk_10000C380;
  BOOL v16 = &v17;
  dispatch_semaphore_t v7 = v5;
  uint64_t v15 = v7;
  [v6 deleteSEView:v4 reply:v14];

  dispatch_time_t v8 = dispatch_time(0LL, 150000000000LL);
  if (dispatch_semaphore_wait(v7, v8))
  {
    puts("\n\nError: timed out waiting for response");
    uint64_t v9 = secLogObjForScope("ckkscontrol");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for deleteSEZone response",  v13,  2u);
    }

    int v11 = -1;
  }

  else
  {
    int v11 = *((_DWORD *)v18 + 6);
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (int)toggleHavoc
{
  uint64_t v12 = 0LL;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = 1;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI control](self, "control"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100005EC0;
  v9[3] = &unk_10000C420;
  int v11 = &v12;
  dispatch_semaphore_t v5 = v3;
  id v10 = v5;
  [v4 toggleHavoc:v9];

  dispatch_time_t v6 = dispatch_time(0LL, 65000000000LL);
  if (dispatch_semaphore_wait(v5, v6))
  {
    puts("\n\nError: timed out waiting for response");
    int v7 = -1;
  }

  else
  {
    int v7 = *((_DWORD *)v13 + 6);
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (CKKSControl)control
{
  return (CKKSControl *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setControl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end