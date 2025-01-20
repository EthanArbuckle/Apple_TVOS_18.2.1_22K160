@interface IOSurfaceSharedEventListener
- (IOSurfaceSharedEventListener)init;
- (IOSurfaceSharedEventListener)initWithDispatchQueue:(id)a3;
- (void)_notifyEventPort:(unsigned int)a3 event:(id)a4 atValue:(unint64_t)a5 block:(id)a6;
- (void)dealloc;
@end

@implementation IOSurfaceSharedEventListener

- (IOSurfaceSharedEventListener)init
{
  return -[IOSurfaceSharedEventListener initWithDispatchQueue:](self, "initWithDispatchQueue:", 0LL);
}

- (IOSurfaceSharedEventListener)initWithDispatchQueue:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IOSurfaceSharedEventListener;
  id v4 = -[IOSurfaceSharedEventListener init](&v8, sel_init);
  if (!v4) {
    return (IOSurfaceSharedEventListener *)v4;
  }
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
  }

  else
  {
    a3 = dispatch_queue_create("IOSurfaceEventNotification", 0LL);
    if (!a3)
    {
LABEL_8:

      return 0LL;
    }
  }

  *((void *)v4 + 2) = a3;
  v5 = IONotificationPortCreate(*MEMORY[0x1896086A8]);
  *((void *)v4 + 1) = v5;
  if (!v5) {
    goto LABEL_8;
  }
  IONotificationPortSetDispatchQueue(v5, *((dispatch_queue_t *)v4 + 2));
  uint64_t v6 = IOSurfaceSharedEventAddEventListener((uint64_t)v4, *((IONotificationPortRef *)v4 + 1));
  if ((_DWORD)v6)
  {
    NSLog(@"IOSurfaceSharedEventAddEventListener failed: %08x\n", v6);
    goto LABEL_8;
  }

  return (IOSurfaceSharedEventListener *)v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (self->_notificationPort)
  {
    IOSurfaceSharedEventRemoveEventListener((uint64_t)self);
    IONotificationPortSetDispatchQueue(self->_notificationPort, 0LL);
    IONotificationPortDestroy(self->_notificationPort);
  }

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release((dispatch_object_t)dispatchQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IOSurfaceSharedEventListener;
  -[IOSurfaceSharedEventListener dealloc](&v4, sel_dealloc);
}

- (void)_notifyEventPort:(unsigned int)a3 event:(id)a4 atValue:(unint64_t)a5 block:(id)a6
{
  uint64_t v6 = IOSurfaceSharedEventNotifyEventListener(self, a4, a3, a5, a6);
  if ((_DWORD)v6) {
    objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A48],  @"Internal error during notification request %08x",  v6);
  }
}

@end