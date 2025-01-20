@interface W5IOPowerManagement
- (W5IOPowerManagement)init;
- (id)updatedPowerManagementCallback;
- (void)dealloc;
- (void)setUpdatedPowerManagementCallback:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation W5IOPowerManagement

- (W5IOPowerManagement)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___W5IOPowerManagement;
  v2 = -[W5IOPowerManagement init](&v5, "init");
  if (v2
    && (v3 = dispatch_queue_create("com.apple.wifivelocityd.iopm", 0LL), (v2->_queue = (OS_dispatch_queue *)v3) != 0LL))
  {
    dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0LL);
  }

  else
  {

    return 0LL;
  }

  return v2;
}

- (void)setUpdatedPowerManagementCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerManagementCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100077380;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)dealloc
{
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___W5IOPowerManagement;
  -[W5IOPowerManagement dealloc](&v4, "dealloc");
}

- (void)startEventMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100077470;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000776D0;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)updatedPowerManagementCallback
{
  return self->_updatedPowerManagementCallback;
}

@end