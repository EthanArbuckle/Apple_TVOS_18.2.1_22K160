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
- (void)logRawData:(id)a3;
- (void)scheduleFlush;
- (void)timerFlush:(id)a3;
- (void)unscheduleFlush;
@end

@implementation LogFileWriter

- (id)initFor:(id)a3 fileLabel:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LogFileWriter;
  v6 = -[LogFileWriter init](&v8, "init");
  if (!v6) {
    return v6;
  }
  id result = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ((((_BYTE)v6 + 8) & 7) == 0)
  {
    v6->_logData = (NSMutableArray *)result;
    id result = dispatch_queue_create("com.apple.iapLogWriter", 0LL);
    if ((((_BYTE)v6 + 56) & 7) == 0)
    {
      v6->_logQueue = (OS_dispatch_queue *)result;
      if ((((_BYTE)v6 + 16) & 7) == 0)
      {
        v6->_filenamePrefix = (NSString *)a3;
        if (((unint64_t)&v6->_fileLabel & 7) == 0)
        {
          v6->_fileLabel = (NSString *)a4;
          return v6;
        }
      }
    }
  }

  __break(0x5516u);
  return result;
}

- (id)initFor:(id)a3
{
  return -[LogFileWriter initFor:fileLabel:](self, "initFor:fileLabel:", a3, 0LL);
}

- (void)dealloc
{
  if ((((_BYTE)self + 16) & 7) != 0
    || (self->_filenamePrefix = 0LL, (((_BYTE)self + 24) & 7) != 0)
    || (self->_filePath = 0LL, (((_BYTE)self + 48) & 7) != 0)
    || (self->_flushTimer = 0LL, (((_BYTE)self + 8) & 7) != 0)
    || (self->_logData = 0LL, (((_BYTE)self + 32) & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    self->_fileLabel = 0LL;
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___LogFileWriter;
    -[LogFileWriter dealloc](&v3, "dealloc");
  }

- (void)logRawData:(id)a3
{
  uint64_t v7 = 0LL;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  p_logQueue = &self->_logQueue;
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
    goto LABEL_9;
  }

  v5 = (dispatch_queue_s *)*p_logQueue;
  if (!*p_logQueue)
  {
LABEL_9:
    __break(0x5510u);
    goto LABEL_10;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D0338;
  block[3] = &unk_100104618;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(v5, block);
  if (*((unsigned __int8 *)v8 + 24) >= 2u)
  {
LABEL_10:
    __break(0x550Au);
    return;
  }

  if (*((_BYTE *)v8 + 24)) {
    -[LogFileWriter flush](self, "flush");
  }
  else {
    -[LogFileWriter scheduleFlush](self, "scheduleFlush");
  }
  _Block_object_dispose(&v7, 8);
}

- (BOOL)_log:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  if (!v4)
  {
    NSLog(@"ERROR!!!: _log: dataUsingEncoding returned nil!");
    LOBYTE(v6) = 0;
    return (char)v6;
  }

  id v5 = v4;
  id v6 = [v4 length];
  p_logDataSize = &self->_logDataSize;
  if (__CFADD__(*p_logDataSize, v6))
  {
LABEL_8:
    __break(0x5500u);
    return (char)v6;
  }

  self->_logDataSize = (unint64_t)v6 + *p_logDataSize;
  if (((unint64_t)&self->_logData & 7) != 0)
  {
LABEL_7:
    __break(0x5516u);
    goto LABEL_8;
  }

  -[NSMutableArray addObject:](self->_logData, "addObject:", v5);
  LOBYTE(v6) = *p_logDataSize >> 10 > 4;
  return (char)v6;
}

- (void)log:(id)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ");
  id v6 = -[NSDateFormatter stringFromDate:](v5, "stringFromDate:", +[NSDate date](&OBJC_CLASS___NSDate, "date"));

  uint64_t v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@\n", v6, a3);
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
    goto LABEL_9;
  }

  logQueue = (dispatch_queue_s *)self->_logQueue;
  if (!logQueue)
  {
LABEL_9:
    __break(0x5510u);
    goto LABEL_10;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D05B8;
  block[3] = &unk_100104498;
  block[5] = v7;
  block[6] = &v10;
  block[4] = self;
  dispatch_sync(logQueue, block);
  if (*((unsigned __int8 *)v11 + 24) >= 2u)
  {
LABEL_10:
    __break(0x550Au);
    return;
  }

  if (*((_BYTE *)v11 + 24)) {
    -[LogFileWriter flush](self, "flush");
  }
  else {
    -[LogFileWriter scheduleFlush](self, "scheduleFlush");
  }
  _Block_object_dispose(&v10, 8);
}

- (void)log:(id)a3 data:(id)a4
{
  uint64_t v12 = 0LL;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v7, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss.SSSSSS ZZZ");
  objc_super v8 = -[NSDateFormatter stringFromDate:](v7, "stringFromDate:", +[NSDate date](&OBJC_CLASS___NSDate, "date"));

  p_logQueue = &self->_logQueue;
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
    goto LABEL_9;
  }

  uint64_t v10 = (dispatch_queue_s *)*p_logQueue;
  if (!*p_logQueue)
  {
LABEL_9:
    __break(0x5510u);
    goto LABEL_10;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D0730;
  block[3] = &unk_10010A338;
  block[4] = v8;
  block[5] = a3;
  void block[7] = a4;
  block[8] = &v12;
  block[6] = self;
  dispatch_sync(v10, block);
  if (*((unsigned __int8 *)v13 + 24) >= 2u)
  {
LABEL_10:
    __break(0x550Au);
    return;
  }

  if (*((_BYTE *)v13 + 24)) {
    -[LogFileWriter flush](self, "flush");
  }
  else {
    -[LogFileWriter scheduleFlush](self, "scheduleFlush");
  }
  _Block_object_dispose(&v12, 8);
}

- (void)createFilePath
{
  p_filePath = (id *)&self->_filePath;
  if (((unint64_t)&self->_filePath & 7) != 0
    || (self->_filePath,
        id v4 = -[NSString stringByAppendingPathComponent:]( NSHomeDirectory(),  "stringByAppendingPathComponent:",  @"Library/Logs/CrashReporter/"),  v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter),  -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", @"yyyy-MM-dd-HHmmss"),  v6 = -[NSDateFormatter stringFromDate:](v5, "stringFromDate:", +[NSDate date](&OBJC_CLASS___NSDate, "date")),  ((unint64_t)&self->_filenamePrefix & 7) != 0)
    || ((unint64_t)&self->_fileLabel & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    fileLabel = (const __CFString *)self->_fileLabel;
    if (!fileLabel) {
      fileLabel = @"packets";
    }
    id *p_filePath = -[NSString stringByAppendingPathComponent:]( v4,  "stringByAppendingPathComponent:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@.log.ips",  self->_filenamePrefix,  fileLabel,  v6));

    id v8 = *p_filePath;
  }

- (void)_flush
{
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    logQueue = (dispatch_queue_s *)self->_logQueue;
    if (logQueue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000D09C0;
      block[3] = &unk_100101C70;
      block[4] = self;
      dispatch_sync(logQueue, block);
      return;
    }
  }

  __break(0x5510u);
}

- (void)flush
{
}

- (void)scheduleFlush
{
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    logQueue = (dispatch_queue_s *)self->_logQueue;
    if (logQueue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000D0C34;
      block[3] = &unk_100101C70;
      block[4] = self;
      dispatch_sync(logQueue, block);
      return;
    }
  }

  __break(0x5510u);
}

- (void)unscheduleFlush
{
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    logQueue = (dispatch_queue_s *)self->_logQueue;
    if (logQueue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000D0D44;
      block[3] = &unk_100101C70;
      block[4] = self;
      dispatch_sync(logQueue, block);
      return;
    }
  }

  __break(0x5510u);
}

- (void)timerFlush:(id)a3
{
  p_logQueue = &self->_logQueue;
  if (((unint64_t)&self->_logQueue & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    id v4 = self;
    self = (LogFileWriter *)*p_logQueue;
    if (*p_logQueue)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_1000D0E58;
      v5[3] = &unk_100104538;
      v5[4] = a3;
      v5[5] = v4;
      dispatch_sync((dispatch_queue_t)self, v5);
      -[LogFileWriter performSelectorInBackground:withObject:]( v4,  "performSelectorInBackground:withObject:",  "_flush",  0LL);
      return;
    }
  }

  __break(0x5510u);
  -[LogFileWriter performSelectorInBackground:withObject:](self, "performSelectorInBackground:withObject:", a3);
}

@end