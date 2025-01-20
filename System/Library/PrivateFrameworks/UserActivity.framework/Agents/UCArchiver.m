@interface UCArchiver
- (NSString)leaf;
- (NSURL)baseURL;
- (NSUUID)uuid;
- (UCArchiver)initWithURL:(id)a3 typeUUID:(id)a4;
- (void)archiveURLWithCompletion:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setLeaf:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWriter:(void *)a3;
- (void)writer;
@end

@implementation UCArchiver

- (UCArchiver)initWithURL:(id)a3 typeUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UCArchiver;
  v8 = -[UCArchiver init](&v13, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
    -[UCArchiver setLeaf:](v8, "setLeaf:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByDeletingLastPathComponent]);
    -[UCArchiver setBaseURL:](v8, "setBaseURL:", v10);

    v11 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v7);
    -[UCArchiver setUuid:](v8, "setUuid:", v11);
  }

  return v8;
}

- (void)archiveURLWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005CC2C;
  v8[3] = &unk_1000BD290;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (NSURL)baseURL
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)leaf
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLeaf:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (void)writer
{
  return self->_writer;
}

- (void)setWriter:(void *)a3
{
  self->_writer = a3;
}

- (void).cxx_destruct
{
}

@end