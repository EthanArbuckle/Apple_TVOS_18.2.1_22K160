@interface MRDProcessHIDEventManager
- (MRDProcessHIDEventManager)initWithBundleID:(id)a3 processID:(int)a4;
- (NSString)bundleID;
- (int)processID;
- (void)dispatchHIDEvent:(__IOHIDEvent *)a3;
@end

@implementation MRDProcessHIDEventManager

- (MRDProcessHIDEventManager)initWithBundleID:(id)a3 processID:(int)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRDProcessHIDEventManager;
  v7 = -[MRDProcessHIDEventManager init](&v17, "init");
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    bundleID = v7->_bundleID;
    v7->_bundleID = v8;

    v7->_processID = a4;
    v10 = (objc_class *)objc_opt_class(v7);
    Name = class_getName(v10);
    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create(Name, v13);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v14;
  }

  return v7;
}

- (void)dispatchHIDEvent:(__IOHIDEvent *)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000257AC;
  block[3] = &unk_10039A688;
  block[4] = a3;
  dispatch_async(serialQueue, block);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)processID
{
  return self->_processID;
}

- (void).cxx_destruct
{
}

@end