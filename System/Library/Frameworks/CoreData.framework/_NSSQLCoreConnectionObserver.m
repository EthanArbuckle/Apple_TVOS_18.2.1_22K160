@interface _NSSQLCoreConnectionObserver
- (void)dealloc;
@end

@implementation _NSSQLCoreConnectionObserver

- (void)dealloc
{
  int token = self->_token;
  if (token != -1)
  {
    notify_cancel(token);
    self->_int token = -1;
  }

  queue = (dispatch_object_s *)self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0LL;
  }

  objc_storeWeak((id *)&self->_core, 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NSSQLCoreConnectionObserver;
  -[_NSSQLCoreConnectionObserver dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end