@interface ErrorHandlerManager
+ (id)errorHandlerManager;
+ (void)connectHandlerWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)resolveSessionWithMessage:(id)a3 connection:(id)a4;
- (ErrorHandlerManager)init;
- (id)_clientForConnection:(id)a3;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_connectHandlerWithMessage:(id)a3 connection:(id)a4;
- (void)_handleMessage:(id)a3 connection:(id)a4 withBlock:(id)a5;
- (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5;
- (void)_resolveSessionWithMessage:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)openSession:(id)a3 withCompletionBlock:(id)a4;
@end

@implementation ErrorHandlerManager

- (ErrorHandlerManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ErrorHandlerManager;
  v2 = -[ErrorHandlerManager init](&v6, "init");
  if (v2)
  {
    v3 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.itunesstored.ErrorHandlerManager.%p",  v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create(-[NSString UTF8String](v3, "UTF8String"), 0LL);

    v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.itunesstored.ErrorHandlerManager.completion.%p",  v2);
    v2->_completionQueue = (OS_dispatch_queue *)dispatch_queue_create(-[NSString UTF8String](v4, "UTF8String"), 0LL);

    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  v2,  "_clientDisconnectNotification:",  @"XPCClientDisconnectNotification",  0LL);
  }

  return v2;
}

- (void)dealloc
{
  completionQueue = (dispatch_object_s *)self->_completionQueue;
  if (completionQueue) {
    dispatch_release(completionQueue);
  }
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ErrorHandlerManager;
  -[ErrorHandlerManager dealloc](&v5, "dealloc");
}

+ (id)errorHandlerManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100158FE8;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3560 != -1) {
    dispatch_once(&qword_1003A3560, block);
  }
  return (id)qword_1003A3558;
}

- (void)openSession:(id)a3 withCompletionBlock:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100159068;
  block[3] = &unk_10034E7E0;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

+ (void)observeXPCServer:(id)a3
{
}

+ (void)connectHandlerWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)resolveSessionWithMessage:(id)a3 connection:(id)a4
{
}

- (void)_clientDisconnectNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001594F0;
  v4[3] = &unk_10034AE70;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (id)_clientForConnection:(id)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  clients = self->_clients;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v15;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v15 != v7) {
      objc_enumerationMutation(clients);
    }
    v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
    id v10 = [v9 copyInputConnection];
    id v11 = v10;
    if (v10) {
      xpc_release(v10);
    }
    if (v11 == a3 && v9 != 0LL) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (void)_connectHandlerWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100159A84;
  v4[3] = &unk_10034F298;
  v4[4] = a4;
  v4[5] = self;
  void v4[6] = a3;
  -[ErrorHandlerManager _handleMessage:connection:withReplyBlock:]( self,  "_handleMessage:connection:withReplyBlock:",  a3,  a4,  v4);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 withBlock:(id)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015A3D0;
  block[3] = &unk_10034AF28;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015A4BC;
  block[3] = &unk_10034E028;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_resolveSessionWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10015A580;
  v4[3] = &unk_10034AF00;
  v4[4] = self;
  v4[5] = a4;
  void v4[6] = a3;
  -[ErrorHandlerManager _handleMessage:connection:withBlock:](self, "_handleMessage:connection:withBlock:", a3, a4, v4);
}

@end