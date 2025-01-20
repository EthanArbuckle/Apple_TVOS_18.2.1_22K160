@interface LogFileWriter
- (BOOL)_log:(id)a3;
- (id)initFor:(id)a3;
- (id)initFor:(id)a3 fileLabel:(id)a4;
- (void)_flush;
- (void)createFilePath;
- (void)dealloc;
- (void)flush;
- (void)log:(id)a3;
- (void)log:(id)a3 data:(id)a4;
- (void)log:(id)a3 data:(id)a4 limit:(unint64_t)a5;
- (void)logRawData:(id)a3;
- (void)scheduleFlush;
- (void)timerFlush:(id)a3;
- (void)unscheduleFlush;
@end

@implementation LogFileWriter

- (id)initFor:(id)a3 fileLabel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LogFileWriter;
  v9 = -[LogFileWriter init](&v15, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    logData = v9->_logData;
    v9->_logData = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.accessoryd.LogWriter", 0LL);
    logQueue = v9->_logQueue;
    v9->_logQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_filenamePrefix, a3);
    objc_storeStrong((id *)&v9->_fileLabel, a4);
  }

  return v9;
}

- (id)initFor:(id)a3
{
  return -[LogFileWriter initFor:fileLabel:](self, "initFor:fileLabel:", a3, 0LL);
}

- (void)dealloc
{
  filenamePrefix = self->_filenamePrefix;
  self->_filenamePrefix = 0LL;

  filePath = self->_filePath;
  self->_filePath = 0LL;

  flushTimer = self->_flushTimer;
  self->_flushTimer = 0LL;

  logData = self->_logData;
  self->_logData = 0LL;

  fileLabel = self->_fileLabel;
  self->_fileLabel = 0LL;

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LogFileWriter;
  -[LogFileWriter dealloc](&v8, "dealloc");
}

- (void)logRawData:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  logQueue = (dispatch_queue_s *)self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __28__LogFileWriter_logRawData___block_invoke;
  block[3] = &unk_1001F9720;
  block[4] = self;
  id v6 = v4;
  id v8 = v6;
  v9 = &v10;
  dispatch_sync(logQueue, block);
  if (*((_BYTE *)v11 + 24)) {
    -[LogFileWriter flush](self, "flush");
  }
  else {
    -[LogFileWriter scheduleFlush](self, "scheduleFlush");
  }

  _Block_object_dispose(&v10, 8);
}

id __28__LogFileWriter_logRawData___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) += [*(id *)(a1 + 40) length];
  id result = [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = *(void *)(*(void *)(a1 + 32) + 40LL) >> 10 > 4uLL;
  return result;
}

- (BOOL)_log:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  v5 = v4;
  if (v4)
  {
    self->_logDataSize += (unint64_t)[v4 length];
    -[NSMutableArray addObject:](self->_logData, "addObject:", v5);
    BOOL v6 = self->_logDataSize >> 10 > 4;
  }

  else
  {
    NSLog(@"ERROR!!!: _log: dataUsingEncoding returned nil!");
    BOOL v6 = 0;
  }

  return v6;
}

- (void)log:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  objc_super v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v5, "stringFromDate:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@\n", v7, v4));
  logQueue = (dispatch_queue_s *)self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __21__LogFileWriter_log___block_invoke;
  block[3] = &unk_1001F9748;
  char v13 = &v14;
  block[4] = self;
  id v10 = v8;
  id v12 = v10;
  dispatch_sync(logQueue, block);
  if (*((_BYTE *)v15 + 24)) {
    -[LogFileWriter flush](self, "flush");
  }
  else {
    -[LogFileWriter scheduleFlush](self, "scheduleFlush");
  }

  _Block_object_dispose(&v14, 8);
}

id __21__LogFileWriter_log___block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _log:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

- (void)log:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[LogFileWriter log:data:limit:](self, "log:data:limit:", v7, v6, [v6 length]);
}

- (void)log:(id)a3 data:(id)a4 limit:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v10, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v10, "stringFromDate:", v11));

  logQueue = (dispatch_queue_s *)self->_logQueue;
  char v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = __32__LogFileWriter_log_data_limit___block_invoke;
  v20 = &unk_1001F9770;
  id v14 = v12;
  id v21 = v14;
  id v15 = v8;
  v25 = &v27;
  id v22 = v15;
  v23 = self;
  id v16 = v9;
  id v24 = v16;
  unint64_t v26 = a5;
  dispatch_sync(logQueue, &v17);
  if (*((_BYTE *)v28 + 24)) {
    -[LogFileWriter flush](self, "flush", v17, v18, v19, v20, v21, v22, v23);
  }
  else {
    -[LogFileWriter scheduleFlush](self, "scheduleFlush", v17, v18, v19, v20, v21, v22, v23);
  }

  _Block_object_dispose(&v27, 8);
}

void __32__LogFileWriter_log_data_limit___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@<",  *(void *)(a1 + 32),  *(void *)(a1 + 40)));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [*(id *)(a1 + 48) _log:v2];
  v3 = *(void **)(a1 + 56);
  if (v3)
  {
    id v4 = (unsigned __int8 *)[v3 bytes];
    v5 = (char *)[*(id *)(a1 + 56) length];
    unint64_t v6 = (unint64_t)v5;
    unint64_t v7 = *(void *)(a1 + 72);
    else {
      id v8 = v5;
    }
    if (v8)
    {
      do
      {
        unsigned int v9 = *v4++;
        id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%02x ", v9));

        unsigned __int8 v10 = [*(id *)(a1 + 48) _log:v14];
        uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8LL);
        char v12 = *(_BYTE *)(v11 + 24) | v10;
        id v13 = v14;
        *(_BYTE *)(v11 + 24) = v12;
        v2 = v14;
        --v8;
      }

      while (v8);
    }

    else
    {
      id v13 = v2;
    }

    id v15 = v13;
    if (v6 > v7) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [*(id *)(a1 + 48) _log:@"... "];
    }
  }

  else
  {
    id v15 = v2;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [*(id *)(a1 + 48) _log:@">\n"];
}

- (void)createFilePath
{
  filePath = self->_filePath;
  self->_filePath = 0LL;

  id v4 = NSHomeDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v13 = (id)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Library/Logs/CrashReporter/"]);

  unint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v6, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v6, "stringFromDate:", v7));

  fileLabel = (const __CFString *)self->_fileLabel;
  if (!fileLabel) {
    fileLabel = @"packets";
  }
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@.log.ips",  self->_filenamePrefix,  fileLabel,  v8));
  uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:v10]);
  char v12 = self->_filePath;
  self->_filePath = v11;
}

- (void)_flush
{
  logQueue = (dispatch_queue_s *)self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __23__LogFileWriter__flush__block_invoke;
  block[3] = &unk_1001F96F8;
  block[4] = self;
  dispatch_sync(logQueue, block);
}

void __23__LogFileWriter__flush__block_invoke(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = *(void **)(a1 + 32);
  if (v4[3])
  {
    id v4 = *(void **)(a1 + 32);
  }

  [v4 createFilePath];
  v5 = fopen((const char *)[*(id *)(*(void *)(a1 + 32) + 24) fileSystemRepresentation], "a");
  if (v5) {
    fclose(v5);
  }
LABEL_6:
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  *(void *)(*(void *)(a1 + 32) + 24LL)));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 8LL);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v11);
        objc_msgSend(v6, "seekToEndOfFile", (void)v13);
        [v6 writeData:v12];
        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;

  objc_autoreleasePoolPop(v2);
}

- (void)flush
{
}

- (void)scheduleFlush
{
  logQueue = (dispatch_queue_s *)self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __30__LogFileWriter_scheduleFlush__block_invoke;
  block[3] = &unk_1001F96F8;
  block[4] = self;
  dispatch_sync(logQueue, block);
}

void __30__LogFileWriter_scheduleFlush__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 48LL))
  {
    uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  3.0));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;

    Main = CFRunLoopGetMain();
    CFRunLoopAddTimer(Main, *(CFRunLoopTimerRef *)(*(void *)(a1 + 32) + 48LL), kCFRunLoopCommonModes);
  }

- (void)unscheduleFlush
{
  logQueue = (dispatch_queue_s *)self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __32__LogFileWriter_unscheduleFlush__block_invoke;
  block[3] = &unk_1001F96F8;
  block[4] = self;
  dispatch_sync(logQueue, block);
}

void __32__LogFileWriter_unscheduleFlush__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 48LL))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveTimer(Main, *(CFRunLoopTimerRef *)(*(void *)(a1 + 32) + 48LL), kCFRunLoopCommonModes);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = 0LL;
  }

- (void)timerFlush:(id)a3
{
  id v4 = a3;
  logQueue = (dispatch_queue_s *)self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __28__LogFileWriter_timerFlush___block_invoke;
  block[3] = &unk_1001F9798;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(logQueue, block);
  -[LogFileWriter performSelectorInBackground:withObject:]( self,  "performSelectorInBackground:withObject:",  "_flush",  0LL);
}

void __28__LogFileWriter_timerFlush___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v1 == *(void **)(v2 + 48))
  {
    *(void *)(v2 + 48) = 0LL;
  }

- (void).cxx_destruct
{
}

@end