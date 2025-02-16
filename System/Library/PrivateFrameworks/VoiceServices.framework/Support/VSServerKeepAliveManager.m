@interface VSServerKeepAliveManager
- (BOOL)hasActiveKeepAlives;
- (VSServerKeepAliveManager)init;
- (void)cancelKeepAlive:(id)a3;
- (void)maintainKeepAlive:(id)a3;
@end

@implementation VSServerKeepAliveManager

- (VSServerKeepAliveManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSServerKeepAliveManager;
  v2 = -[VSServerKeepAliveManager init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("KeepAliveManager", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (BOOL)hasActiveKeepAlives
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000EC274;
  v5[3] = &unk_1000FAA98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)maintainKeepAlive:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EC224;
  v7[3] = &unk_1000FAB80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)cancelKeepAlive:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EC1D4;
  v7[3] = &unk_1000FAB80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void).cxx_destruct
{
}

@end