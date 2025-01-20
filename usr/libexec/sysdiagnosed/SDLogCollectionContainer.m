@interface SDLogCollectionContainer
+ (SDLogCollectionContainer)containerWithName:(id)a3 destination:(id)a4 withDelegate:(id)a5;
+ (id)rejectionReasonToString:(unint64_t)a3;
- (BOOL)addRules:(id)a3;
- (BOOL)applyRule:(id)a3;
- (BOOL)copyFilesForDirectory:(id)a3 withStreaming:(BOOL)a4;
- (BOOL)enforceContainerSizeLimit;
- (BOOL)execute;
- (BOOL)generateSummary;
- (BOOL)maxVariety;
- (BOOL)prepareSummary;
- (BOOL)resolveHomeDirs;
- (NSMutableArray)highPriorityLogs;
- (NSMutableArray)logs;
- (SDLogCollectionDelegate)delegate;
- (id)enforceSizeOnLogs:(unint64_t)a3;
- (unint64_t)maximumSizeMB;
- (void)applyContainerOverride:(id)a3;
- (void)clearLogs;
- (void)closeSummary;
- (void)logFileToSummary:(id)a3 description:(id)a4;
- (void)rejectFile:(id)a3 forReason:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setGenerateSummary:(BOOL)a3;
- (void)setHighPriorityLogs:(id)a3;
- (void)setLogs:(id)a3;
- (void)setMaxVariety:(BOOL)a3;
- (void)setMaximumSizeMB:(unint64_t)a3;
- (void)setResolveHomeDirs:(BOOL)a3;
- (void)writeToSummary:(id)a3;
@end

@implementation SDLogCollectionContainer

+ (id)rejectionReasonToString:(unint64_t)a3
{
  if (a3 > 0xB) {
    return @"Invalid rejection reason";
  }
  else {
    return *(&off_100089C90 + a3);
  }
}

+ (SDLogCollectionContainer)containerWithName:(id)a3 destination:(id)a4 withDelegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithName:v10 andDestination:v9 withDelegate:v8];

  if (v11)
  {
    [v11 setMaximumSizeMB:5];
    [v11 setDelegate:v8];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v11 setHighPriorityLogs:v12];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v11 setLogs:v13];

    [v11 setGenerateSummary:1];
    [v11 setMaxVariety:0];
    [v11 setRuntimeChecks:0];
    [v11 setResolveHomeDirs:1];
  }

  return (SDLogCollectionContainer *)v11;
}

- (BOOL)addRules:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          [v10 resolvePaths];
          objc_msgSend(v10, "setResolveHomeDirs:", -[SDLogCollectionContainer resolveHomeDirs](self, "resolveHomeDirs"));
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer units](self, "units"));
          [v11 addObject:v10];
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }
  }

  return 1;
}

- (void)clearLogs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer highPriorityLogs](self, "highPriorityLogs"));
  [v3 removeAllObjects];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
  [v4 removeAllObjects];
}

- (BOOL)execute
{
  v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v3 = (os_activity_s *)objc_claimAutoreleasedReturnValue(-[SDContainer executionActivity](self, "executionActivity"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004B7DC;
  v5[3] = &unk_100088ED0;
  v5[4] = v2;
  v5[5] = &v6;
  os_activity_apply(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)logFileToSummary:(id)a3 description:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@, %@\n", a3, a4));
  -[SDLogCollectionContainer writeToSummary:](self, "writeToSummary:", v5);
}

- (void)rejectFile:(id)a3 forReason:(unint64_t)a4
{
  id v12 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
    char v9 = objc_opt_respondsToSelector(v8, "logCollectionContainer:didRejectFile:forReason:");

    if ((v9 & 1) != 0)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
      [v10 logCollectionContainer:self didRejectFile:v12 forReason:a4];
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer rejectionReasonToString:]( &OBJC_CLASS___SDLogCollectionContainer,  "rejectionReasonToString:",  a4));
  -[SDLogCollectionContainer logFileToSummary:description:](self, "logFileToSummary:description:", v12, v11);
}

- (BOOL)applyRule:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[SDContainer evaluateCollectionFlagsWithOverlay:withName:]( self,  "evaluateCollectionFlagsWithOverlay:withName:",  [v4 runtimeChecks],  0);
  if (!v5) {
    goto LABEL_31;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 filter]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 filter]);
    uint64_t v8 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\nAPPLYING PREDICATE %@:\n",  v7));
  }

  else
  {
    uint64_t v8 = @"\nAPPLYING DEFAULT FILTERS:\n";
  }

  BOOL v41 = v5;
  v40 = (__CFString *)v8;
  -[SDLogCollectionContainer writeToSummary:](self, "writeToSummary:", v8);
  char v9 = (void *)objc_claimAutoreleasedReturnValue([v4 getNextMatch]);
  v43 = v4;
  if (v9)
  {
    int v10 = 0;
    id v11 = 0LL;
    while (1)
    {
      id v12 = objc_autoreleasePoolPush();
      id v13 = v9;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v11 = v13;
      if (WeakRetained)
      {
        __int128 v15 = WeakRetained;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 rootPath]);
        unsigned __int8 v19 = [v16 hasPrefix:v18];

        id v11 = v13;
        if ((v19 & 1) == 0)
        {
          id v20 = objc_loadWeakRetained((id *)&self->_delegate);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 rootPath]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathComponent:v22]);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v23));
        }
      }

      unsigned __int8 v49 = 0;
      v24 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
      unsigned int v25 = [v42 fileExistsAtPath:v24 isDirectory:&v49];
      int v26 = v49;

      if (!v25 || !v26)
      {
        uint64_t v48 = 0LL;
        unsigned __int8 v27 = [v43 considerURL:v11 forRejection:&v48];
        uint64_t v28 = v48;
        v29 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
        if ((v27 & 1) != 0 || !v28) {
          -[SDLogCollectionContainer logFileToSummary:description:]( self,  "logFileToSummary:description:",  v29,  @"Added to Candidate logs");
        }
        else {
          -[SDLogCollectionContainer rejectFile:forReason:](self, "rejectFile:forReason:", v29, v48);
        }
      }

      objc_autoreleasePoolPop(v12);
      id v4 = v43;
      char v9 = (void *)objc_claimAutoreleasedReturnValue([v43 getNextMatch]);

      --v10;
      if (!v9) {
        goto LABEL_23;
      }
    }

    -[SDLogCollectionContainer writeToSummary:]( self,  "writeToSummary:",  @"Hit maximum number of candidates for rule\n");
    objc_autoreleasePoolPop(v12);
    if (v10) {
      goto LABEL_23;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: found no matches\n",  v30));
  -[SDLogCollectionContainer writeToSummary:](self, "writeToSummary:", v31);

LABEL_23:
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v4 applyFilters]);
  id v33 = [v32 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(v32);
        }
        -[SDLogCollectionContainer rejectFile:forReason:]( self,  "rejectFile:forReason:",  *(void *)(*((void *)&v44 + 1) + 8LL * (void)i),  3LL);
      }

      id v34 = [v32 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }

    while (v34);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer highPriorityLogs](self, "highPriorityLogs"));
  id v4 = v43;
  objc_msgSend( v43,  "addPathsToArray:withHighPriority:withMaxVariety:",  v37,  v38,  -[SDLogCollectionContainer maxVariety](self, "maxVariety"));

  LOBYTE(v5) = v41;
LABEL_31:

  return v5;
}

- (BOOL)enforceContainerSizeLimit
{
  uint64_t v3 = -[SDLogCollectionContainer maximumSizeMB](self, "maximumSizeMB") << 20;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n\nENFORCING SIZE LIMIT OF %lu MB ON FILTERED CANDIDATES:\n\n",  -[SDLogCollectionContainer maximumSizeMB](self, "maximumSizeMB")));
  -[SDLogCollectionContainer writeToSummary:](self, "writeToSummary:", v4);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer enforceSizeOnLogs:](self, "enforceSizeOnLogs:", v3));
  -[SDLogCollectionContainer setLogs:](self, "setLogs:", v5);

  -[SDLogCollectionContainer writeToSummary:](self, "writeToSummary:", @"\n** DONE Enforcing size limit **\n");
  return 1;
}

- (id)enforceSizeOnLogs:(unint64_t)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer highPriorityLogs](self, "highPriorityLogs"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
  char v9 = (void *)objc_claimAutoreleasedReturnValue([v7 arrayByAddingObjectsFromArray:v8]);

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v10 = v9;
  id v11 = (void *)v6;
  id obj = v10;
  id v12 = [v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    unint64_t v33 = 0LL;
    uint64_t v14 = *(void *)v35;
    unint64_t v30 = a3;
    v31 = (void *)v6;
    do
    {
      __int128 v15 = 0LL;
      do
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(obj);
        }
        __int128 v16 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)v15);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path", v30));
        uint64_t v18 = (uint64_t)[v16 sizeBytes];
        if ([v5 containsObject:v16])
        {
          unsigned __int8 v19 = self;
          id v20 = v17;
          uint64_t v21 = 9LL;
LABEL_8:
          -[SDLogCollectionContainer rejectFile:forReason:](v19, "rejectFile:forReason:", v20, v21);
          goto LABEL_20;
        }

        if ([v11 fileExistsAtPath:v17])
        {
          if (a3)
          {
            v22 = @"Added";
            if (v18 + v33 > a3)
            {
              if (![v16 supportsPartialCollection] || (uint64_t v18 = a3 - v33, a3 <= v33))
              {
                unsigned __int8 v19 = self;
                id v20 = v17;
                uint64_t v21 = 2LL;
                goto LABEL_8;
              }

              v22 = @"Partially Added";
            }
          }

          else
          {
            v22 = @"Added";
          }

          -[SDLogCollectionContainer logFileToSummary:description:](self, "logFileToSummary:description:", v17, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v16 offsets]);

          if (!v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 0LL));
            v39 = v24;
            unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v39,  1LL));
            [v16 setOffsets:v25];

            int v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v18));
            v38 = v26;
            unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v38,  1LL));
            [v16 setSizes:v27];

            a3 = v30;
          }

          v33 += v18;
          [v5 addObject:v16];
          id v11 = v31;
        }

        else
        {
          -[SDLogCollectionContainer logFileToSummary:description:]( self,  "logFileToSummary:description:",  v17,  @"NotFound");
        }

- (BOOL)prepareSummary
{
  if (-[SDLogCollectionContainer generateSummary](self, "generateSummary"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
    if (!v4
      || (BOOL v5 = (void *)v4,
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate")),
          id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 outputDirectory]),
          v7,
          v6,
          v5,
          !v7))
    {
      BOOL v23 = 1;
LABEL_20:

      return v23;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDirectory]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"summaries"]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByReplacingOccurrencesOfString:@" " withString:@"_"]);

    if ([v13 hasSuffix:@"_collection"])
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "substringToIndex:",  (_BYTE *)objc_msgSend(v13, "length") - (_BYTE *)objc_msgSend(@"_collection", "length")));

      id v13 = (void *)v14;
    }

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathExtension:@"log"]);
    __int128 v16 = (NSString *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v15]);
    summaryLocation = self->_summaryLocation;
    self->_summaryLocation = v16;

    if (([v3 fileExistsAtPath:self->_summaryLocation] & 1) != 0
      || (uint64_t v18 = self->_summaryLocation,
          NSFileAttributeKey v33 = NSFilePosixPermissions,
          __int128 v34 = &off_10009A618,
          unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1)),  LOBYTE(v18) = [v3 createFileAtPath:v18 contents:0 attributes:v19],  v19,  (v18 & 1) != 0))
    {
      id v20 = (NSFileHandle *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  self->_summaryLocation));
      summaryHandle = self->_summaryHandle;
      self->_summaryHandle = v20;

      v22 = self->_summaryHandle;
      if (v22)
      {
        -[NSFileHandle seekToEndOfFile](v22, "seekToEndOfFile");
        BOOL v23 = 1;
LABEL_19:

        goto LABEL_20;
      }

      v24 = sub_1000241E4();
      unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Couldn't create file handle for summary file",  v32,  2u);
      }

      int v26 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      unsigned __int8 v27 = v26;
      id v28 = @"Couldn't create file handle for summary file";
    }

    else
    {
      v29 = sub_1000241E4();
      unint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Couldn't create summary file.", v32, 2u);
      }

      int v26 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      unsigned __int8 v27 = v26;
      id v28 = @"Couldn't create summary file.";
    }

    [v26 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:v28];

    BOOL v23 = 0;
    goto LABEL_19;
  }

  return 0;
}

- (void)writeToSummary:(id)a3
{
  id v5 = a3;
  if (-[SDLogCollectionContainer generateSummary](self, "generateSummary") && self->_summaryHandle)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"writing summary file for %@. Closing summary file handle.",  self->_summaryLocation));
    if ((sub_100023CA4(self->_summaryHandle, 0LL, v5, v4) & 1) == 0) {
      -[SDLogCollectionContainer closeSummary](self, "closeSummary");
    }
  }
}

- (void)closeSummary
{
  if (-[SDLogCollectionContainer generateSummary](self, "generateSummary"))
  {
    summaryHandle = self->_summaryHandle;
    if (summaryHandle)
    {
      -[NSFileHandle closeFile](summaryHandle, "closeFile");
      uint64_t v4 = self->_summaryHandle;
      self->_summaryHandle = 0LL;
    }
  }

- (BOOL)copyFilesForDirectory:(id)a3 withStreaming:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
  if (v7) {
    BOOL v8 = v4;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v66 = v8;

  if (!v6)
  {
    v58 = sub_1000241E4();
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "ERROR: No delegate outputDirectory, no target location to copy files.",  buf,  2u);
    }

    char v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend( v9,  "logWithSubsystem:category:msg:",  "com.apple.sysdiagnose",  "containers",  @"ERROR: No delegate outputDirectory, no target location to copy files.");
    goto LABEL_28;
  }

  char v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer destination](self, "destination"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v11]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v12));
  v67 = (void *)objc_claimAutoreleasedReturnValue([v13 standardizedURL]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
  id v15 = [v14 count];

  if (!v15) {
    goto LABEL_24;
  }
  v61 = v12;
  v63 = v9;
  v64 = v6;
  unint64_t v16 = 0LL;
  id v17 = 0LL;
  uint64_t v18 = 0LL;
  unsigned __int8 v19 = 0LL;
  v62 = 0LL;
  v65 = self;
  do
  {
    id v20 = v17;
    v68 = objc_autoreleasePoolPush();
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v16]);

    if (v66
      && (v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate")),
          char v23 = objc_opt_respondsToSelector(v22, "streamArchiveFile:"),
          v22,
          (v23 & 1) != 0))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v17 subdirectory]);
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v67 URLByAppendingPathComponent:v24]);
      int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 standardizedURL]);

      unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v17 filename]);
      uint64_t v29 = objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:v28]);

      unint64_t v30 = objc_alloc(&OBJC_CLASS___SDArchiveFile);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v17 fileType]);
      NSFileAttributeKey v33 = -[SDArchiveFile initWithPath:target:ofType:](v30, "initWithPath:target:ofType:", v31, v29, v32);

      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v17 offsets]);
      -[SDArchiveFile setOffsets:](v33, "setOffsets:", v34);

      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v17 sizes]);
      -[SDArchiveFile setSizes:](v33, "setSizes:", v35);

      self = v65;
      id v36 = (id)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](v65, "delegate"));
      [v36 streamArchiveFile:v33];
      v62 = (void *)v29;
    }

    else
    {
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v64 stringByDeletingLastPathComponent]);
      v77[0] = v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue([v67 path]);
      v77[1] = v38;
      v39 = (void *)objc_claimAutoreleasedReturnValue([v17 subdirectory]);
      v77[2] = v39;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v77, 3LL));
      BOOL v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v40));
      int v26 = (void *)objc_claimAutoreleasedReturnValue([v41 standardizedURL]);

      unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
      NSFileAttributeKey v75 = NSFilePosixPermissions;
      v76 = &off_10009A630;
      NSFileAttributeKey v33 = (SDArchiveFile *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
      if (![v63 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:v33 error:0])
      {
        self = v65;
        goto LABEL_18;
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue([v17 filename]);
      v43 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:v42]);

      id v44 = objc_claimAutoreleasedReturnValue([v17 path]);
      __int128 v45 = (const char *)[v44 fileSystemRepresentation];
      id v36 = v43;
      LODWORD(v43) = sub_10004D748(v45, (const char *)[v36 fileSystemRepresentation], 0xFu);

      if ((_DWORD)v43)
      {
        int v46 = *__error();
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
          v57 = strerror(v46);
          *(_DWORD *)buf = 138412802;
          v70 = v56;
          __int16 v71 = 2112;
          id v72 = v36;
          __int16 v73 = 2080;
          v74 = v57;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to copy file %@ -> %@: %s",  buf,  0x20u);
        }

        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
        [v47 stderrWrite:@"Unable to copy file %@ -> %@: %s", v48, v36, strerror(v46)];

        unsigned __int8 v49 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        v50 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
        [v49 log:@"Unable to copy file %@ -> %@: %s", v50, v36, strerror(v46)];

        self = v65;
        goto LABEL_20;
      }

      self = v65;
    }

LABEL_18:
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
    char v52 = objc_opt_respondsToSelector(v51, "logCollectionContainerDidCopyFile:");

    if ((v52 & 1) != 0)
    {
      NSFileAttributeKey v33 = (SDArchiveFile *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
      -[SDArchiveFile logCollectionContainerDidCopyFile:](v33, "logCollectionContainerDidCopyFile:", v17);
LABEL_20:
      v53 = v68;

      unsigned __int8 v19 = v27;
      uint64_t v18 = v26;
      goto LABEL_22;
    }

    unsigned __int8 v19 = v27;
    uint64_t v18 = v26;
    v53 = v68;
LABEL_22:
    objc_autoreleasePoolPop(v53);
    ++v16;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
    id v55 = [v54 count];
  }

  while ((unint64_t)v55 > v16);

  char v9 = v63;
  id v6 = v64;
  id v12 = v61;
LABEL_24:

LABEL_28:
  return v6 != 0LL;
}

- (void)applyContainerOverride:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"maxSizeMB"]);
  if (v4)
  {
    id v5 = v4;
    -[SDLogCollectionContainer setMaximumSizeMB:](self, "setMaximumSizeMB:", [v4 unsignedIntegerValue]);
    BOOL v4 = v5;
  }
}

- (unint64_t)maximumSizeMB
{
  return self->_maximumSizeMB;
}

- (void)setMaximumSizeMB:(unint64_t)a3
{
  self->_maximumSizeMB = a3;
}

- (SDLogCollectionDelegate)delegate
{
  return (SDLogCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)maxVariety
{
  return self->_maxVariety;
}

- (void)setMaxVariety:(BOOL)a3
{
  self->_maxVariety = a3;
}

- (BOOL)generateSummary
{
  return self->_generateSummary;
}

- (void)setGenerateSummary:(BOOL)a3
{
  self->_generateSummary = a3;
}

- (BOOL)resolveHomeDirs
{
  return self->_resolveHomeDirs;
}

- (void)setResolveHomeDirs:(BOOL)a3
{
  self->_resolveHomeDirs = a3;
}

- (NSMutableArray)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
}

- (NSMutableArray)highPriorityLogs
{
  return self->_highPriorityLogs;
}

- (void)setHighPriorityLogs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end