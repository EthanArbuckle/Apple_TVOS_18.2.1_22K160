@interface UserNotificationCenter
+ (id)defaultCenter;
- (UserNotificationCenter)init;
- (id)prepareUserNotificationWithDialog:(id)a3;
- (id)showDialog:(id)a3 withCompletionBlock:(id)a4;
- (id)showUserNotification:(__CFDictionary *)a3 withOptions:(unint64_t)a4 completionBlock:(id)a5;
- (id)showUserNotification:(id)a3 withCompletionBlock:(id)a4;
- (void)_finishUserNotification:(__CFUserNotification *)a3 withResponseFlags:(unint64_t)a4;
- (void)_showPreparedNotification:(id)a3;
- (void)cancelUserNotification:(id)a3;
- (void)cancelUserNotifications:(id)a3;
- (void)dealloc;
- (void)showPreparedNotification:(id)a3 withCompletionBlock:(id)a4;
- (void)updateUserNotification:(id)a3 withDialog:(id)a4;
- (void)updateUserNotification:(id)a3 withDictionary:(__CFDictionary *)a4 options:(unint64_t)a5;
- (void)updateUserNotification:(id)a3 withUserNotification:(id)a4;
@end

@implementation UserNotificationCenter

- (UserNotificationCenter)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UserNotificationCenter;
  v2 = -[UserNotificationCenter init](&v4, "init");
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.itunesstored.UserNotificationCenter",  0LL);
    v2->_userNotifications = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UserNotificationCenter;
  -[UserNotificationCenter dealloc](&v3, "dealloc");
}

+ (id)defaultCenter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DDA94;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A33A0 != -1) {
    dispatch_once(&qword_1003A33A0, block);
  }
  return (id)qword_1003A3398;
}

- (void)cancelUserNotification:(id)a3
{
  objc_super v4 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  -[UserNotificationCenter cancelUserNotifications:](self, "cancelUserNotifications:", v4);
}

- (void)cancelUserNotifications:(id)a3
{
  if ([a3 count])
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000DDB7C;
    v6[3] = &unk_10034AE70;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(dispatchQueue, v6);
  }

- (id)prepareUserNotificationWithDialog:(id)a3
{
  id v3 = [a3 copyUserNotification];
  objc_super v4 = -[UserNotification initWithDictionary:options:completionBlock:]( [UserNotification alloc],  "initWithDictionary:options:completionBlock:",  [v3 dictionary],  objc_msgSend(v3, "optionFlags"),  0);

  return v4;
}

- (id)showDialog:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = [a3 copyUserNotification];
  id v7 = -[UserNotificationCenter showUserNotification:withCompletionBlock:]( self,  "showUserNotification:withCompletionBlock:",  v6,  a4);

  return v7;
}

- (void)showPreparedNotification:(id)a3 withCompletionBlock:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DDF68;
  block[3] = &unk_10034E028;
  void block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (id)showUserNotification:(id)a3 withCompletionBlock:(id)a4
{
  return -[UserNotificationCenter showUserNotification:withOptions:completionBlock:]( self,  "showUserNotification:withOptions:completionBlock:",  [a3 dictionary],  objc_msgSend(a3, "optionFlags"),  a4);
}

- (id)showUserNotification:(__CFDictionary *)a3 withOptions:(unint64_t)a4 completionBlock:(id)a5
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3052000000LL;
  v12 = sub_1000DE0B0;
  v13 = sub_1000DE0C0;
  uint64_t v14 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DE0CC;
  block[3] = &unk_10034E050;
  block[6] = &v9;
  void block[7] = a3;
  block[8] = a4;
  block[4] = self;
  void block[5] = a5;
  dispatch_sync(dispatchQueue, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)updateUserNotification:(id)a3 withDialog:(id)a4
{
  id v6 = [a4 copyUserNotification];
  -[UserNotificationCenter updateUserNotification:withUserNotification:]( self,  "updateUserNotification:withUserNotification:",  a3,  v6);
}

- (void)updateUserNotification:(id)a3 withDictionary:(__CFDictionary *)a4 options:(unint64_t)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DE1E4;
  block[3] = &unk_10034E078;
  block[4] = a3;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)updateUserNotification:(id)a3 withUserNotification:(id)a4
{
}

- (void)_finishUserNotification:(__CFUserNotification *)a3 withResponseFlags:(unint64_t)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DE2BC;
  block[3] = &unk_10034E078;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

- (void)_showPreparedNotification:(id)a3
{
  if ([a3 isCanceled])
  {
    id v5 = [a3 completionBlock];
    if (!v5) {
      return;
    }
    id v6 = v5;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000DE53C;
    v11[3] = &unk_10034BB20;
    v11[4] = v6;
    v8 = v11;
  }

  else
  {
    id v9 = +[Daemon daemon](&OBJC_CLASS___Daemon, "daemon");
    -[NSMutableArray addObject:](self->_userNotifications, "addObject:", a3);
    if (-[NSMutableArray count](self->_userNotifications, "count") == (id)1) {
      [v9 takeKeepAliveAssertion:@"com.apple.itunesstored.UserNotificationCenter"];
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DE550;
    block[3] = &unk_10034AE70;
    block[4] = v9;
    void block[5] = a3;
    dispatch_queue_global_t global_queue = (dispatch_queue_global_t)&_dispatch_main_q;
    v8 = block;
  }

  dispatch_async(global_queue, v8);
}

@end