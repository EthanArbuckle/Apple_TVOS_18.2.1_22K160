@interface ADPushContextListener
- (ADPushContextListener)init;
- (void)listen;
- (void)removeDelegate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ADPushContextListener

- (ADPushContextListener)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADPushContextListener;
  v2 = -[ADPushContextListener init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create(0LL, v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)listen
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E5AD4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E5AA4;
  block[3] = &unk_1004FD968;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E5A44;
  block[3] = &unk_1004FD968;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void).cxx_destruct
{
}

@end