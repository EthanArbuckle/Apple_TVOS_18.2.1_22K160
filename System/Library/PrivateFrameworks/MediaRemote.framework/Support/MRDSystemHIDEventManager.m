@interface MRDSystemHIDEventManager
- (MRDSystemHIDEventManager)init;
- (void)dealloc;
- (void)dispatchHIDEvent:(__IOHIDEvent *)a3;
@end

@implementation MRDSystemHIDEventManager

- (MRDSystemHIDEventManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRDSystemHIDEventManager;
  v2 = -[MRDSystemHIDEventManager init](&v10, "init");
  if (v2)
  {
    v2->_hidSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault);
    v3 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create(Name, v6);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDSystemHIDEventManager;
  -[MRDSystemHIDEventManager dealloc](&v3, "dealloc");
}

- (void)dispatchHIDEvent:(__IOHIDEvent *)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002561C;
  v6[3] = &unk_100399B70;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(serialQueue, v6);
}

- (void).cxx_destruct
{
}

@end