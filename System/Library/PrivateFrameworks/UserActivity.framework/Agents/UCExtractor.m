@interface UCExtractor
- (NSFileHandle)archiveReadHandle;
- (NSString)uuid;
- (NSURL)destURL;
- (UCExtractor)initWithDestinationURL:(id)a3 forArchiveUUID:(id)a4;
- (void)extractArchiveWithCompletion:(id)a3;
- (void)setArchiveReadHandle:(id)a3;
- (void)setDestURL:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UCExtractor

- (UCExtractor)initWithDestinationURL:(id)a3 forArchiveUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UCExtractor;
  v8 = -[UCExtractor init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    -[UCExtractor setDestURL:](v8, "setDestURL:", v6);
    -[UCExtractor setUuid:](v9, "setUuid:", v7);
    v10 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 readHandleForArchiveWithUUID:v10]);
    -[UCExtractor setArchiveReadHandle:](v9, "setArchiveReadHandle:", v12);
  }

  return v9;
}

- (void)extractArchiveWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100030B40;
  v8[3] = &unk_1000BD290;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (NSURL)destURL
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDestURL:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSFileHandle)archiveReadHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setArchiveReadHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end