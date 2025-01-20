@interface EventDispatcher
+ (id)eventDispatcher;
+ (void)connectEventMonitorWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
- (EventDispatcher)init;
- (void)_addClient:(id)a3;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)dealloc;
- (void)postEventWithName:(id)a3 userInfo:(id)a4;
@end

@implementation EventDispatcher

- (EventDispatcher)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___EventDispatcher;
  v2 = -[EventDispatcher init](&v4, "init");
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.EventDispatcher", 0LL);
    v2->_eventMonitors = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  v2,  "_clientDisconnectNotification:",  @"XPCClientDisconnectNotification",  0LL);
  }

  return v2;
}

- (void)dealloc
{
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___EventDispatcher;
  -[EventDispatcher dealloc](&v4, "dealloc");
}

+ (id)eventDispatcher
{
  if (qword_1003A3420 != -1) {
    dispatch_once(&qword_1003A3420, &stru_10034E6B8);
  }
  return (id)qword_1003A3418;
}

- (void)postEventWithName:(id)a3 userInfo:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F4964;
  block[3] = &unk_10034AF00;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

+ (void)connectEventMonitorWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F4C30;
  v4[3] = &unk_10034E6E0;
  v4[4] = a4;
  v4[5] = a1;
  v4[6] = a3;
  objc_msgSend( +[EventDispatcher eventDispatcher](EventDispatcher, "eventDispatcher"),  "_handleMessage:connection:usingBlock:",  a3,  a4,  v4);
}

+ (void)observeXPCServer:(id)a3
{
}

- (void)_clientDisconnectNotification:(id)a3
{
  id v4 = [a3 object];
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000F4FE8;
  v6[3] = &unk_10034AE70;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(dispatchQueue, v6);
}

- (void)_addClient:(id)a3
{
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F522C;
  block[3] = &unk_10034AF28;
  block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

@end