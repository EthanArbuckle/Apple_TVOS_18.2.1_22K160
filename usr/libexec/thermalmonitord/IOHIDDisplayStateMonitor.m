@interface IOHIDDisplayStateMonitor
- (IOHIDDisplayStateMonitor)initWithTargetQueue:(id)a3;
- (OS_dispatch_queue)targetQueue;
- (id)monitorDisplayOnStateForReason:(id)a3 handler:(id)a4;
- (void)setTargetQueue:(id)a3;
@end

@implementation IOHIDDisplayStateMonitor

- (IOHIDDisplayStateMonitor)initWithTargetQueue:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IOHIDDisplayStateMonitor;
  result = -[IOHIDDisplayStateMonitor init](&v5, "init");
  if (result) {
    result->_targetQueue = (OS_dispatch_queue *)a3;
  }
  return result;
}

- (id)monitorDisplayOnStateForReason:(id)a3 handler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100016A40;
  v5[3] = &unk_1000616C8;
  v5[4] = a4;
  return +[DarwinNotificationWatcher monitorNotificationKey:forReason:queue:handler:]( &OBJC_CLASS___DarwinNotificationWatcher,  "monitorNotificationKey:forReason:queue:handler:",  @"com.apple.iokit.hid.displayStatus",  a3,  -[IOHIDDisplayStateMonitor targetQueue](self, "targetQueue"),  v5);
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
}

@end