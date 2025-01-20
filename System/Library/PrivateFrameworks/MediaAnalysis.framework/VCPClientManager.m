@interface VCPClientManager
+ (id)sharedManager;
- (VCPClientManager)init;
- (void)addClientHandler:(id)a3;
- (void)removeClientHandler:(id)a3;
@end

@implementation VCPClientManager

- (VCPClientManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VCPClientManager;
  v2 = -[VCPClientManager init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysisd.VCPClientManager", 0LL);
    managementQueue = v2->_managementQueue;
    v2->_managementQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    clientHandlers = v2->_clientHandlers;
    v2->_clientHandlers = (NSMutableSet *)v5;
  }

  return v2;
}

+ (id)sharedManager
{
  if (qword_1001E6390 != -1) {
    dispatch_once(&qword_1001E6390, &stru_1001B9E48);
  }
  return (id)qword_1001E6388;
}

- (void)addClientHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    managementQueue = (dispatch_queue_s *)self->_managementQueue;
    block[1] = 3221225472LL;
    block[2] = sub_1000103D8;
    block[3] = &unk_1001B9E00;
    block[4] = self;
    id v6 = v4;
    block[0] = _NSConcreteStackBlock;
    id v8 = v4;
    dispatch_sync(managementQueue, block);

    id v4 = v6;
  }
}

- (void)removeClientHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    managementQueue = (dispatch_queue_s *)self->_managementQueue;
    block[1] = 3221225472LL;
    block[2] = sub_100010538;
    block[3] = &unk_1001B9E00;
    block[4] = self;
    id v6 = v4;
    block[0] = _NSConcreteStackBlock;
    id v8 = v4;
    dispatch_sync(managementQueue, block);

    id v4 = v6;
  }
}

- (void).cxx_destruct
{
}

@end