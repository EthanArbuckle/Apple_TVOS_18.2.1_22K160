@interface SDLogArchiveContainer
+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withTargetArchive:(id)a6 withDelegate:(id)a7;
+ (id)getWallTimeFromMetadata:(id)a3;
- (BOOL)execute;
- (BOOL)setLogArchiveUnit:(id)a3;
- (NSMutableDictionary)durationMetrics;
- (SDArchive)archive;
- (SDLogArchiveUnit)unit;
- (double)timeout;
- (void)addMetricsFromInfoPlist:(id)a3 forBook:(id)a4 withCurrentTime:(unint64_t)a5;
- (void)applyContainerOverride:(id)a3;
- (void)extractMetricsFromInfoPlist:(int)a3;
- (void)setArchive:(id)a3;
- (void)setDurationMetrics:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUnit:(id)a3;
@end

@implementation SDLogArchiveContainer

+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withTargetArchive:(id)a6 withDelegate:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = [objc_alloc((Class)a1) initWithName:v15 andDestination:v12 withDelegate:v14];

  if (v16)
  {
    [v16 setTimeout:a5];
    [v16 setDestination:v12];
    [v16 setArchive:v13];
    v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    [v16 setDurationMetrics:v17];
  }

  return v16;
}

- (BOOL)setLogArchiveUnit:(id)a3
{
  return 1;
}

+ (id)getWallTimeFromMetadata:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"OldestTimeRef"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"WallTime"]);

  return v4;
}

- (void)addMetricsFromInfoPlist:(id)a3 forBook:(id)a4 withCurrentTime:(unint64_t)a5
{
  id v25 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:@"Metadata"]);
  v11 = (void *)objc_opt_class(self, v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v9]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 getWallTimeFromMetadata:v12]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  a5 - (unint64_t)[v13 unsignedLongLongValue] / 0x3B9ACA00));
  id v15 = v8;
  if ([v15 isEqualToString:@"Persist"])
  {
    id v16 = (id *)&metricPersistLookback;
  }

  else if ([v15 isEqualToString:@"Special"])
  {
    id v16 = (id *)&metricSpecialLookback;
  }

  else
  {
    id v17 = v15;
    id v16 = (id *)&metricSignpostLookback;
  }

  id v17 = *v16;

  if (!v17) {
    goto LABEL_10;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer durationMetrics](self, "durationMetrics"));
  [v18 setObject:v14 forKeyedSubscript:v17];

LABEL_9:
LABEL_10:
  v19 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingString:@"SizeLimit"]);
  id v20 = v15;
  if ([v20 isEqualToString:@"Persist"])
  {
    v21 = (id *)&metricPersistSize;
  }

  else if ([v20 isEqualToString:@"Special"])
  {
    v21 = (id *)&metricSpecialSize;
  }

  else
  {
    id v22 = v20;
    if (![v20 isEqualToString:@"Signpost"])
    {
LABEL_18:

      goto LABEL_19;
    }

    v21 = (id *)&metricSignpostSize;
  }

  id v22 = *v21;

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v19]);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer durationMetrics](self, "durationMetrics"));
    [v24 setObject:v23 forKeyedSubscript:v22];

    goto LABEL_18;
  }

- (void)extractMetricsFromInfoPlist:(int)a3
{
  v4 = -[NSFileHandle initWithFileDescriptor:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:",  *(void *)&a3);
  v5 = v4;
  if (v4)
  {
    id v36 = 0LL;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileHandle readDataUpToLength:error:](v4, "readDataUpToLength:error:", 0x400000LL, &v36));
    id v7 = v36;
    if (v7)
    {
      id v8 = v7;
      v9 = sub_1000241E4();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100055668();
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v11 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Could not read the log archive Info plist: %@", v8 category msg];

      sub_10002C358(v5);
    }

    else
    {
      id v35 = 0LL;
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v6,  0LL,  0LL,  &v35));
      id v22 = v35;
      id v8 = v22;
      if (v21) {
        BOOL v24 = v22 == 0LL;
      }
      else {
        BOOL v24 = 0;
      }
      if (v24 && (uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDictionary, v23), (objc_opt_isKindOfClass(v21, v25) & 1) != 0))
      {
        id v26 = v21;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        [v27 timeIntervalSince1970];
        unint64_t v29 = (unint64_t)v28;

        -[SDLogArchiveContainer addMetricsFromInfoPlist:forBook:withCurrentTime:]( self,  "addMetricsFromInfoPlist:forBook:withCurrentTime:",  v26,  @"Persist",  v29);
        -[SDLogArchiveContainer addMetricsFromInfoPlist:forBook:withCurrentTime:]( self,  "addMetricsFromInfoPlist:forBook:withCurrentTime:",  v26,  @"Special",  v29);
        -[SDLogArchiveContainer addMetricsFromInfoPlist:forBook:withCurrentTime:]( self,  "addMetricsFromInfoPlist:forBook:withCurrentTime:",  v26,  @"Signpost",  v29);
        v30 = sub_1000241E4();
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          sub_100055528(self, v31);
        }

        sub_10002C358(v5);
      }

      else
      {
        v32 = sub_1000241E4();
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_1000554C8();
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v34 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Could not create a plist object from the file: %@", v8 category msg];

        sub_10002C358(v5);
      }
    }
  }

  else
  {
    id v12 = sub_1000241E4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100055494(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v8 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Could not intialize a file handle from Info plist fd."];
  }
}

- (BOOL)execute
{
  if (!-[SDContainer evaluateCollectionFlags](self, "evaluateCollectionFlags")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer unit](self, "unit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "archive_arguments"));

  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 valueForKey:@"filename"]);
    if (v5) {
      v6 = (__CFString *)v5;
    }
    else {
      v6 = @"system_logs.logarchive";
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer destination](self, "destination"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v6]);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer destination](self, "destination"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"oslog_archive_error.log"]);

    id v11 = v8;
    if (mkdir((const char *)[v11 fileSystemRepresentation], 0x1FFu))
    {
      BOOL v12 = 0;
    }

    else
    {
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472LL;
      v68[2] = sub_10002CA84;
      v68[3] = &unk_100089928;
      v47 = fopen((const char *)[v10 fileSystemRepresentation], "wx");
      v68[4] = v47;
      v48 = objc_retainBlock(v68);
      id v13 = v11;
      int v49 = sub_10004D5F8((const char *)[v13 fileSystemRepresentation], 0);
      if (v49 == -1)
      {
        int v19 = *__error();
        uint64_t v20 = sub_1000241E4();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100055730((uint64_t)v13, v19, v21);
        }

        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v22 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to open log archive %@: %s", v13, strerror(v19) category msg];

        BOOL v12 = 0;
      }

      else
      {
        uint64_t v14 = getenv("SUDO_UID");
        uint64_t v15 = getenv("SUDO_GID");
        int v16 = 0;
        if (v14)
        {
          uint64_t v17 = v15;
          int v18 = 0;
          if (v15)
          {
            int v18 = strtoul(v14, 0LL, 10);
            int v16 = strtoul(v17, 0LL, 10);
          }
        }

        else
        {
          int v18 = 0;
        }

        v66[0] = 0LL;
        v66[1] = v66;
        v66[2] = 0x2020000000LL;
        char v67 = 0;
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472LL;
        v57[2] = sub_10002CB38;
        v57[3] = &unk_100089978;
        id v58 = v13;
        v62 = v66;
        uint64_t v23 = v48;
        int v63 = v49;
        int v64 = v18;
        int v65 = v16;
        id v61 = v23;
        v59 = self;
        v60 = v6;
        BOOL v24 = objc_retainBlock(v57);
        uint64_t v25 = sub_1000241E4();
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Trigger logarchive with following parameters: %@",  (uint8_t *)&buf,  0xCu);
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v27 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Trigger logarchive with following parameters: %@", v4 category msg];

        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v72 = 0x2020000000LL;
        int v73 = -1;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10002D340;
        block[3] = &unk_1000899A0;
        id v46 = (id)os_transaction_create("Generate OSLOG archive");
        id v52 = v46;
        p___int128 buf = &buf;
        id v53 = v4;
        v54 = v23;
        v45 = v24;
        id v55 = v45;
        dispatch_block_t v28 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        dispatch_async(v30, v28);

        -[SDLogArchiveContainer timeout](self, "timeout");
        dispatch_time_t v32 = dispatch_time(0LL, (uint64_t)(v31 * 1000000000.0));
        if (dispatch_block_wait(v28, v32))
        {
          v33 = sub_1000241E4();
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            -[SDLogArchiveContainer timeout](self, "timeout");
            *(_DWORD *)v69 = 134217984;
            uint64_t v70 = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "OSLogCreateArchive did not return in %f seconds",  v69,  0xCu);
          }

          id v36 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          -[SDLogArchiveContainer timeout](self, "timeout");
          objc_msgSend( v36,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"OSLogCreateArchive did not return in %f seconds",  v37);

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer archive](self, "archive"));
          if (v38)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer archive](self, "archive"));
            v40 = (void *)objc_claimAutoreleasedReturnValue([v39 tarQueue]);
            BOOL v41 = v40 == 0LL;

            if (!v41)
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer archive](self, "archive"));
              v43 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v42 tarQueue]);
              v50[0] = _NSConcreteStackBlock;
              v50[1] = 3221225472LL;
              v50[2] = sub_10002D374;
              v50[3] = &unk_100089568;
              v50[4] = v66;
              dispatch_sync(v43, v50);
            }
          }

          dispatch_block_cancel(v28);
          if (v47) {
            fputs("OSLogCreateArchive timed out\n", v47);
          }
        }

        fclose(v47);
        close(v49);
        BOOL v12 = *(_DWORD *)(*((void *)&buf + 1) + 24LL) == 0;

        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(v66, 8);
      }
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)applyContainerOverride:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"timeout"]);
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"timeout"]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
    char isKindOfClass = objc_opt_isKindOfClass(v7, v9);

    if ((isKindOfClass & 1) != 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"timeout"]);
      BOOL v12 = sub_1000241E4();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        [v11 doubleValue];
        *(_DWORD *)__int128 buf = 134217984;
        uint64_t v20 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Logarchive timeout set to %fl seconds",  buf,  0xCu);
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v11 doubleValue];
      objc_msgSend( v15,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"Logarchive timeout set to %fl seconds",  v16);

      [v11 doubleValue];
      -[SDLogArchiveContainer setTimeout:](self, "setTimeout:");
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer unit](self, "unit"));

  if (v4 && v17)
  {
    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogArchiveContainer unit](self, "unit"));
    [v18 logArchiveOverride:v4];
  }
}

- (SDLogArchiveUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (SDArchive)archive
{
  return self->_archive;
}

- (void)setArchive:(id)a3
{
}

- (NSMutableDictionary)durationMetrics
{
  return self->_durationMetrics;
}

- (void)setDurationMetrics:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end