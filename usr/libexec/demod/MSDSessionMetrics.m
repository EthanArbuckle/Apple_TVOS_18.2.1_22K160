@interface MSDSessionMetrics
+ (id)sharedInstance;
- (BOOL)isInternalBuild;
- (MSDSessionMetrics)init;
- (NSFileHandle)fileHandle;
- (OS_dispatch_queue)workQueue;
- (void)dealloc;
- (void)extractAndUploadTimingData:(id)a3 forServerType:(id)a4;
- (void)saveToFile:(id)a3;
- (void)saveTransactionMetric:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)synchronizeFile;
@end

@implementation MSDSessionMetrics

+ (id)sharedInstance
{
  if (qword_1001253D0 != -1) {
    dispatch_once(&qword_1001253D0, &stru_1000F9E20);
  }
  return (id)qword_1001253C8;
}

- (MSDSessionMetrics)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDSessionMetrics;
  v2 = -[MSDSessionMetrics init](&v5, "init");
  if (v2)
  {
    -[MSDSessionMetrics setIsInternalBuild:]( v2,  "setIsInternalBuild:",  os_variant_has_internal_content("com.apple.mobilestoredemod"));
    -[MSDSessionMetrics setFileHandle:](v2, "setFileHandle:", 0LL);
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.msdconnectionmetricswork", 0LL);
    -[MSDSessionMetrics setWorkQueue:](v2, "setWorkQueue:", v3);
  }

  return v2;
}

- (void)extractAndUploadTimingData:(id)a3 forServerType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[MSDSessionTimingData initWithData:forServerType:]( objc_alloc(&OBJC_CLASS___MSDSessionTimingData),  "initWithData:forServerType:",  v6,  v5);

  -[MSDSessionTimingData uploadTimingData](v7, "uploadTimingData");
}

- (void)saveTransactionMetric:(id)a3
{
  id v4 = a3;
  if (-[MSDSessionMetrics isInternalBuild](self, "isInternalBuild"))
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics workQueue](self, "workQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10003F1E8;
    v6[3] = &unk_1000F94E0;
    id v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);
  }
}

- (void)saveToFile:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](self, "fileHandle"));

  if (!v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v6, "setDateFormat:", @"dd-MM-yyyy_HH:mm");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v6, "stringFromDate:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@_%@%@",  @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata",  @"MSDNetworkData",  v8,  @".csv"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v11 = [v10 fileExistsAtPath:v9];

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v12 removeItemAtPath:v9 error:0];
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v13 createFileAtPath:v9 contents:0 attributes:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  v9));
    -[MSDSessionMetrics setFileHandle:](self, "setFileHandle:", v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](self, "fileHandle"));
  [v15 seekToEndOfFile];

  id v16 = (id)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](self, "fileHandle"));
  [v4 saveToFile:v16];
}

- (void)synchronizeFile
{
  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](obj, "fileHandle"));

  if (v2)
  {
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](obj, "fileHandle"));
    [v3 synchronizeFile];

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionMetrics fileHandle](obj, "fileHandle"));
    [v4 closeFile];

    -[MSDSessionMetrics setFileHandle:](obj, "setFileHandle:", 0LL);
  }

  objc_sync_exit(obj);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSDSessionMetrics;
  -[MSDSessionMetrics dealloc](&v3, "dealloc");
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFileHandle:(id)a3
{
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (void).cxx_destruct
{
}

@end