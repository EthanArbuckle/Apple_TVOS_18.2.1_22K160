@interface AppleTVMCUInterfaceListener
- (AppleTVMCUInterfaceListener)initWithInterfaceController:(id)a3;
- (AppleTVMCUPlugin)plugin;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setQueue:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation AppleTVMCUInterfaceListener

- (AppleTVMCUInterfaceListener)initWithInterfaceController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AppleTVMCUInterfaceListener;
  return -[AppleTVMCUInterfaceListener initWithInterfaceController:](&v6, "initWithInterfaceController:", a3);
}

- (void)dealloc
{
  self->_plugin = 0LL;
  queue = (dispatch_object_s *)self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppleTVMCUInterfaceListener;
  -[AppleTVMCUInterfaceListener dealloc](&v4, "dealloc");
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (a3) {
    objc_super v4 = (dispatch_object_s *)a3;
  }
  else {
    objc_super v4 = &_dispatch_main_q;
  }
  dispatch_retain(v4);
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  self->_queue = (OS_dispatch_queue *)v4;
  if (!self->_plugin)
  {
    objc_super v6 = objc_alloc_init(&OBJC_CLASS___AppleTVMCUPlugin);
    self->_plugin = v6;
    if (v6)
    {
      -[AppleTVMCUPlugin setListener:](v6, "setListener:", self);
      -[AppleTVMCUPlugin _ensureStarted](self->_plugin, "_ensureStarted");
    }
  }

- (void)unscheduleFromDispatchQueue:(id)a3
{
  queue = self->_queue;
  if (queue == a3 && queue != 0LL)
  {
    dispatch_release((dispatch_object_t)a3);
    self->_queue = 0LL;
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (AppleTVMCUPlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

@end